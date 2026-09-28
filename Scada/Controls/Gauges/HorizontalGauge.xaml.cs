using System;
using System.ComponentModel;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Shapes;

namespace TimetTankSix.Controls
{
    public partial class HorizontalGauge : UserControl, INotifyPropertyChanged
    {
        #region Property Changed Implementation
        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
        #endregion
        #region Constructor
        public HorizontalGauge()
        {
            InitializeComponent();

            ValueBar.DataContext = this;
            CenterLine.DataContext = this;

            this.Loaded += (s, e) =>
            {
                UpdateVisualState();

                System.Windows.Threading.Dispatcher.CurrentDispatcher.BeginInvoke(
                    System.Windows.Threading.DispatcherPriority.Loaded,
                    new Action(() =>
                    {
                        if (TickCanvas.ActualWidth > 0)
                        {
                            UpdateTicks();
                            _ticksInitialized = true;
                        }
                        else
                        {
                            this.LayoutUpdated += OnLayoutUpdated;
                        }
                    }));
            };
            this.SizeChanged += (s, e) => UpdateTicks();
        }

        private void OnLayoutUpdated(object sender, EventArgs e)
        {
            if (TickCanvas.ActualWidth > 0 && !_ticksInitialized)
            {
                UpdateTicks();
                _ticksInitialized = true;

                this.LayoutUpdated -= OnLayoutUpdated;
            }
        }

        private bool _ticksInitialized = false;
        #endregion
        #region Dependency Properties

        public static readonly DependencyProperty ValueProperty =
            DependencyProperty.Register(
                "Value",
                typeof(double),
                typeof(HorizontalGauge),
                new PropertyMetadata(0.0, OnValueChanged));

        public static readonly DependencyProperty MinValueProperty =
            DependencyProperty.Register(
                "MinValue",
                typeof(double),
                typeof(HorizontalGauge),
                new PropertyMetadata(0.0, OnRangeChanged));

        public static readonly DependencyProperty MaxValueProperty =
            DependencyProperty.Register(
                "MaxValue",
                typeof(double),
                typeof(HorizontalGauge),
                new PropertyMetadata(30.0, OnRangeChanged));

        public static readonly DependencyProperty MajorTickFrequencyProperty =
            DependencyProperty.Register(
                "MajorTickFrequency",
                typeof(double),
                typeof(HorizontalGauge),
                new PropertyMetadata(10.0, OnTicksChanged));

        public static readonly DependencyProperty MinorTickFrequencyProperty =
            DependencyProperty.Register(
                "MinorTickFrequency",
                typeof(double),
                typeof(HorizontalGauge),
                new PropertyMetadata(5.0, OnTicksChanged));

        public static readonly DependencyProperty UnitProperty =
            DependencyProperty.Register(
                "Unit",
                typeof(string),
                typeof(HorizontalGauge),
                new PropertyMetadata(string.Empty));

        public static readonly DependencyProperty ShowLabelsProperty =
            DependencyProperty.Register(
                "ShowLabels",
                typeof(bool),
                typeof(HorizontalGauge),
                new PropertyMetadata(true, OnAppearanceChanged));

        public static readonly DependencyProperty GaugeColorProperty =
            DependencyProperty.Register(
                "GaugeColor",
                typeof(Brush),
                typeof(HorizontalGauge),
                new PropertyMetadata(new SolidColorBrush(Colors.Green), OnAppearanceChanged));

        public static readonly DependencyProperty UseGradientProperty =
            DependencyProperty.Register(
                "UseGradient",
                typeof(bool),
                typeof(HorizontalGauge),
                new PropertyMetadata(false, OnAppearanceChanged));

        public static readonly DependencyProperty LowColorProperty =
            DependencyProperty.Register(
                "LowColor",
                typeof(Color),
                typeof(HorizontalGauge),
                new PropertyMetadata(Colors.Green, OnAppearanceChanged));

        public static readonly DependencyProperty HighColorProperty =
            DependencyProperty.Register(
                "HighColor",
                typeof(Color),
                typeof(HorizontalGauge),
                new PropertyMetadata(Colors.Red, OnAppearanceChanged));

        public static readonly DependencyProperty ThresholdValueProperty =
            DependencyProperty.Register(
                "ThresholdValue",
                typeof(double),
                typeof(HorizontalGauge),
                new PropertyMetadata(double.NaN, OnAppearanceChanged));

