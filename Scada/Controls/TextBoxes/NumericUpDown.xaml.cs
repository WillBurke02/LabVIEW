using System;
using System.Windows;
using System.Windows.Controls;

namespace TimetTankSix.Controls
{
    public partial class NumericUpDown : UserControl
    {
        public enum LabelTextPosition
        {
            Left,
            Right,
            Top,
            Bottom
        }

        public NumericUpDown()
        {
            InitializeComponent();
        }

        // Value Property
        public static readonly DependencyProperty ValueProperty =
            DependencyProperty.Register(nameof(Value), typeof(double), typeof(NumericUpDown),
                new FrameworkPropertyMetadata(0.0, FrameworkPropertyMetadataOptions.BindsTwoWayByDefault,
                    OnValueChanged, CoerceValue));

        public double Value
        {
            get => (double)GetValue(ValueProperty);
            set => SetValue(ValueProperty, value);
        }

        // Minimum Property
        public static readonly DependencyProperty MinimumProperty =
            DependencyProperty.Register(nameof(Minimum), typeof(double), typeof(NumericUpDown),
                new PropertyMetadata(double.MinValue, OnMinMaxChanged));

        public double Minimum
        {
            get => (double)GetValue(MinimumProperty);
            set => SetValue(MinimumProperty, value);
        }

        // Maximum Property
        public static readonly DependencyProperty MaximumProperty =
            DependencyProperty.Register(nameof(Maximum), typeof(double), typeof(NumericUpDown),
                new PropertyMetadata(double.MaxValue, OnMinMaxChanged));

        public double Maximum
        {
            get => (double)GetValue(MaximumProperty);
            set => SetValue(MaximumProperty, value);
        }

        // Increment Property
        public static readonly DependencyProperty IncrementProperty =
            DependencyProperty.Register(nameof(Increment), typeof(double), typeof(NumericUpDown),
                new PropertyMetadata(1.0));

        public double Increment
        {
            get => (double)GetValue(IncrementProperty);
            set => SetValue(IncrementProperty, value);
        }

        // DecimalPlaces Property
        public static readonly DependencyProperty DecimalPlacesProperty =
            DependencyProperty.Register(nameof(DecimalPlaces), typeof(int), typeof(NumericUpDown),
                new PropertyMetadata(0, OnDecimalPlacesChanged));

        public int DecimalPlaces
        {
            get => (int)GetValue(DecimalPlacesProperty);
            set => SetValue(DecimalPlacesProperty, value);
        }

        // Label Property
        public static readonly DependencyProperty LabelProperty =
            DependencyProperty.Register(nameof(Label), typeof(string), typeof(NumericUpDown),
                new PropertyMetadata(string.Empty));

        public string Label
        {
            get => (string)GetValue(LabelProperty);
            set => SetValue(LabelProperty, value);
        }

        public static readonly DependencyProperty LabelSizeProperty =
            DependencyProperty.Register(
                nameof(LabelSize),
                typeof(double),
                typeof(NumericUpDown),
                new PropertyMetadata(12.0));

        public double LabelSize
        {
            get => (double)GetValue(LabelSizeProperty);
            set => SetValue(LabelSizeProperty, value);
        }

        public static readonly DependencyProperty LabelPositionProperty =
    DependencyProperty.Register(
        nameof(LabelPosition),
        typeof(LabelTextPosition),
        typeof(NumericUpDown),
        new PropertyMetadata(LabelTextPosition.Left, OnLabelPositionChanged));


        public LabelTextPosition LabelPosition
        {
            get => (LabelTextPosition)GetValue(LabelPositionProperty);
            set => SetValue(LabelPositionProperty, value);
        }

        // ButtonBackground Property
        public static readonly DependencyProperty ButtonBackgroundProperty =
            DependencyProperty.Register(nameof(ButtonBackground), typeof(System.Windows.Media.Brush), typeof(NumericUpDown),
                new PropertyMetadata(System.Windows.Media.Brushes.LightGray));

        public System.Windows.Media.Brush ButtonBackground
        {
            get => (System.Windows.Media.Brush)GetValue(ButtonBackgroundProperty);
            set => SetValue(ButtonBackgroundProperty, value);
        }

        // ButtonForeground Property
        public static readonly DependencyProperty ButtonForegroundProperty =
            DependencyProperty.Register(nameof(ButtonForeground), typeof(System.Windows.Media.Brush), typeof(NumericUpDown),
                new PropertyMetadata(System.Windows.Media.Brushes.Black));

        public System.Windows.Media.Brush ButtonForeground
        {
            get => (System.Windows.Media.Brush)GetValue(ButtonForegroundProperty);
            set => SetValue(ButtonForegroundProperty, value);
        }

        // Label Foreground Property
        public static readonly DependencyProperty LabelForegroundProperty =
            DependencyProperty.Register(nameof(LabelForeground), typeof(System.Windows.Media.Brush), typeof(NumericUpDown),
                new PropertyMetadata(System.Windows.Media.Brushes.Black));

