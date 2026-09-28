using System;
using System.ComponentModel;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Shapes;

namespace TimetTankSix.Controls
{
    public partial class VerticalGauge : UserControl, INotifyPropertyChanged
    {
        #region Constructor
        public VerticalGauge()
        {
            InitializeComponent();

            ValueBar.DataContext = this;
            TickCanvas.DataContext = this;

            this.Loaded += (s, e) =>
            {
                this.LayoutUpdated += (s2, e2) =>
                {
                    if (TickCanvas.ActualHeight > 0 && !_ticksInitialized)
                    {
                        UpdateTicks();
                        _ticksInitialized = true;
                    }
                };
            };

            this.SizeChanged += (s, e) =>
            {
                UpdateTicks();
            };
        }
        private bool _ticksInitialized = false;
        #endregion
        #region Dependency Properties
        public static readonly DependencyProperty ValueProperty =
            DependencyProperty.Register(
                "Value",
                typeof(double),
                typeof(VerticalGauge),
                new PropertyMetadata(0.0, OnValueChanged));

        public static readonly DependencyProperty MinValueProperty =
            DependencyProperty.Register(
                "MinValue",
                typeof(double),
                typeof(VerticalGauge),
                new PropertyMetadata(0.0, OnRangeChanged));

        public static readonly DependencyProperty MaxValueProperty =
            DependencyProperty.Register(
                "MaxValue",
                typeof(double),
                typeof(VerticalGauge),
                new PropertyMetadata(100.0, OnRangeChanged));

        public static readonly DependencyProperty MajorTickFrequencyProperty =
            DependencyProperty.Register(
                "MajorTickFrequency",
                typeof(double),
                typeof(VerticalGauge),
                new PropertyMetadata(20.0, OnTicksChanged));

        public static readonly DependencyProperty MinorTickFrequencyProperty =
            DependencyProperty.Register(
                "MinorTickFrequency",
                typeof(double),
                typeof(VerticalGauge),
                new PropertyMetadata(5.0, OnTicksChanged));

        public static readonly DependencyProperty UnitProperty =
            DependencyProperty.Register(
                "Unit",
                typeof(string),
                typeof(VerticalGauge),
                new PropertyMetadata(string.Empty));

        public static readonly DependencyProperty ShowLabelsProperty =
            DependencyProperty.Register(
                "ShowLabels",
                typeof(bool),
                typeof(VerticalGauge),
                new PropertyMetadata(true, OnAppearanceChanged));

        public static readonly DependencyProperty GaugeColorProperty =
            DependencyProperty.Register(
                "GaugeColor",
                typeof(Brush),
                typeof(VerticalGauge),
                new PropertyMetadata(new SolidColorBrush(Colors.Green), OnAppearanceChanged));

        public static readonly DependencyProperty UseGradientProperty =
            DependencyProperty.Register(
                "UseGradient",
                typeof(bool),
                typeof(VerticalGauge),
                new PropertyMetadata(false, OnAppearanceChanged));

        public static readonly DependencyProperty LowColorProperty =
            DependencyProperty.Register(
                "LowColor",
                typeof(Color),
                typeof(VerticalGauge),
                new PropertyMetadata(Colors.Green, OnAppearanceChanged));

        public static readonly DependencyProperty HighColorProperty =
            DependencyProperty.Register(
                "HighColor",
                typeof(Color),
                typeof(VerticalGauge),
                new PropertyMetadata(Colors.Red, OnAppearanceChanged));

        public static readonly DependencyProperty ThresholdValueProperty =
            DependencyProperty.Register(
                "ThresholdValue",
                typeof(double),
                typeof(VerticalGauge),
                new PropertyMetadata(double.NaN, OnAppearanceChanged));

        public static readonly DependencyProperty ThresholdColorProperty =
            DependencyProperty.Register(
                "ThresholdColor",
                typeof(Brush),
                typeof(VerticalGauge),
                new PropertyMetadata(new SolidColorBrush(Colors.Red), OnAppearanceChanged));