        public static readonly DependencyProperty ThresholdColorProperty =
            DependencyProperty.Register(
                "ThresholdColor",
                typeof(Brush),
                typeof(HorizontalGauge),
                new PropertyMetadata(new SolidColorBrush(Colors.Red), OnAppearanceChanged));

        public static readonly DependencyProperty CenterPointProperty =
            DependencyProperty.Register(
                "CenterPoint",
                typeof(double),
                typeof(HorizontalGauge),
                new PropertyMetadata(15.0, OnAppearanceChanged));

        #endregion
        #region Properties

        public double Value
        {
            get { return (double)GetValue(ValueProperty); }
            set { SetValue(ValueProperty, value); }
        }

        public double MinValue
        {
            get { return (double)GetValue(MinValueProperty); }
            set { SetValue(MinValueProperty, value); }
        }

        public double MaxValue
        {
            get { return (double)GetValue(MaxValueProperty); }
            set { SetValue(MaxValueProperty, value); }
        }

        public double MajorTickFrequency
        {
            get { return (double)GetValue(MajorTickFrequencyProperty); }
            set { SetValue(MajorTickFrequencyProperty, value); }
        }

        public double MinorTickFrequency
        {
            get { return (double)GetValue(MinorTickFrequencyProperty); }
            set { SetValue(MinorTickFrequencyProperty, value); }
        }

        public string Unit
        {
            get { return (string)GetValue(UnitProperty); }
            set { SetValue(UnitProperty, value); }
        }

        public bool ShowLabels
        {
            get { return (bool)GetValue(ShowLabelsProperty); }
            set { SetValue(ShowLabelsProperty, value); }
        }

        public Brush GaugeColor
        {
            get { return (Brush)GetValue(GaugeColorProperty); }
            set { SetValue(GaugeColorProperty, value); }
        }

        public bool UseGradient
        {
            get { return (bool)GetValue(UseGradientProperty); }
            set { SetValue(UseGradientProperty, value); }
        }

        public Color LowColor
        {
            get { return (Color)GetValue(LowColorProperty); }
            set { SetValue(LowColorProperty, value); }
        }

        public Color HighColor
        {
            get { return (Color)GetValue(HighColorProperty); }
            set { SetValue(HighColorProperty, value); }
        }

        public double ThresholdValue
        {
            get { return (double)GetValue(ThresholdValueProperty); }
            set { SetValue(ThresholdValueProperty, value); }
        }

        public Brush ThresholdColor
        {
            get { return (Brush)GetValue(ThresholdColorProperty); }
            set { SetValue(ThresholdColorProperty, value); }
        }

        public double CenterPoint
        {
            get { return (double)GetValue(CenterPointProperty); }
            set { SetValue(CenterPointProperty, value); }
        }

        #endregion
        #region Calculated Properties

        private double _normalizedValue;
        public double NormalizedValue
        {
            get { return _normalizedValue; }
            set
            {
                if (_normalizedValue != value)
                {
                    _normalizedValue = value;
                    OnPropertyChanged(nameof(NormalizedValue));
                }
            }
        }

        #endregion
        #region Change Handlers

        private static void OnValueChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var gauge = d as HorizontalGauge;
            if (gauge == null) return;

            gauge.UpdateNormalizedValue();
            gauge.UpdateVisualState();
        }

        private static void OnRangeChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var gauge = d as HorizontalGauge;
            if (gauge == null) return;

