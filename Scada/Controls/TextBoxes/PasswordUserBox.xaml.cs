using System.Windows;
using System.Windows.Controls;

namespace TimetTankSix.Controls
{
    public partial class PasswordUserBox : UserControl
    {
        #region Dependency Properties
        public static readonly DependencyProperty PasswordProperty =
            DependencyProperty.Register(
                "Password",
                typeof(string),
                typeof(PasswordUserBox),
                new FrameworkPropertyMetadata(
                    string.Empty,
                    FrameworkPropertyMetadataOptions.BindsTwoWayByDefault,
                    OnPasswordPropertyChanged));
        #endregion
        #region Properties
        private bool _isUpdating = false;

        public string Password
        {
            get { return (string)GetValue(PasswordProperty); }
            set { SetValue(PasswordProperty, value); }
        }
        #endregion
        #region Constructor
        public PasswordUserBox()
        {
            InitializeComponent();
        }
        #endregion
        #region Password Visibility Toggles
        private void ShowPasswordBtn_OnClick(object sender, RoutedEventArgs e)
        {
            if (PasswordTextBox.Visibility == Visibility.Visible)
            {
                PasswordTextBox.Visibility = Visibility.Collapsed;
                ShowPasswordTextBox.Visibility = Visibility.Visible;
                ShowPasswordTextBox.Text = PasswordTextBox.Password;
                ShowPasswordIcon.Text = "\ue9a8";
            }
            else
            {
                PasswordTextBox.Visibility = Visibility.Visible;
                ShowPasswordTextBox.Visibility = Visibility.Collapsed;
                PasswordTextBox.Password = ShowPasswordTextBox.Text;
                ShowPasswordIcon.Text = "\ue9a9";
            }
        }
        #endregion
        #region Change Handlers
        private static void OnPasswordPropertyChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var control = (PasswordUserBox)d;
            if (control._isUpdating)
                return;

            var newPassword = e.NewValue as string ?? string.Empty;
            if (control.PasswordTextBox.Password != newPassword)
            {
                control.PasswordTextBox.Password = newPassword;
            }
            if (control.ShowPasswordTextBox.Text != newPassword)
            {
                control.ShowPasswordTextBox.Text = newPassword;
            }
        }

        private void PasswordTextBox_PasswordChanged(object sender, RoutedEventArgs e)
        {
            try
            {
                _isUpdating = true;
                Password = PasswordTextBox.Password;
            }
            finally
            {
                _isUpdating = false;
            }
        }

        private void ShowPasswordTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                _isUpdating = true;
                Password = ShowPasswordTextBox.Text;
            }
            finally
            {
                _isUpdating = false;
            }
        }
        #endregion
    }
}
