using ChatClientGUI.ServiceReference1;
using System;
using System.ServiceModel;
using System.Windows.Forms;

namespace ChatClientGUI
{
    public partial class Form1 : Form, IChatServiceCallback
    {
        private readonly ChatServiceClient proxy;

        public Form1()
        {
            InitializeComponent();
            proxy = new ChatServiceClient(new InstanceContext(this));
        }

        public void Receive(ChatMessage m)
        {
            historyTextBox.AppendLine($"{DateTime.Now:HH:mm:ss} | {m.Sender}: {m.Text}");
        }

        private void registerButton_Click(object sender, EventArgs e)
        {
            var name = fromTextBox.Text;
            proxy.Register(name);
        }

        private async void sendButton_ClickAsync(object sender, EventArgs e)
        {
            var message = new ChatMessage
            {
                Sender = fromTextBox.Text,
                Target = targetTextBox.Text,
                Text = textTextBox.Text
            };
            await proxy.SendAsync(message);
            textTextBox.Clear();
        }
    }
}
