using System;
using System.Globalization;
using System.Windows;
using System.Windows.Data;

namespace TimetTankSix.Converters
{
    public class DoubleToGridLengthConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (!(value is double doubleValue))
                return new GridLength(0);

            if (parameter is string param && param == "*")
                return new GridLength(doubleValue, GridUnitType.Star);

            return new GridLength(doubleValue);
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is GridLength gridLength)
                return gridLength.Value;

            return 0.0;
        }
    }
}
