using System;
using System.IO;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Diagnostics;
using Flash.External;

namespace FlashServer
{
    public partial class FlashSever : Form
    {

        //private AxShockwaveFlashObjects.AxShockwaveFlash TextGenerator;
        private bool appReady = false;
        private bool swfReady = false;
        private ExternalInterfaceProxy proxy;

        public FlashSever()
        {
            InitializeComponent();
            
            String swfPath = Directory.GetCurrentDirectory() + Path.DirectorySeparatorChar + "TextGenerator.swf";
            this.TextGenerator.LoadMovie(0, swfPath);

            // Create the proxy and register this app to receive notification when the proxy receives
            // a call from ActionScript
            proxy = new ExternalInterfaceProxy(TextGenerator);
            proxy.ExternalInterfaceCall += new ExternalInterfaceCallEventHandler(proxy_ExternalInterfaceCall);

            appReady = true;
            Trace.WriteLine("App Init");

        }

        /// <summary>
        /// Called by the proxy when an ActionScript ExternalInterface call
        /// is made by the SWF
        /// </summary>
        /// <param name="sender">The object raising the event</param>
        /// <param name="e">The event arguments associated with the event</param>
        /// <returns>The response to the function call.</returns>
        private object proxy_ExternalInterfaceCall(object sender, ExternalInterfaceCallEventArgs e)
        {
            switch (e.FunctionCall.FunctionName)
            {
                case "isReady":
                    return isReady();
                case "setSWFIsReady":
                    setSWFIsReady();
                    return null;
                case "createImage":
                    createImage((string)e.FunctionCall.Arguments[0]);
                    return null;
                default:
                    return null;
            }
        }

        #region Methods called by Flash Player

        /// <summary>
        /// Called to check if the page has initialized and JavaScript is available
        /// </summary>
        /// <returns></returns>
        private bool isReady()
        {
           return appReady;
        }

        /// <summary>
        /// Called to notify the page that the SWF has set it's callbacks
        /// </summary>
        private void setSWFIsReady()
        {
            // record that the SWF has registered it's functions (i.e. that C#
            // can safely call the ActionScript functions)
            swfReady = true;

            //updateStatus();
        }

        private void createImage(String imageString)
        {
            byte[] binaryData = System.Convert.FromBase64String(imageString);
            MemoryStream ms = new MemoryStream(binaryData);
            Image recoveredImage = Image.FromStream(ms);
            recoveredImage.Save("c:\\ServiceImages\\" + Path.GetRandomFileName() + ".png");
        }

        #endregion

        #region Other Private Methods

        /// <summary>
        /// Used to send a message to the SWF File.
        /// </summary>
        /// <param name="message">The message to send.</param>
        private void sendMessage(string message)
        {
            if (swfReady)
            {
                // call the newMessage function in ActionScript
                proxy.Call("newMessage", message);
            }
        }

        #endregion

        private void send_Click(object sender, EventArgs e)
        {
            this.sendMessage(message.Text);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            proxy.Call("generateImage", imageText.Text, imageScale.Text);
        }
    }
}
