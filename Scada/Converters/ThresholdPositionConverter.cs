using System;
using System.Windows.Data;

namespace TimetTankSix.Converters
{
    public class ThresholdPositionConverter : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            if (values.Length < 4 ||
                !(values[0] is double thresholdValue) ||
                !(values[1] is double minValue) ||
                !(values[2] is double maxValue) ||
                !(values[3] is double canvasHeight))
                return 0.0;

            double range = maxValue - minValue;
            if (range <= 0 || double.IsNaN(thresholdValue))
                return 0.0;

            double normalized = Math.Max(0, Math.Min(1, 1.0 - (thresholdValue - minValue) / range));

            return normalized * canvasHeight;
        }

        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, System.Globalization.CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
