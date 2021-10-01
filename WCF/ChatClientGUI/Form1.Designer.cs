
namespace ChatClientGUI
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.fromTextBox = new System.Windows.Forms.TextBox();
            this.nameLabel = new System.Windows.Forms.Label();
            this.registerButton = new System.Windows.Forms.Button();
            this.historyTextBox = new System.Windows.Forms.TextBox();
            this.targetLabel = new System.Windows.Forms.Label();
            this.targetTextBox = new System.Windows.Forms.TextBox();
            this.textTextBox = new System.Windows.Forms.TextBox();
            this.textLabel = new System.Windows.Forms.Label();
            this.sendButton = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // fromTextBox
            // 
            this.fromTextBox.AccessibleName = "";
            this.fromTextBox.Location = new System.Drawing.Point(65, 12);
            this.fromTextBox.Name = "fromTextBox";
            this.fromTextBox.Size = new System.Drawing.Size(251, 22);
            this.fromTextBox.TabIndex = 1;
            // 
            // nameLabel
            // 
            this.nameLabel.AutoSize = true;
            this.nameLabel.Location = new System.Drawing.Point(13, 13);
            this.nameLabel.Name = "nameLabel";
            this.nameLabel.Size = new System.Drawing.Size(45, 17);
            this.nameLabel.TabIndex = 2;
            this.nameLabel.Text = "Name";
            // 
            // registerButton
            // 
            this.registerButton.Location = new System.Drawing.Point(322, 9);
            this.registerButton.Name = "registerButton";
            this.registerButton.Size = new System.Drawing.Size(75, 28);
            this.registerButton.TabIndex = 3;
            this.registerButton.Text = "Register";
            this.registerButton.UseVisualStyleBackColor = true;
            this.registerButton.Click += new System.EventHandler(this.registerButton_Click);
            // 
            // historyTextBox
            // 
            this.historyTextBox.Location = new System.Drawing.Point(16, 46);
            this.historyTextBox.Multiline = true;
            this.historyTextBox.Name = "historyTextBox";
            this.historyTextBox.Size = new System.Drawing.Size(381, 338);
            this.historyTextBox.TabIndex = 4;
            // 
            // targetLabel
            // 
            this.targetLabel.AutoSize = true;
            this.targetLabel.Location = new System.Drawing.Point(12, 402);
            this.targetLabel.Name = "targetLabel";
            this.targetLabel.Size = new System.Drawing.Size(50, 17);
            this.targetLabel.TabIndex = 5;
            this.targetLabel.Text = "Target";
            // 
            // targetTextBox
            // 
            this.targetTextBox.Location = new System.Drawing.Point(73, 402);
            this.targetTextBox.Name = "targetTextBox";
            this.targetTextBox.Size = new System.Drawing.Size(243, 22);
            this.targetTextBox.TabIndex = 6;
            // 
            // textTextBox
            // 
            this.textTextBox.Location = new System.Drawing.Point(73, 431);
            this.textTextBox.Name = "textTextBox";
            this.textTextBox.Size = new System.Drawing.Size(243, 22);
            this.textTextBox.TabIndex = 7;
            // 
            // textLabel
            // 
            this.textLabel.AutoSize = true;
            this.textLabel.Location = new System.Drawing.Point(16, 431);
            this.textLabel.Name = "textLabel";
            this.textLabel.Size = new System.Drawing.Size(35, 17);
            this.textLabel.TabIndex = 8;
            this.textLabel.Text = "Text";
            // 
            // sendButton
            // 
            this.sendButton.Location = new System.Drawing.Point(323, 400);
            this.sendButton.Name = "sendButton";
            this.sendButton.Size = new System.Drawing.Size(74, 53);
            this.sendButton.TabIndex = 9;
            this.sendButton.Text = "Send";
            this.sendButton.UseVisualStyleBackColor = true;
            this.sendButton.Click += new System.EventHandler(this.sendButton_ClickAsync);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(411, 471);
            this.Controls.Add(this.sendButton);
            this.Controls.Add(this.textLabel);
            this.Controls.Add(this.textTextBox);
            this.Controls.Add(this.targetTextBox);
            this.Controls.Add(this.targetLabel);
            this.Controls.Add(this.historyTextBox);
            this.Controls.Add(this.registerButton);
            this.Controls.Add(this.nameLabel);
            this.Controls.Add(this.fromTextBox);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.TextBox fromTextBox;
        private System.Windows.Forms.Label nameLabel;
        private System.Windows.Forms.Button registerButton;
        private System.Windows.Forms.TextBox historyTextBox;
        private System.Windows.Forms.Label targetLabel;
        private System.Windows.Forms.TextBox targetTextBox;
        private System.Windows.Forms.TextBox textTextBox;
        private System.Windows.Forms.Label textLabel;
        private System.Windows.Forms.Button sendButton;
    }
}

