using System;
using System.Linq;
using System.Net;
using System.Net.WebSockets;
using System.Threading;
using System.Threading.Tasks;

namespace WebSocket
{
    class Program
    {
        static void Main(string[] args)
        {
            var httpListener = new HttpListener();
            httpListener.Prefixes.Add("http://localhost:8377/Design_Time_Addresses/G/");
            httpListener.Start();
            httpListener.BeginGetContext(OnHttpRequest, httpListener);
            Console.WriteLine("Service is up");
            Console.ReadLine();
            httpListener.Stop();
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
            while (true)
            {
                var packet = await ws.WebSocket.ReceiveAsync(
                new ArraySegment<byte>(buffer, 0, buffer.Length), CancellationToken.None);
                if (packet.MessageType == WebSocketMessageType.Close) {
                    return;
                }
                Array.Reverse(buffer);
                await ws.WebSocket.SendAsync(new ArraySegment<byte>(buffer, buffer.Length - packet.Count, packet.Count),
                WebSocketMessageType.Text, true, CancellationToken.None);
            }
        }
    }
}
