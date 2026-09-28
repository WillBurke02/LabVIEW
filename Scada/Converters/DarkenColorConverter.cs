using System;
using System.Globalization;
using System.Windows.Data;
using System.Windows.Media;

namespace TimetTankSix.Converters
{
    public class DarkenColorConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is Color color && parameter is string factorStr && double.TryParse(factorStr, out double factor))
            {
                return Color.FromArgb(
                    color.A,
                    (byte)(color.R * factor),
                    (byte)(color.G * factor),
                    (byte)(color.B * factor)
                );
            }
            return value;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
