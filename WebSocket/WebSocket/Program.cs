using System;
using System.Collections.Generic;
using System.Net;
using System.Net.WebSockets;
using System.Text;
using System.Threading;
using System.Web.Script.Serialization;

namespace WebSocket
{
    class Program
    {
        static List<Session> sessions = new List<Session>();
        static Game game = new Game();

        static void Main(string[] args)
        {
            using (var timer = new Timer(OnTimer, null, 0, 100))
            {
                var httpListener = new HttpListener();
                httpListener.Prefixes.Add("http://localhost:8377/Design_Time_Addresses/G/");
                httpListener.Start();
                httpListener.BeginGetContext(OnHttpRequest, httpListener);
                Console.WriteLine("Service is up");
                Console.ReadLine();
                httpListener.Close();
            }
        }

        static void OnTimer(object state)
        {
            byte[] buffer;
            Session[] tempSessions;
            lock (game)
            {
                game.Step();
                string json = new JavaScriptSerializer().Serialize(game);
                buffer = Encoding.UTF8.GetBytes(json);
                tempSessions = sessions.ToArray();
            }
            foreach (var s in tempSessions)
            {
                s.WsContext.WebSocket.SendAsync(new ArraySegment<byte>(buffer), WebSocketMessageType.Text, true, CancellationToken.None);
            }
        }

        static void OnHttpRequest(IAsyncResult r)
        {
            var httpListener = (HttpListener)r.AsyncState;
            if (!httpListener.IsListening)
            {
                return;
            }
            var context = httpListener.EndGetContext(r);
            httpListener.BeginGetContext(OnHttpRequest, httpListener);
            if (context.Request.IsWebSocketRequest)
            {
                HandleWebSocketClient(context);
            }
        }

        static async void HandleWebSocketClient(HttpListenerContext context)
        {
            var ws = await context.AcceptWebSocketAsync(null);
            var buffer = new byte[10000];
            Session currentSession;
            lock (game)
            {
                sessions.Add(currentSession = new Session
                {
                    Spaceship = game.AddNewSpaceship(),
                    WsContext = ws
                });
            }
            while (true)
            {
                var packet = await ws.WebSocket.ReceiveAsync(new ArraySegment<byte>(buffer, 0, buffer.Length), CancellationToken.None);
                var clientData = new JavaScriptSerializer().Deserialize<ClientData>(Encoding.UTF8.GetString(buffer, 0, packet.Count));
                lock (game)
                {
                    game.ProcessClientData(currentSession.Spaceship, clientData);
                }
                if (packet.MessageType == WebSocketMessageType.Close)
                {
                    lock (game)
                    {
                        sessions.Remove(currentSession);
                    }
                    break;
                }
            }
        }
    }
}
