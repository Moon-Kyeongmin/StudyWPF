using Caliburn.Micro;
using MySql.Data.MySqlClient;
using SensorMonitorWPFApp.Helper;
using SensorMonitorWPFApp.Models;
using SensorMonitorWPFApp.Views;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.IO.Ports;
using System.Linq;
using System.Runtime.InteropServices;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;

namespace SensorMonitorWPFApp.ViewModels
{
    public class MainViewModel : Conductor<object>
    {
        public List<string> Serial { get; set; }
        Random rand = new Random();

        SerialPort serial;
        string selPortName;
        string connPortName;
        string connectTime = "연결시간 :";
        bool isConnected = false;
        List<SensorData> photoDatas = new List<SensorData>();
        DateTime current;

        public bool IsConnected
        {
            get => isConnected;
            set
            {
                isConnected = value;
                NotifyOfPropertyChange(() => IsConnected);
                NotifyOfPropertyChange(() => CanConnPort);
                NotifyOfPropertyChange(() => CanDisPort);
            }
        }
        public string SelPortName
        {
            get => selPortName;
            set
            {
                selPortName = value;
                NotifyOfPropertyChange(() => SelPortName);
                NotifyOfPropertyChange(() => CanConnPort);
            }
        }

        public string ConnPortName
        {
            get => connPortName;
            set
            {
                connPortName = value;
                NotifyOfPropertyChange(() => ConnPortName);
            }
        }

        public string ConnectTime
        {
            get => connectTime;
            set
            {
                connectTime = value;
                NotifyOfPropertyChange(() => ConnectTime);
            }
        }



        public void ConnPort()
        {
            IsConnected = true;
            ConnPortName = SelPortName;

            serial = new SerialPort(ConnPortName);
            serial.Open();
            serial.DataReceived += Serial_DataReceived1;


            ConnectTime = $"연결시간 : {DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss")}";
        }
        public void DisPort()
        {
            IsConnected = false;
            serial.Close();
        }


        public bool CanConnPort
        {
            get => !IsConnected && !string.IsNullOrEmpty(SelPortName);
        }
        public bool CanDisPort
        {
            get => IsConnected;
        }
        public MainViewModel()
        {
            InitControls();
        }
        public void MenuSubItemInfo()
        {
            IWindowManager manager = new WindowManager();
            dynamic settings = new ExpandoObject();
            settings.ResizeMode = ResizeMode.NoResize;
            settings.Width = 580;
            settings.Height = 280;
            manager.ShowDialog(new InfoViewModel(), null, settings);

        }

        public void BtnConnect()
        {
            serial.Open();
            ConnectTime = $"연결시간 : {DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss")}";
        }


        public void MenuSubItemClose()
        {
            System.Environment.Exit(0);
        }


        private void InitControls()
        {

            Serial = new List<string>();
            foreach (var item in SerialPort.GetPortNames())
            {
                Serial.Add(item);
            }
        }
        
        string rtbLog;
        public string RtbLog
        {
            get => rtbLog;
            set
            {
                rtbLog = value;
                NotifyOfPropertyChange(() => RtbLog);
            }
        }
        ushort prgValue;
        public ushort PrgValue
        {
            get => prgValue;
            set
            {
                prgValue = value;
                NotifyOfPropertyChange(() => PrgValue);
            }
        }
        string recvValue;
        public string RecvValue
        {
            get => recvValue;
            set
            {
                recvValue = value;
                NotifyOfPropertyChange(() => RecvValue);
            }
        }

        string sensorCnt;
        public string SensorCnt
        {
            get => sensorCnt;
            set
            {
                sensorCnt = value;
                NotifyOfPropertyChange(() => SensorCnt);
            }
        }
        
        private void Serial_DataReceived1(object sender, SerialDataReceivedEventArgs e)
        {
            RecvValue = serial.ReadLine();

            try
            {
                if (ushort.Parse(RecvValue) > 1023) return;
                PrgValue = ushort.Parse(RecvValue);
                //if (PrgValue > 1023) return;
                current = DateTime.Now;//.ToString("yyyy-MM-dd hh:mm:ss");
                SensorData data = new SensorData(current, PrgValue);
                InsertDataToDB(data);
                photoDatas.Add(data);

                SensorCnt = photoDatas.Count.ToString();
                RtbLog += ($"{current.ToString()} {RecvValue}");
            }
            catch (Exception ex)
            {
                RtbLog += ($"{DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss")} {ex.Message}\n");
            }
        }
        private void InsertDataToDB(SensorData data)
        {
            string strQuery = "INSERT INTO sensordatatbl " +
                " (Date, Value) " +
                " VALUES " +
                " (@Date, @Value) ";

            using (MySqlConnection conn = new MySqlConnection(Commons.STRCONN))
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(strQuery, conn);
                MySqlParameter paramDate = new MySqlParameter("@Date", MySqlDbType.DateTime)
                {
                    Value = data.Date
                };
                cmd.Parameters.Add(paramDate);
                MySqlParameter paramValue = new MySqlParameter("@Value", MySqlDbType.Int32)
                {
                    Value = data.Value
                };
                cmd.Parameters.Add(paramValue);
                cmd.ExecuteNonQuery();
            }
        }
    }
}
