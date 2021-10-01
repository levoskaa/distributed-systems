using System.Runtime.Serialization;
using System.ServiceModel;

namespace WCF2
{
    [ServiceContract(CallbackContract = typeof(IChatCallback))]
    public interface IChatService
    {
        [OperationContract] void Register(string name);
        [OperationContract] void Send(ChatMessage m);
    }

    public interface IChatCallback
    {
        [OperationContract] void Receive(ChatMessage m);
    }


    // Use a data contract as illustrated in the sample below to add composite types to service operations.
    [DataContract]
    public class ChatMessage
    {
        [DataMember] public string Sender { get; set; }
        [DataMember] public string Target { get; set; }
        [DataMember] public string Text { get; set; }
    }
}
