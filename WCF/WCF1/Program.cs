using System;
using System.ServiceModel;
using System.ServiceModel.Description;

namespace WCF1
{
    class Program
    {
        static void Main(string[] args)
        {
            var baseAddress = new Uri("http://localhost:8733/Design_Time_Addresses/Echo");
            using (ServiceHost selfHost = new ServiceHost(typeof(EchoService), baseAddress))
            {
                selfHost.AddServiceEndpoint(typeof(EchoService), new BasicHttpBinding(), "EchoService");
                selfHost.Description.Behaviors.Add(new ServiceMetadataBehavior { HttpGetEnabled = true });
                selfHost.Open();
                Console.WriteLine("The service is ready. Press ENTER to exit.");
                Console.ReadLine();
            }
        }
    }
}
