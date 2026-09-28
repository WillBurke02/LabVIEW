using System.Windows;
using TimetTankSix.Services;
using TimetTankSix.Managers;

namespace TimetTankSix.Windows
{
    public partial class AddUserWindow : Window
    {
        #region Contstructor
        public AddUserWindow()
        {
            InitializeComponent();
        }
        #endregion
        #region Buttons
        private void AddUserBtn_OnClick(object sender, RoutedEventArgs e)
        {
            var _username = UsernameTextBox.Text;
            var _password = PasswordTextBox.Password;
            var _confirmPassword = ConfirmPasswordTextBox.Password;
            var _firstName = FirstNameTextBox.Text;
            var _lastName = LastNameTextBox.Text;
            var _admin = AdminToggleBtn.IsChecked ?? false;
            if (string.IsNullOrWhiteSpace(_username) || string.IsNullOrWhiteSpace(_password) || string.IsNullOrWhiteSpace(_confirmPassword))
            {
                MessageBox.Show("Username and Password fields cannot be empty.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            if (_password != _confirmPassword)
            {
                MessageBox.Show("Passwords do not match.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            UserService.AddUser(_username, _password, _admin, _firstName, _lastName);
            if (WindowManager.GetManageUsersWindow() != null)
            {
                WindowManager.GetManageUsersWindow().RefreshDataGrid();
            }
            this.Close();
        }
        #endregion
    }
}
