using Client.ServiceReference1;
using System;

namespace Client
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var proxy = new EchoServiceClient())
            {
                Console.WriteLine(proxy.Echo("Hello, Leo"));
                Console.ReadLine();
            }
        }
    }
}
