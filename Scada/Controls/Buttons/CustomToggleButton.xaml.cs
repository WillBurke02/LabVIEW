using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace TimetTankSix.Controls
{
    public partial class CustomToggleButton : UserControl
    {
        #region Dependency Properties
        private readonly bool _isUpdating;
        public static readonly DependencyProperty IsActiveProperty =
            DependencyProperty.Register(
                "IsActive",
                typeof(bool),
                typeof(CustomToggleButton),
                new PropertyMetadata(false, OnIsActiveChanged));
        public bool IsActive
        {
            get { return (bool)GetValue(IsActiveProperty); }
            set { SetValue(IsActiveProperty, value); }
        }
        public static readonly DependencyProperty ActiveTextProperty =
            DependencyProperty.Register(
                "ActiveText",
                typeof(string),
                typeof(CustomToggleButton),
                new PropertyMetadata(string.Empty));
        public string ActiveText
        {
            get { return (string)GetValue(ActiveTextProperty); }
            set { SetValue(ActiveTextProperty, value); }
        }
        public static readonly DependencyProperty InactiveTextProperty =
            DependencyProperty.Register(
                "InactiveText",
                typeof(string),
                typeof(CustomToggleButton),
                new PropertyMetadata(string.Empty));
        public string InactiveText
        {
            get { return (string)GetValue(InactiveTextProperty); }
            set { SetValue(InactiveTextProperty, value); }
        }
        public static readonly DependencyProperty ButtonTextProperty =
            DependencyProperty.Register(
                "ButtonText",
                typeof(string),
                typeof(CustomToggleButton),
                new PropertyMetadata("Command"));
        public string ButtonText
        {
            get { return (string)GetValue(ButtonTextProperty); }
            set { SetValue(ButtonTextProperty, value); }
        }

        public static readonly DependencyProperty CommandProperty =
    DependencyProperty.Register(
        "Command",
        typeof(ICommand),
        typeof(CustomToggleButton),
        new PropertyMetadata(null));

        public ICommand Command
        {
            get { return (ICommand)GetValue(CommandProperty); }
            set { SetValue(CommandProperty, value); }
        }
        #endregion
        #region Constructor
        public CustomToggleButton()
        {
            InitializeComponent();
            Loaded += CustomToggleButton_Loaded;
        }
        private void CustomToggleButton_Loaded(object sender, RoutedEventArgs e)
        {
            UpdateDisplayText();
        }
        #endregion
        #region Changed Method
        private void UpdateDisplayText()
        {
            if (!string.IsNullOrEmpty(ActiveText) && !string.IsNullOrEmpty(InactiveText))
            {
                ButtonText = IsActive ? ActiveText : InactiveText;
            }
        }
        private static void OnIsActiveChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var button = d as CustomToggleButton;
            if (button != null && !button._isUpdating)
            {
                button.UpdateDisplayText();
            }
        }
        #endregion
        #region Public Methods
        public delegate void StatusUpdateHandler(object sender, EventArgs e);
        public event StatusUpdateHandler OnUpdateStatus;
        private void OnBtnClick(object sender, EventArgs e)
        {
            UpdateStatus();
            if (Command != null && Command.CanExecute(null))
            {
                Command.Execute(null);
            }
        }
        private void UpdateStatus()
        {
            EventArgs args = new EventArgs();
            OnUpdateStatus?.Invoke(this, args);
        }
        #endregion
    }
}
