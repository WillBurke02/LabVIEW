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
using TimetTankSix.Models;

namespace TimetTankSix.Windows
{
    public partial class ManageUsersWindow : Window
    {
        public int SelectedIndex { get; set; }

        public ManageUsersWindow()
        {
            InitializeComponent();
            EditUserButton.IsEnabled = false;
            UsersDataGrid.ItemsSource = UserService.Users;

            RefreshDataGrid();
        }

        private void AddUserButton_Click(object sender, RoutedEventArgs e)
        {
            WindowManager.OpenWindow("AddUser", null);
        }

        private void EditUserButton_Click(object sender, RoutedEventArgs e)
        {
            if (UsersDataGrid.SelectedIndex == -1)
            {
                return;
            }
            var _selectedUser = UsersDataGrid.SelectedItem as UserModel;
            if (_selectedUser == null)
            {
                return;
            }
            if (!UserService.CurrentUser.Admin && UserService.CurrentUser.Username != _selectedUser.Username)
            {
                return;
            }
            var _selectedIndex = UserService.Users.IndexOf(_selectedUser);
            WindowManager.OpenWindow("EditUser", _selectedIndex);
        }

        private void DeleteUserButton_Click(object sender, RoutedEventArgs e)
        {
            if (DeleteUserColumn.Visibility == Visibility.Collapsed)
            {
                DeleteUserColumn.Visibility = Visibility.Visible;
            }
            else
            {
                DeleteUserColumn.Visibility = Visibility.Collapsed;
            }
        }

        private void DeleteUserCellBtn_OnClick(object sender, RoutedEventArgs e)
        {
            if (DeleteUserColumn.Visibility == Visibility.Visible)
            {
                UserService.DeleteUser(SelectedIndex);
                RefreshDataGrid();
            }
        }

        public void RefreshDataGrid()
        {
            UsersDataGrid.Items.Refresh();
        }

        private void UsersDataGrid_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            if (UsersDataGrid.SelectedIndex != -1)
            {
                SelectedIndex = UsersDataGrid.SelectedIndex;
                if (EditUserButton.IsEnabled == false)
                {
                    EditUserButton.IsEnabled = true;
                }
            }
            else
            {
                EditUserButton.IsEnabled = false;
            }
        }
    }
}
