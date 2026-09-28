using System.ComponentModel;
using System.Windows;
using System.Windows.Controls;
using TimetTankSix.Helpers;

namespace TimetTankSix.Controls
{
    public partial class NumericInputTextBox : UserControl
    {
        #region Dependency Properties
        public double Value { get { return (double)GetValue(ValueProperty); } set { SetValue(ValueProperty, value); } }
        public static readonly DependencyProperty ValueProperty =
            DependencyProperty.Register(
                "Value",
                typeof(double),
                typeof(NumericInputTextBox),
                new FrameworkPropertyMetadata(0.0, OnValueChanged)
            );

        public string Unit { get { return (string)GetValue(UnitProperty); } set { SetValue(UnitProperty, value); } }
        public static readonly DependencyProperty UnitProperty =
            DependencyProperty.Register(
                "Unit",
                typeof(string),
                typeof(NumericInputTextBox),
                new FrameworkPropertyMetadata(string.Empty)
            );
        #endregion
        #region Constructor
        public NumericInputTextBox()
        {
            InitializeComponent();
            Loaded += NumericInputTextBox_Loaded;
            NumericTextBox.KeyDown += NumericTextBox_KeyDown;
            NumericTextBox.LostFocus += NumericTextBox_LostFocus;
            NumericTextBox.PreviewTextInput += NumericTextBox_PreviewTextInput;
        }
        #endregion
        #region On Load
        private void NumericInputTextBox_Loaded(object sender, RoutedEventArgs e)
        {
            UpdateValue();
            UpdateUnits();
        }
        #endregion
        #region Update Methods
        private void UpdateUnits()
        {
            if (Unit != string.Empty)
            {
                UnitTextBlock.Visibility = Visibility.Visible;
                UnitTextBlock.Text = Unit;
            }
            else
            {
                UnitTextBlock.Visibility = Visibility.Collapsed;
            }
        }
        private void UpdateValue()
        {
            if (!NumericValidationHelper.IsTextAValidNumber(NumericTextBox.Text))
            {
                DisplayInvalidInput(); return;
            }
            if (!NumericTextBox.IsFocused && NumericTextBox != null)
            {
                NumericTextBox.Text = Value.ToString();
            }
        }
        #endregion
        #region TextBox Events
        private void NumericTextBox_KeyDown(object sender, System.Windows.Input.KeyEventArgs e)
        {
            if (e.Key == System.Windows.Input.Key.Enter)
            {
                if (double.TryParse(NumericTextBox.Text, out double newValue))
                {
                    Value = newValue;
                }
                else
                {
                    UpdateValue();
                }
            }
        }
        private void NumericTextBox_LostFocus(object sender, RoutedEventArgs e)
        {
            if (double.TryParse(NumericTextBox.Text, out double newValue))
            {
                Value = newValue;
            }
            else
            {
                UpdateValue();
            }
        }
        private void NumericTextBox_PreviewTextInput(object sender, System.Windows.Input.TextCompositionEventArgs e)
        {
            e.Handled = !NumericValidationHelper.IsInputNumeric(e.Text);
        }
        #endregion
        #region Invalid Input
        private void DisplayInvalidInput()
        {
            // DO SOMETHING, PROBABLY FLASH THE TEXTBOX OR SOMETHING TO INDICATE THE INPUT WAS INVALID
        }
        #endregion
        #region Property Changed
        public event PropertyChangedEventHandler PropertyChanged;
        private static void OnValueChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var control = (NumericInputTextBox)d;
            control.UpdateValue();
            control.OnPropertyChanged(nameof(Value));
        }
        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
        #endregion
    }
}