        public System.Windows.Media.Brush LabelForeground
        {
            get => (System.Windows.Media.Brush)GetValue(LabelForegroundProperty);
            set => SetValue(LabelForegroundProperty, value);
        }

        // Label Background Property
        public static readonly DependencyProperty LabelBackgroundProperty =
            DependencyProperty.Register(nameof(LabelBackground), typeof(System.Windows.Media.Brush), typeof(NumericUpDown),
                new PropertyMetadata(System.Windows.Media.Brushes.Transparent));

        public System.Windows.Media.Brush LabelBackground
        {
            get => (System.Windows.Media.Brush)GetValue(LabelBackgroundProperty);
            set => SetValue(LabelBackgroundProperty, value);
        }
        // ControlBorderBrush Property
        public static readonly DependencyProperty ControlBorderBrushProperty =
            DependencyProperty.Register(nameof(ControlBorderBrush), typeof(System.Windows.Media.Brush), typeof(NumericUpDown),
                new PropertyMetadata(System.Windows.Media.Brushes.Gray));

        public System.Windows.Media.Brush ControlBorderBrush
        {
            get => (System.Windows.Media.Brush)GetValue(ControlBorderBrushProperty);
            set => SetValue(ControlBorderBrushProperty, value);
        }

        private void DecrementButton_Click(object sender, RoutedEventArgs e)
        {
            Value = Math.Max(Value - Increment, Minimum);
        }

        private void IncrementButton_Click(object sender, RoutedEventArgs e)
        {
            Value = Math.Min(Value + Increment, Maximum);
        }

        private void ValueTextBox_LostFocus(object sender, RoutedEventArgs e)
        {
            if (sender is TextBox textBox && double.TryParse(textBox.Text, out double newValue))
            {
                Value = newValue;
            }
            else
            {
                UpdateTextBox();
            }
        }

        private void ValueTextBox_PreviewTextInput(object sender, System.Windows.Input.TextCompositionEventArgs e)
        {
            e.Handled = !IsNumeric(e.Text);
        }

        private bool IsNumeric(string text)
        {
            return double.TryParse(text, out _) || text == "." || text == "-";
        }

        private static void OnValueChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            if (d is NumericUpDown control)
            {
                control.UpdateTextBox();
            }
        }

        private static object CoerceValue(DependencyObject d, object baseValue)
        {
            if (d is NumericUpDown control)
            {
                double value = (double)baseValue;
                return Math.Max(control.Minimum, Math.Min(control.Maximum, value));
            }
            return baseValue;
        }

        private static void OnMinMaxChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            if (d is NumericUpDown control)
            {
                control.CoerceValue(ValueProperty);
            }
        }

        private static void OnDecimalPlacesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            if (d is NumericUpDown control)
            {
                control.UpdateTextBox();
            }
        }

        private void UpdateTextBox()
        {
            if (this.IsLoaded && this.FindName("ValueTextBox") is TextBox textBox)
            {
                textBox.Text = Value.ToString($"F{DecimalPlaces}");
            }
        }
        private static void OnLabelPositionChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            if (d is NumericUpDown control)
            {
                control.UpdateLabelTextPosition();
            }
        }
        private void UpdateLabelTextPosition()
        {
            if (LabelBlock == null || ContentPanel == null || MainGrid == null)
                return;

            Grid.SetRow(LabelBlock, 0);
            Grid.SetColumn(LabelBlock, 0);
            Grid.SetRow(ContentPanel, 1);
            Grid.SetColumn(ContentPanel, 0);

            MainGrid.Children.Clear();

            switch (LabelPosition)
            {
                case LabelTextPosition.Left:
                    Grid.SetRow(LabelBlock, 0);
                    Grid.SetColumn(LabelBlock, 0);

                    Grid.SetRow(ContentPanel, 0);
                    Grid.SetColumn(ContentPanel, 1);
                    break;

                case LabelTextPosition.Right:
                    Grid.SetRow(LabelBlock, 0);
                    Grid.SetColumn(LabelBlock, 1);

                    Grid.SetRow(ContentPanel, 0);
                    Grid.SetColumn(ContentPanel, 0);
                    break;

                case LabelTextPosition.Top:
                    Grid.SetRow(LabelBlock, 0);
                    Grid.SetColumn(LabelBlock, 0);

                    Grid.SetRow(ContentPanel, 1);
                    Grid.SetColumn(ContentPanel, 0);
                    break;

                case LabelTextPosition.Bottom:
                    Grid.SetRow(LabelBlock, 1);
                    Grid.SetColumn(LabelBlock, 0);

                    Grid.SetRow(ContentPanel, 0);
                    Grid.SetColumn(ContentPanel, 0);
                    break;
            }

            MainGrid.Children.Add(LabelBlock);
            MainGrid.Children.Add(ContentPanel);
        }

    }
}