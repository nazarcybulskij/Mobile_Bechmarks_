using System;
using System.Collections.Generic;
using System.ComponentModel;
using Xamarin.Forms;

namespace demo3
{
    // Learn more about making custom code visible in the Xamarin.Forms previewer
    // by visiting https://aka.ms/xamarinforms-previewer
    [DesignTimeVisible(false)]
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }

        const int NumIters = 100;
        const int GaussLegendreIterats = 10000000;
        const int BorweinIterats = 1000000;


        int getTime() {
            // Get current date and time 
            DateTime dateTimeNow = DateTime.Now;
            // Calculate the number of milliseconds since midnight
            var sec = (dateTimeNow.Hour * 3600000) + (dateTimeNow.Minute * 60000) + (dateTimeNow.Second * 1000) + dateTimeNow.Millisecond;
            return sec;
        }

        void Handle_RunGaussLegendre(object sender, System.EventArgs e)
        {
            Calculator calculator = new Calculator();
            var start = getTime();
            for (int i = 0; i < NumIters; i++)
            {
                calculator.gaussLegendre(GaussLegendreIterats);
            }
            var finish = getTime();
            double gaussLegendreTime = (finish - start) / NumIters;
            gaussLegendreResult.Text = $"{gaussLegendreTime} ms per iteration";
        }


        void Handle_RunBorwein(object sender, System.EventArgs e)
        {
            Calculator calculator = new Calculator();
            var start = getTime();
            for (int i = 0; i < NumIters; i++)
            {
                calculator.borwein(BorweinIterats);
            }
            var finish = getTime();
            double borweinTime = (finish - start)/NumIters;
            borweinResult.Text = $"{borweinTime} ms per iteration";

 
        }
    }
}
