using System.Windows;
using TimetTankSix.Services;
using TimetTankSix.Managers;

namespace TimetTankSix.Windows
{
    public partial class EditUserWindow : Window
    {
        #region Constructor
        private int _userIndex;
        public EditUserWindow(int userIndex)
        {
            InitializeComponent();
            _userIndex = userIndex;
            var _user = UserService.Users[userIndex];
            UsernameTextBox.Text = _user.Username;
            PasswordTextBox.Password = _user.Password;
            ConfirmPasswordTextBox.Password = _user.Password;
            AdminToggleBtn.IsChecked = _user.Admin;
            FirstNameTextBox.Text = _user.FirstName;
            LastNameTextBox.Text = _user.LastName;
        }
        #endregion
        #region Save User Button
        private void SaveUserBtn_OnClick(object sender, RoutedEventArgs e)
        {
            UserService.UpdateUser(_userIndex, UsernameTextBox.Text, PasswordTextBox.Password, AdminToggleBtn.IsChecked, FirstNameTextBox.Text, LastNameTextBox.Text);
            if (WindowManager.GetManageUsersWindow() != null)
            {
                WindowManager.GetManageUsersWindow().RefreshDataGrid();
            }
            this.Close();
        }
        #endregion
    }
}
