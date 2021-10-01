using System.ServiceModel;
using System.Threading.Tasks;

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

        [OperationContract]
        async Task<string> LongEcho(string text)
        {
            await Task.Delay(5000);
            return text;
        }
    }
}
