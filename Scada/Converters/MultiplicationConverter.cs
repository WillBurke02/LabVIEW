using System;
using System.Globalization;
using System.Windows.Data;

namespace TimetTankSix.Converters
{
    public class MultiplicationConverter : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
        {
            if (values.Length < 2 || values[0] == null || values[1] == null)
                return 0.0;

            if (double.TryParse(values[0].ToString(), out double value1) &&
                double.TryParse(values[1].ToString(), out double value2))
            {
                return value1 * value2;
            }
            return 0.0;
        }

        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
