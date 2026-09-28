using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace TimetTankSix.Controls
{
    /// <summary>
    /// Interaction logic for LampStatusControl.xaml
    /// </summary>
    public partial class LampStatusControl : UserControl
    {
        public LampStatusControl()
        {
            InitializeComponent();
        }
        #region Design Height and Width Properties
        /// <summary>
        /// Design Height Property
        /// </summary>
        public static readonly DependencyProperty DesignHeight = DependencyProperty.Register(
            "DesignHeight", typeof(double), typeof(LampStatusControl), new PropertyMetadata(0d, ValueChangedHeight));
        private static void ValueChangedHeight(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var control = d as LampStatusControl;
            if (control != null)
            {
                control.Height = (double)e.NewValue;
            }
        }
        public double DesignHeightProperty
        {
            get { return (double)GetValue(DesignHeight); }
            set { SetValue(DesignHeight, value); }
        }

        /// <summary>
        /// Design Width Property
        /// </summary>
        public static readonly DependencyProperty DesignWidth = DependencyProperty.Register(
            "DesignWidth", typeof(double), typeof(LampStatusControl), new PropertyMetadata(0d, ValueChangedWidth));
        private static void ValueChangedWidth(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var control = d as LampStatusControl;
            if (control != null)
            {
                control.Width = (double)e.NewValue;
            }
        }
        public double DesignWidthProperty
        {
            get { return (double)(GetValue(DesignWidth)); }
            set { SetValue(DesignWidth, value); }
        }
        #endregion Design Height and Width Properties

        // Grid Background
        public static new readonly DependencyProperty BackgroundProperty = DependencyProperty.Register(
            "Background", typeof(Color), typeof(LampStatusControl), new PropertyMetadata(Colors.MintCream));
        public new Color Background
        {
            get { return (Color)GetValue(BackgroundProperty); }
            set { SetValue(BackgroundProperty, value); }
        }

        // Label Properties
        // Text
        public static readonly DependencyProperty LabelTextProperty = DependencyProperty.Register(
            "LabelText", typeof(string), typeof(LampStatusControl), new PropertyMetadata("Label", ValueChangedLabel));
        private static void ValueChangedLabel(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var control = d as LampStatusControl;
            if (control != null)
            {
                control.LabelText = (string)e.NewValue;
            }
        }
        public string LabelText
        {
            get { return (string)GetValue(LabelTextProperty); }
            set { SetValue(LabelTextProperty, value); }
        }
        // LabelPosition
        public static readonly DependencyProperty LabelPositionProperty = DependencyProperty.Register(
            "LabelPosition", typeof(HorizontalAlignment), typeof(LampStatusControl), new PropertyMetadata(HorizontalAlignment.Left));
        public HorizontalAlignment LabelPosition
        {
            get { return (HorizontalAlignment)GetValue(LabelPositionProperty); }
            set { SetValue(LabelPositionProperty, value); }
        }
        //Vertical Alignment
        public static readonly DependencyProperty LabelVerticalAlignmentProperty = DependencyProperty.Register(
            "LabelVerticalAlignment", typeof(VerticalAlignment), typeof(LampStatusControl), new PropertyMetadata(VerticalAlignment.Center));
        public VerticalAlignment LabelVerticalAlignment
        {
            get { return (VerticalAlignment)GetValue(LabelVerticalAlignmentProperty); }
            set { SetValue(LabelVerticalAlignmentProperty, value); }
        }
        //FontSize
        public static readonly DependencyProperty LabelFontSizeProperty = DependencyProperty.Register(
            "LabelFontSize", typeof(double), typeof(LampStatusControl), new PropertyMetadata(18d));
        public double LabelFontSize
        {
            get { return (double)GetValue(LabelFontSizeProperty); }
            set { SetValue(LabelFontSizeProperty, value); }
        }

        // Lamp Properties
        // Border Colour
        public static readonly DependencyProperty BorderColourProperty = DependencyProperty.Register(
            "BorderColour", typeof(Color), typeof(LampStatusControl), new PropertyMetadata(Colors.Black));
        public Color BorderColour
        {
            get { return (Color)GetValue(BorderColourProperty); }
            set { SetValue(BorderColourProperty, value); }
        }
        // State (Background)
        public static readonly DependencyProperty StateProperty = DependencyProperty.Register(
            "State", typeof(Color), typeof(LampStatusControl), new PropertyMetadata(Colors.Crimson));
        public Color State
        {
            get { return (Color)GetValue(StateProperty); }
            set { SetValue(StateProperty, value); }
        }
        // Vertical Alignment
        public static readonly DependencyProperty LampVerticalAlignmentProperty = DependencyProperty.Register(
            "LampVerticalAlignment", typeof(VerticalAlignment), typeof(LampStatusControl), new PropertyMetadata(VerticalAlignment.Center));
        public VerticalAlignment LampVerticalAlignment
        {
            get { return (VerticalAlignment)GetValue(LampVerticalAlignmentProperty); }
            set { SetValue(LampVerticalAlignmentProperty, value); }
        }
        // Lamp Width and Height
        public static readonly DependencyProperty GridWidthProperty = DependencyProperty.Register(
            "GridWidth", typeof(double), typeof(LampStatusControl), new PropertyMetadata(50d));
        public double GridWidth
        {
            get { return (double)GetValue(GridWidthProperty); }
            set { SetValue(GridWidthProperty, value); }
        }
        public static readonly DependencyProperty GridHeightProperty = DependencyProperty.Register(
            "GridHeight", typeof(double), typeof(LampStatusControl), new PropertyMetadata(50d));
        public double GridHeight
        {
            get { return (double)GetValue(GridHeightProperty); }
            set { SetValue(GridHeightProperty, value); }
        }

        // Lamp Corner radius (maybe shape? 360 = circle, 0 = square, 
        public static readonly DependencyProperty ShapeProperty = DependencyProperty.Register(
            "Shape", typeof(LampShape), typeof(LampStatusControl), new PropertyMetadata(LampShape.Circle, OnShapeChanged));
        private static void OnShapeChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var control = d as LampStatusControl;
            if (control != null)
            {
                var newShape = e.NewValue;
                switch (newShape)
                {
                    case LampShape.Circle:
                        control.CornerRadius = new CornerRadius(360);
                        break;
                    case LampShape.Square:
                        control.CornerRadius = new CornerRadius(0);
                        break;
                    default:
                        control.CornerRadius = new CornerRadius(360);
                        break;
                }
            }
        }
        public LampShape Shape
        {
            get { return (LampShape)GetValue(ShapeProperty); }
            set { SetValue(ShapeProperty, value); }
        }

        public CornerRadius CornerRadius { get; private set; }

        public enum LampShape
        {
            Circle = 360,
            Square = 0
        }
    }
}
