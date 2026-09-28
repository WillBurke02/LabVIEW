using System;
using System.Globalization;
using System.Windows.Data;

namespace TimetTankSix.Converters
{
    public class ConnectionBoolToWordConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is bool isConnected)
            {
                return isConnected ? "Connected" : "Disconnected";
            }

            return "Unknown";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is string status)
            {
                return status.Equals("Connected", StringComparison.OrdinalIgnoreCase);
            }

            return false;
        }
    }
}