        public static readonly DependencyProperty RenderFromZeroProperty =
            DependencyProperty.Register(
                "RenderFromZero",
                typeof(bool),
                typeof(VerticalGauge),
                new PropertyMetadata(true, OnValueChanged));

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

        /// <summary>
        /// When true, the bar renders from zero (or clamped to min/max if zero is outside range).
        /// When false, the bar renders from the minimum value.
        /// </summary>
        public bool RenderFromZero
        {
            get { return (bool)GetValue(RenderFromZeroProperty); }
            set { SetValue(RenderFromZeroProperty, value); }
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

        private double _zeroPosition;
        public double ZeroPosition
        {
            get { return _zeroPosition; }
            set
            {
                if (_zeroPosition != value)
                {
                    _zeroPosition = value;
                    OnPropertyChanged(nameof(ZeroPosition));
                }
            }
        }

        private double _barHeight;
        public double BarHeight
        {
            get { return _barHeight; }
            set
            {
                if (_barHeight != value)
                {
                    _barHeight = value;
                    OnPropertyChanged(nameof(BarHeight));
                }
            }
        }

        private double _barTop;
        public double BarTop
        {
            get { return _barTop; }
            set
            {
                if (_barTop != value)
                {
                    _barTop = value;
                    OnPropertyChanged(nameof(BarTop));
                }
            }
        }

        #endregion
        #region Change Handlers
        private static void OnValueChanged(DependencyObject _d, DependencyPropertyChangedEventArgs _e)
        {
            var _gauge = _d as VerticalGauge;
            if (_gauge == null) return;

            _gauge.UpdateNormalizedValue();
        }
        private static void OnRangeChanged(DependencyObject _d, DependencyPropertyChangedEventArgs _e)
        {
            var _gauge = _d as VerticalGauge;
            if (_gauge == null) return;

            _gauge.UpdateNormalizedValue();
        }
        private static void OnTicksChanged(DependencyObject _d, DependencyPropertyChangedEventArgs _e)
        {
            var _gauge = _d as VerticalGauge;
            if (_gauge == null) return;

            _gauge.UpdateTicks();
        }
        private static void OnAppearanceChanged(DependencyObject _d, DependencyPropertyChangedEventArgs _e)
        {
            var _gauge = _d as VerticalGauge;
            if (_gauge == null) return;

            if (_e.Property == ShowLabelsProperty)
            {
                _gauge.UpdateTicks();
            }

            if (_e.Property == ThresholdValueProperty ||
                _e.Property == ThresholdColorProperty)
            {

            }
        }
        #endregion
        #region Update Methods
        private bool MinMaxChanged = false;
        private void UpdateNormalizedValue()
        {
            double _range = MaxValue - MinValue;
            if (_range <= 0) return;

            double _normalized = Math.Max(0, Math.Min(1, (Value - MinValue) / _range));
            NormalizedValue = _normalized;

            double _gaugeHeight = TickCanvas?.ActualHeight ?? 0;

            if (_gaugeHeight > 0)
            {
                // Value position from top (inverted because Y increases downward)
                double _valuePosition = (1 - _normalized) * _gaugeHeight;

                if (RenderFromZero)
                {
                    // Calculate zero position (where 0 falls on the gauge, clamped to range)
                    double _zeroNormalized = Math.Max(0, Math.Min(1, (0 - MinValue) / _range));
                    ZeroPosition = (1 - _zeroNormalized) * _gaugeHeight;

                    if (Value >= 0)
                    {
                        // Positive: bar goes from value position up to zero position
                        BarTop = _valuePosition;
                        BarHeight = ZeroPosition - _valuePosition;
                    }
                    else
                    {
                        // Negative: bar goes from zero position down to value position
                        BarTop = ZeroPosition;
                        BarHeight = _valuePosition - ZeroPosition;
                    }
                }
                else
                {
                    // Render from minimum value - bar always starts from bottom
                    BarTop = _valuePosition;
                    BarHeight = _gaugeHeight - _valuePosition;
                    ZeroPosition = _gaugeHeight; // Set to bottom for consistency
                }
            }

            if ((Value < MinValue || Value > MaxValue))
            {
                if (MinValue - Value > 0)
                {
                    double _diff = MinValue - Value;
                    int _noMajorTicks = (int)(_diff / MajorTickFrequency) + 1;
                    MinValue = MinValue - (_noMajorTicks * MajorTickFrequency);
                }
                else if (Value - MaxValue > 0)
                {
                    double _diff = Value - MaxValue;
                    int _noMajorTicks = (int)(_diff / MajorTickFrequency) + 1;
                    MaxValue = MaxValue + (_noMajorTicks * MajorTickFrequency);
                }
                MinMaxChanged = true;
            }
            if (MinMaxChanged)
            {
                MinMaxChanged = false;
                UpdateTicks();
            }
        }

        private void UpdateTicks()
        {
            if (TickCanvas == null) return;

            TickCanvas.Children.Clear();

            double _range = MaxValue - MinValue;
            if (_range <= 0) return;

            if (MajorTickFrequency <= 0) return;

            if (MinorTickFrequency >= MajorTickFrequency)
                MinorTickFrequency = MajorTickFrequency / 2;

            if (MinorTickFrequency <= 0)
                MinorTickFrequency = MajorTickFrequency / 4;

            double _gaugeHeight = TickCanvas.ActualHeight;
            double _gaugeWidth = TickCanvas.ActualWidth;

            if (_gaugeWidth <= 0 || _gaugeHeight <= 0) return;

            double _currentValue = MinValue;
            while (_currentValue <= MaxValue)
            {
                double _normalizedPos = (_currentValue - MinValue) / _range;
                double _yPos = (1 - _normalizedPos) * _gaugeHeight;

                Line _majorTick = new Line
                {
                    X1 = _gaugeWidth / 2 - 15,
                    X2 = _gaugeWidth / 2 + 15,
                    Y1 = _yPos,
                    Y2 = _yPos,
                    Stroke = Brushes.Black,
                    StrokeThickness = 1
                };

                TickCanvas.Children.Add(_majorTick);

                if (ShowLabels)
                {
                    TextBlock _label = new TextBlock
                    {
                        Text = _currentValue.ToString("F1"),
                        FontSize = 10,
                        Foreground = Application.Current.FindResource("PrimaryTextColor") as SolidColorBrush,
                        VerticalAlignment = VerticalAlignment.Center,
                        HorizontalAlignment = HorizontalAlignment.Center
                    };

                    Canvas.SetLeft(_label, _gaugeWidth / 2 + 20);
                    Canvas.SetTop(_label, _yPos - _label.FontSize + 2);

                    TickCanvas.Children.Add(_label);
                }

                if (MinorTickFrequency > 0 && _currentValue < MaxValue)
                {
                    double _minorStep = MinorTickFrequency;
                    double _nextMajor = _currentValue + MajorTickFrequency;

                    for (double _minorValue = _currentValue + _minorStep;
                         _minorValue < _nextMajor && _minorValue < MaxValue;
                         _minorValue += _minorStep)
                    {
                        double _minorNormalizedPos = (_minorValue - MinValue) / _range;
                        double _minorYPos = _minorNormalizedPos * _gaugeHeight;

                        Line _minorTick = new Line
                        {
                            X1 = _gaugeWidth / 2 - 10,
                            X2 = _gaugeWidth / 2 + 10,
                            Y1 = _minorYPos,
                            Y2 = _minorYPos,
                            Stroke = Brushes.Gray,
                            StrokeThickness = 0.5
                        };

                        TickCanvas.Children.Add(_minorTick);
                    }
                }

                _currentValue += MajorTickFrequency;
            }
        }
        private void UpdateVisualState()
        {
            UpdateNormalizedValue();
            UpdateTicks();
        }

        public void RefreshGauge()
        {
            UpdateVisualState();
        }
        #endregion
        #region Property Changed Implementation
        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
        #endregion
    }
}