            gauge.UpdateNormalizedValue();
        }

        private static void OnTicksChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var gauge = d as HorizontalGauge;
            if (gauge == null) return;

            gauge.UpdateTicks();
        }

        private static void OnAppearanceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var gauge = d as HorizontalGauge;
            if (gauge == null) return;

            if (e.Property == ShowLabelsProperty)
            {
                gauge.UpdateTicks();
            }

            gauge.UpdateVisualState();
        }

        #endregion
        #region Helper Methods

        private void UpdateNormalizedValue()
        {
            double range = MaxValue - MinValue;
            if (range <= 0) return;

            double normalized = Math.Max(0, Math.Min(1, 1 - (Value - MinValue) / range));
            NormalizedValue = normalized;
        }

        private void UpdateTicks()
        {
            if (TickCanvas == null) return;

            TickCanvas.Children.Clear();

            double range = MaxValue - MinValue;
            if (range <= 0) return;

            if (MajorTickFrequency <= 0) return;

            // Ensure minor tick frequency is less than major (to avoid no minor ticks)
            if (MinorTickFrequency >= MajorTickFrequency)
                MinorTickFrequency = MajorTickFrequency / 2;

            // Additional check for very small frequencies
            if (MinorTickFrequency <= 0)
                MinorTickFrequency = MajorTickFrequency / 4;

            // Calculate dimensions
            double gaugeHeight = TickCanvas.ActualHeight;
            double gaugeWidth = TickCanvas.ActualWidth;

            if (gaugeWidth <= 0 || gaugeHeight <= 0) return;

            // Draw major ticks and labels
            double currentValue = MinValue;
            while (currentValue <= MaxValue)
            {
                // Calculate position (0 = left, 1 = right)
                double normalizedPos = (currentValue - MinValue) / range;
                double xPos = normalizedPos * gaugeWidth;

                // Major tick mark (vertical line)
                Line majorTick = new Line
                {
                    X1 = xPos,
                    X2 = xPos,
                    Y1 = gaugeHeight / 2 - 15,  // Above center
                    Y2 = gaugeHeight / 2 + 15,  // Below center
                    Stroke = Brushes.Black,
                    StrokeThickness = 1
                };

                TickCanvas.Children.Add(majorTick);

                // Add tick label if ShowLabels is true
                if (ShowLabels)
                {
                    TextBlock label = new TextBlock
                    {
                        Text = currentValue.ToString("F1"),
                        FontSize = 8,
                        Foreground = Brushes.DarkGray
                    };

                    // Measure the text width for centering
                    label.Measure(new Size(double.PositiveInfinity, double.PositiveInfinity));
                    double textWidth = label.DesiredSize.Width;

                    Canvas.SetLeft(label, xPos - textWidth / 2);  // Center horizontally
                    Canvas.SetTop(label, gaugeHeight / 2 + 20);   // Position below tick

                    TickCanvas.Children.Add(label);
                }

                // Draw minor ticks between major ticks
                if (MinorTickFrequency > 0 && currentValue < MaxValue)
                {
                    double minorStep = MinorTickFrequency;
                    double nextMajor = currentValue + MajorTickFrequency;

                    for (double minorValue = currentValue + minorStep;
                         minorValue < nextMajor && minorValue < MaxValue;
                         minorValue += minorStep)
                    {
                        double minorNormalizedPos = (minorValue - MinValue) / range;
                        double minorXPos = minorNormalizedPos * gaugeWidth;

                        Line minorTick = new Line
                        {
                            X1 = minorXPos,
                            X2 = minorXPos,
                            Y1 = gaugeHeight / 2 - 10,  // Shorter than major ticks
                            Y2 = gaugeHeight / 2 + 10,
                            Stroke = Brushes.Gray,
                            StrokeThickness = 0.5
                        };

                        TickCanvas.Children.Add(minorTick);
                    }
                }

                currentValue += MajorTickFrequency;
            }
        }

        private void UpdateVisualState()
        {
            UpdateNormalizedValue();
            UpdateTicks();

            // Position the center line
            if (CenterLine != null && TickCanvas != null)
            {
                double range = MaxValue - MinValue;
                if (range <= 0) return;

                // Calculate normalized center position (0-1)
                double centerPos = (CenterPoint - MinValue) / range;

                // Set center line position
                double centerX = centerPos * TickCanvas.ActualWidth;
                CenterLine.X1 = centerX;
                CenterLine.X2 = centerX;
                CenterLine.Y1 = 0;
                CenterLine.Y2 = TickCanvas.ActualHeight;
            }

            // Position and size the value bar based on current value and center point
            if (ValueBar != null && TickCanvas != null && ValueBarCanvas != null)
            {
                double range = MaxValue - MinValue;
                if (range <= 0) return;

                double centerPos = (CenterPoint - MinValue) / range;
                double valuePos = (Value - MinValue) / range;  // Don't invert this value

                double centerX = centerPos * TickCanvas.ActualWidth;
                double valueX = valuePos * TickCanvas.ActualWidth;  // Corrected this line

                // Calculate vertical center of the canvas
                double verticalCenter = (ValueBarCanvas.ActualHeight - ValueBar.Height) / 2;
                Canvas.SetTop(ValueBar, verticalCenter);  // Set vertical position

                // Set bar position and width based on which side of center the value is
                if (Value < CenterPoint)
                {
                    // Value is left of center
                    ValueBar.Width = centerX - valueX;
                    Canvas.SetLeft(ValueBar, valueX);
                }
                else
                {
                    // Value is right of center or at center
                    ValueBar.Width = valueX - centerX;
                    Canvas.SetLeft(ValueBar, centerX);
                }
            }
        }

        public void RefreshGauge()
        {
            UpdateVisualState();
        }

        #endregion
    }
}
