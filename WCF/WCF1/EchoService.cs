using System.ServiceModel;

namespace WCF1
{
    [ServiceContract]
    class EchoService
    {
        [OperationContract]
        string Echo(string text)
        {
            return "W9HL9H";
        }
    }
}
