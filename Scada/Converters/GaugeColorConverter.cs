using System;
using System.Globalization;
using System.Windows;
using System.Windows.Data;
using System.Windows.Media;

namespace TimetTankSix.Converters
{
    public class GaugeColorConverter : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
        {
            if (values.Length < 9) return null;

            bool useGradient = (bool)values[0];
            var gaugeColor = (System.Windows.Media.Brush)values[1];
            var lowColor = (System.Windows.Media.Color)values[2];
            var highColor = (System.Windows.Media.Color)values[3];
            double value = (double)values[4];
            double minValue = (double)values[5];
            double maxValue = (double)values[6];
            double thresholdValue = (double)values[7];
            var thresholdColor = (System.Windows.Media.Brush)values[8];

            if (!double.IsNaN(thresholdValue) && value >= thresholdValue)
                return thresholdColor;

            if (!useGradient)
                return gaugeColor;

            double normalized = (value - minValue) / (maxValue - minValue);
            normalized = Math.Max(0, Math.Min(1, normalized));

            var gradientBrush = new LinearGradientBrush();
            gradientBrush.StartPoint = new Point(0, 0);
            gradientBrush.EndPoint = new Point(1, 0);

            var startColor = lowColor;
            var endColor = highColor;

            gradientBrush.GradientStops.Add(new GradientStop(startColor, 0.0));
            gradientBrush.GradientStops.Add(new GradientStop(endColor, 1.0));

            return gradientBrush;
        }

        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
