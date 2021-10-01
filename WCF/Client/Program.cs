using Client.ServiceReference1;
using System;
using System.Diagnostics;

namespace Client
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var proxy = new EchoServiceClient())
            {
                Console.WriteLine(proxy.Echo("Hello, Leo"));
                var sw = Stopwatch.StartNew();
                var task = proxy.LongEchoAsync("Hello, Leo");
                while (!task.Wait(new Random().Next(100, 1000)))
                    Console.WriteLine(sw.ElapsedMilliseconds);
                Console.WriteLine($"{sw.ElapsedMilliseconds}: {task.Result}");
                Console.ReadLine();
            }
        }
    }
}
