using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using TimetTankSix.Windows;

namespace TimetTankSix.Managers
{
    public class WindowManager
    {
        #region Dictionaries
        private static readonly Dictionary<string, Window> _windows = [];
        internal static Dictionary<string, Window> WindowsDictionary => _windows;
        #endregion
        #region User Account Instances
        public static ManageUsersWindow? GetManageUsersWindow()
        {
            if (WindowsDictionary.ContainsKey("ManageUsers"))
            {
                return WindowsDictionary["ManageUsers"] as ManageUsersWindow;
            }
            return null;
        }

        public static AddUserWindow? GetAddUserWindow()
        {
            if (WindowsDictionary.ContainsKey("AddUser"))
            {
                return WindowsDictionary["AddUser"] as AddUserWindow;
            }
            return null;
        }

        public static EditUserWindow? GetEditUserWindow()
        {
            if (WindowsDictionary.ContainsKey("EditUser"))
            {
                return WindowsDictionary["EditUser"] as EditUserWindow;
            }
            return null;
        }

        public static LogInWindow? GetLogInWindow()
        {
            if (WindowsDictionary.ContainsKey("LogIn"))
            {
                return WindowsDictionary["LogIn"] as LogInWindow;
            }
            return null;
        }
        #endregion
        #region Alarm Window Instance
        public static AlarmsWindow? GetAlarmsWindow()
        {
            if (WindowsDictionary.ContainsKey("Alarms"))
            {
                return WindowsDictionary["Alarms"] as AlarmsWindow;
            }
            return null;
        }
        #endregion
        #region Open/Close Window Helpers
        public static void OpenWindow(string _windowKey, int? _userIndex)
        {
            if (WindowsDictionary.ContainsKey(_windowKey) && WindowsDictionary[_windowKey].IsLoaded == true)
            {
                WindowsDictionary[_windowKey]?.Show();
            }
            else
            {
                Window? _window = _windowKey switch
                {
                    "LogIn" => new LogInWindow(),
                    "ManageUsers" => new ManageUsersWindow(),
                    "AddUser" => new AddUserWindow(),
                    "EditUser" => new EditUserWindow(_userIndex ?? -1),
                    "Alarms" => new AlarmsWindow(),
                    _ => null,
                };
                if (_window != null)
                {
                    SetupWindow(_windowKey, _window);
                    WindowsDictionary[_windowKey] = _window;
                    _window.Show();
                }
            }
        }

        public static void CloseWindow(string _windowKey)
        {
            if (WindowsDictionary.ContainsKey(_windowKey))
            {
                var _window = WindowsDictionary[_windowKey];
                _window?.Close();
                WindowsDictionary.Remove(_windowKey);
                var _mainWindow = App.Current.MainWindow;
                _mainWindow.Show();
            }
        }

        public static void CloseAllAccountWindows()
        {
            string[] _accountWindows = { "ManageUsers", "AddUser", "EditUser" };
            foreach (var _windowKey in _accountWindows)
            {
                if (WindowsDictionary.ContainsKey(_windowKey))
                {
                    CloseWindow(_windowKey);
                }
            }
        }

        public static void SetupWindow(string _windowKey, Window _window)
        {
            if (WindowConfigDictionary.TryGetValue(_windowKey, out var _config))
            {
                _window.WindowStartupLocation = _config.StartupLocation;
                _window.WindowState = _config.State;
                _window.ResizeMode = _config.ResizeMode;
                _window.Topmost = _config.Topmost;
                _window.Owner = _config.StartupOwner;
            }
        }

        public static void CloseAllWindows()
        {
            foreach (var _window in WindowsDictionary.Values)
            {
                _window.Close();
            }
            WindowsDictionary.Clear();
            App.Current.Shutdown();
        }
        #endregion
        #region Window Configurations
        public class WindowConfig
        {
            public Window StartupOwner { get; set; } = Application.Current.MainWindow;
            public WindowStartupLocation StartupLocation { get; set; } = WindowStartupLocation.CenterOwner;
            public WindowState State { get; set; } = WindowState.Normal;
            public ResizeMode ResizeMode { get; set; } = ResizeMode.NoResize;
            public bool Topmost { get; set; } = true;
        }

        private static Dictionary<string, WindowConfig> WindowConfigDictionary = new()
        {
            { "LogIn", new WindowConfig { Topmost = true } },
            { "ManageUsers", new WindowConfig { Topmost = true } },
            { "AddUser", new WindowConfig { Topmost = true } },
            { "EditUser", new WindowConfig { Topmost = true } },
            { "Alarms", new WindowConfig { Topmost = false } },
        };
        #endregion
    }
}
