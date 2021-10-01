using ChatClientGUI.ServiceReference1;
using System;
using System.ServiceModel;
using System.Windows.Forms;

namespace ChatClientGUI
{
    public partial class Form1 : Form, IChatServiceCallback
    {
        public Form1()
        {
            InitializeComponent();
        }

        public void Receive(ChatMessage m)
        {
            MessageBox.Show(m.Text);
        }

        private void button1_Click(object sender, System.EventArgs e)
        {
            var proxy = new ChatServiceClient(new InstanceContext(this));
            var name = Guid.NewGuid().ToString();
            proxy.Register(name);
            proxy.SendAsync(new ChatMessage { Target = name, Text = "Hello, Leo" });
        }
    }
}
