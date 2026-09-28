using System;
using System.Globalization;
using System.Windows;
using System.Windows.Data;

namespace TimetTankSix.Converters
{
    public class NormalizedPositionConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (!(value is double normalizedValue))
                return 0.0;

            double scale = 100.0;

            if (parameter is double paramValue)
                scale = paramValue;

            return normalizedValue * scale;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return DependencyProperty.UnsetValue;
        }
    }
}
