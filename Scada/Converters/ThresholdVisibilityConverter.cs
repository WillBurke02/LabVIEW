using System;
using System.Globalization;
using System.Windows;
using System.Windows.Data;

namespace TimetTankSix.Converters
{
    public class ThresholdVisibilityConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value == null)
                return Visibility.Collapsed;

            if (value is double doubleValue)
            {
                return double.IsNaN(doubleValue) || doubleValue == 0
                    ? Visibility.Collapsed
                    : Visibility.Visible;
            }

            if (value is bool boolValue)
            {
                return boolValue ? Visibility.Visible : Visibility.Collapsed;
            }

            return Visibility.Visible;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException("ConvertBack is not implemented for ThresholdVisibilityConverter");
        }
    }
}
