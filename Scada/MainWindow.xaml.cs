using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows;
using System.Windows.Controls;
using TimetTankSix.Managers;
using TimetTankSix.Services;

namespace TimetTankSix
{
    public partial class MainWindow : Window, INotifyPropertyChanged
    {
        #region Fields/Variables
        public UserService UserService { get; set; }
        public int CurrentTabIndex { get; set; }
        public Dictionary<int, Page> PageCache { get; set; } = new Dictionary<int, Page>();

        // Map tab indices to page types
        private readonly Dictionary<int, Type> _pageTypes = new Dictionary<int, Type>
        {
            { 0, typeof(Pages.StartPage) },
            { 1, typeof(Pages.InformationPage) },
            { 2, typeof(Pages.SetupPage) },
            { 3, typeof(Pages.BeamPage) },
            { 4, typeof(Pages.ScanPage) },
            { 5, typeof(Pages.AnalysisPage) },
            { 6, typeof(Pages.SnrPage) },
            { 7, typeof(Pages.HeatPage) },
            { 8, typeof(Pages.ReportPage) },
            { 9, typeof(Pages.DiagnosticPage) },
            { 10, typeof(Pages.AlignmentPage) }
        };
        #endregion
        #region Constructor
        public MainWindow()
        {
            InitializeComponent();

            UserService = ((App)Application.Current).GetService<UserService>();

            this.DataContext = this;

            this.Loaded += MainWindow_Loaded;
            this.KeyDown += MainWindow_KeyDown;
            this.Closed += MainWindow_Closed;
        }
        #endregion
        #region Events
        public void MainWindow_Loaded(object sender, RoutedEventArgs e)
        {
            ManageUsersMenuItem.Visibility = Visibility.Collapsed;
            LogoutSeparator.Visibility = Visibility.Collapsed;
            LogoutMenuItem.Visibility = Visibility.Collapsed;
            this.WindowState = WindowState.Maximized;

            StartNavButton.Style = (Style)FindResource("ActiveTabNavigationButtonStyle");
            MainWindowNavigate(0);
        }

        private void MainWindow_KeyDown(object sender, System.Windows.Input.KeyEventArgs e)
        {
            if (e.Key == System.Windows.Input.Key.F11)
            {
                this.WindowState = WindowState.Maximized;
            }
            if (e.Key == System.Windows.Input.Key.Escape)
            {
                this.WindowState = WindowState.Normal;
            }
        }

        private void MainWindow_Closed(object sender, System.EventArgs e)
        {
            WindowManager.CloseAllWindows();
        }
        #endregion
        #region Buttons
        #region Top Menu
        private void AccountBtn_OnClick(object sender, RoutedEventArgs e)
        {
            AccountPopup.IsOpen = !AccountPopup.IsOpen;
        }

        private void LoginMenuItem_OnClick(object sender, RoutedEventArgs e)
        {
            AccountPopup.IsOpen = false;
            WindowManager.OpenWindow("LogIn", null);
        }

        private void LogoutMenuItem_OnClick(object sender, RoutedEventArgs e)
        {
            AccountPopup.IsOpen = false;
            UserService.LogOutUser();
            UpdateCurrentUser();
        }

        private void ManageUsersMenuItem_OnClick(object sender, RoutedEventArgs e)
        {
            AccountPopup.IsOpen = false;
            WindowManager.OpenWindow("ManageUsers", null);
        }
        #endregion
        #region Tab Navigation
        private void TabNavigationBtn_OnClick(object sender, RoutedEventArgs e)
        {
            var button = sender as System.Windows.Controls.Button;
            int tabIndex = int.Parse(button.Tag.ToString());
            if(tabIndex != CurrentTabIndex)
            {
                SetNavigationButtonsInactiveStyle();
                button.Style = (Style)FindResource("ActiveTabNavigationButtonStyle");
                CurrentTabIndex = tabIndex;
                MainWindowNavigate(CurrentTabIndex);
            }
            else
            {
                return;
            }
        }
        public void SetNavigationButtonsInactiveStyle()
        {
            var navDefStyle = (Style)FindResource("TabNavigationButtonStyle");
            StartNavButton.Style = navDefStyle;
            InformationNavButton.Style = navDefStyle;
            ChannelNavButton.Style = navDefStyle;
            BeamNavButton.Style = navDefStyle;
            ScanNavButton.Style = navDefStyle;
            ResultsNavButton.Style = navDefStyle;
            SNRNavButton.Style = navDefStyle;
            HeatNavButton.Style = navDefStyle;
            ReportingNavButton.Style = navDefStyle;
            DiagnosticNavButton.Style = navDefStyle;
            AlignmentNavButton.Style = navDefStyle;
        }
        #endregion
        #endregion
        #region Update UI
        public void UpdateCurrentUser()
        {
            var _currentUser = UserService.CurrentUser;
            if (_currentUser != null)
            {
                LoginMenuItem.Visibility = Visibility.Collapsed;
                LogoutMenuItem.Visibility = Visibility.Visible;
                if (_currentUser.Admin)
                {
                    ManageUsersMenuItem.Visibility = Visibility.Visible;
                    LogoutSeparator.Visibility = Visibility.Visible;
                }
                CurrentUserText.Text = $"Welcome, {_currentUser.FirstName} {_currentUser.LastName}.";
            }
            else
            {
                LoginMenuItem.Visibility = Visibility.Visible;
                LogoutMenuItem.Visibility = Visibility.Collapsed;
                ManageUsersMenuItem.Visibility = Visibility.Collapsed;
                LogoutSeparator.Visibility = Visibility.Collapsed;
                CurrentUserText.Text = "Not logged in.";
            }
            this.Show();
            this.Focus();
            this.Topmost = true;
        }
        #endregion
        #region Navigation
        public void MainWindowNavigate(int tabIndex)
        {
            if (PageCache.TryGetValue(tabIndex, out Page cachedPage))
            {
                MainFrame.Navigate(cachedPage);
            }
            else
            {
                if (_pageTypes.TryGetValue(tabIndex, out Type pageType))
                {
                    Page newPage = (Page)Activator.CreateInstance(pageType);
                    PageCache[tabIndex] = newPage;
                    MainFrame.Navigate(newPage);
                }
            }

            CurrentTabIndex = tabIndex;
        }

        public void ClearPageFromCache(int tabIndex)
        {
            if (PageCache.ContainsKey(tabIndex))
            {
                PageCache.Remove(tabIndex);
            }
        }

        public void ClearAllPageCache()
        {
            PageCache.Clear();
        }
        #endregion
        #region INotifyPropertyChanged
        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(DataContext, new PropertyChangedEventArgs(propertyName));
        }
        #endregion
    }
}
