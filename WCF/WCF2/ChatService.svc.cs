using System;
using System.Collections.Concurrent;
using System.ServiceModel;

namespace WCF2
{
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.Single, ConcurrencyMode = ConcurrencyMode.Multiple)]
    public class ChatService : IChatService
    {
        ConcurrentDictionary<string, IChatCallback> clients = new ConcurrentDictionary<string, IChatCallback>();

        public void Register(string name)
        {
            clients.TryAdd(name, OperationContext.Current.GetCallbackChannel<IChatCallback>());
        }

        public void Send(ChatMessage m)
        {
            clients.TryGetValue(m.Target, out var client);
            client.Receive(m);
        }
    }
}
