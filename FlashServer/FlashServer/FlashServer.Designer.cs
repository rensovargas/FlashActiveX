namespace FlashServer
{
    partial class FlashSever
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FlashSever));
            this.TextGenerator = new AxShockwaveFlashObjects.AxShockwaveFlash();
            this.send = new System.Windows.Forms.Button();
            this.message = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.imageScale = new System.Windows.Forms.NumericUpDown();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.imageText = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.TextGenerator)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.imageScale)).BeginInit();
            this.SuspendLayout();
            // 
            // TextGenerator
            // 
            this.TextGenerator.Enabled = true;
            this.TextGenerator.Location = new System.Drawing.Point(13, 13);
            this.TextGenerator.Name = "TextGenerator";
            this.TextGenerator.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("TextGenerator.OcxState")));
            this.TextGenerator.Size = new System.Drawing.Size(329, 239);
            this.TextGenerator.TabIndex = 0;
            // 
            // send
            // 
            this.send.Location = new System.Drawing.Point(267, 274);
            this.send.Name = "send";
            this.send.Size = new System.Drawing.Size(75, 24);
            this.send.TabIndex = 1;
            this.send.Text = "Send";
            this.send.UseVisualStyleBackColor = true;
            this.send.Click += new System.EventHandler(this.send_Click);
            // 
            // message
            // 
            this.message.Location = new System.Drawing.Point(13, 277);
            this.message.Name = "message";
            this.message.Size = new System.Drawing.Size(248, 20);
            this.message.TabIndex = 2;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(267, 484);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 4;
            this.button1.Text = "Get Image";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // imageScale
            // 
            this.imageScale.Location = new System.Drawing.Point(229, 485);
            this.imageScale.Name = "imageScale";
            this.imageScale.Size = new System.Drawing.Size(31, 20);
            this.imageScale.TabIndex = 6;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(14, 306);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(60, 13);
            this.label1.TabIndex = 7;
            this.label1.Text = "Image Text";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(189, 489);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(34, 13);
            this.label2.TabIndex = 8;
            this.label2.Text = "Scale";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(14, 260);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(50, 13);
            this.label3.TabIndex = 9;
            this.label3.Text = "Message";
            // 
            // imageText
            // 
            this.imageText.Location = new System.Drawing.Point(13, 322);
            this.imageText.Multiline = true;
            this.imageText.Name = "imageText";
            this.imageText.Size = new System.Drawing.Size(329, 154);
            this.imageText.TabIndex = 5;
            this.imageText.Text = "Enter text for image";
            // 
            // FlashSever
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(354, 515);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.imageScale);
            this.Controls.Add(this.imageText);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.message);
            this.Controls.Add(this.send);
            this.Controls.Add(this.TextGenerator);
            this.Name = "FlashSever";
            this.Text = "Flash Server";
            ((System.ComponentModel.ISupportInitialize)(this.TextGenerator)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.imageScale)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private AxShockwaveFlashObjects.AxShockwaveFlash TextGenerator;
        private System.Windows.Forms.Button send;
        private System.Windows.Forms.TextBox message;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.NumericUpDown imageScale;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox imageText;

    }
}

