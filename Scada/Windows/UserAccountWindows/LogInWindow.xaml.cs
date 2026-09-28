using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using TimetTankSix.Services;
using TimetTankSix.Managers;

namespace TimetTankSix.Windows
{
    public partial class LogInWindow : Window
    {
        #region Constructor
        public LogInWindow()
        {
            InitializeComponent();
        }
        #endregion
        #region Log In Click/Key Down
        public void TextBoxFocus(object sender, RoutedEventArgs e)
        {
            if (sender is TimetTankSix.Controls.PasswordUserBox)
            {
                CapsLockStatusText();
            }
            else
            {
                HideStatusText();
            }
        }
        private void LogInBtn_OnClick(object sender, RoutedEventArgs e)
        {
            if (UserService.ValidateUserLogIn(UsernameTextBox.Text, PasswordTextBox.Password))
            {
                this.Close();
            }
            else
            {
                IncorrectLoginText();
            }
        }

        private void PasswordTextBox_KeyDown(object sender, KeyEventArgs e)
        {
            if (sender is TimetTankSix.Controls.PasswordUserBox)
            {
                if (e.Key == Key.Enter)
                {
                    LogInBtn_OnClick(sender, e);
                }
                if (e.Key == Key.CapsLock)
                {
                    CapsLockStatusText();
                }
            }
        }
        #endregion
        #region Status Text
        public void CapsLockStatusText()
        {
            if (Keyboard.GetKeyStates(Key.CapsLock) == KeyStates.Toggled)
            {
                StatusLabel.Content = "Warning: Caps Lock is ON";
                StatusLabel.Foreground = Application.Current.FindResource("UrgentAlarmColor") as SolidColorBrush;
            }
            else
            {
                HideStatusText();
            }
        }
        public void IncorrectLoginText()
        {
            StatusLabel.Content = "Username or password is incorrect.";
            StatusLabel.Foreground = Application.Current.FindResource("UrgentAlarmColor") as SolidColorBrush;
        }
        public void HideStatusText()
        {
            StatusLabel.Content = string.Empty;
            StatusLabel.Foreground = Application.Current.FindResource("TabColor") as SolidColorBrush;
        }
        #endregion
    }
}