using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using TimetTankSix.Helpers;
using TimetTankSix.Managers;
using TimetTankSix.Objects;
using TimetTankSix.Models;

namespace TimetTankSix.Services
{
    public class UserService : ObservableObject, IDisposable
    {
        private static string EncryptedDefaultAdmin = "VFMyNDc7UXJvdGVrQDIwMjUhO1RydWU7VGVjaG5pY2FsO1NvbHV0aW9ucw==";
        private static string UserFilePath = AppDomain.CurrentDomain.BaseDirectory + "Users.txt";
        public static List<UserModel> Users { get; set; } = new List<UserModel>();
        public static UserModel CurrentUser;
        public void Dispose() { SaveUsers(); }

        public UserService()
        {
            GetUsers();
        }

        public static bool ValidateUserLogIn(string _username, string _password)
        {
            foreach (var _user in Users)
            {
                if (_user.Username == _username && _user.Password == _password)
                {
                    CurrentUser = _user;
                    var _mainWindow = App.Current.MainWindow as MainWindow;
                    _mainWindow?.UpdateCurrentUser();
                    return true;
                }
            }
            return false;
        }

        private void GetUsers()
        {
            if (File.Exists(UserFilePath))
            {
                var _lines = File.ReadAllLines(UserFilePath);
                var _linesList = _lines.ToList();
                foreach (var line in _linesList)
                {
                    var _encrytedLine = line;
                    var _decryptedLine = EncryptionHelper.Decode(_encrytedLine);
                    var _lineParts = _decryptedLine.Split(';');
                    var _user = new UserModel(

                        _lineParts[0],
                        _lineParts[1],
                        bool.Parse(_lineParts[2]),
                        _lineParts[3],
                        _lineParts[4]
                    );
                    Users.Add(_user);
                }
            }
            else
            {
                File.WriteAllText(UserFilePath,
                    EncryptedDefaultAdmin + Environment.NewLine);
                var _x = EncryptionHelper.Decode(EncryptedDefaultAdmin);
                var _y = _x.Split(';');
                var _z = new UserModel(
                    _y[0],
                    _y[1],
                    bool.Parse(_y[2]),
                    _y[3],
                    _y[4]
                );
                Users.Add(_z);
            }
        }

        public static void AddUser(string _username, string _password, bool _admin, string _firstName, string _lastName)
        {
            if (CurrentUser.Admin)
            {
                if (File.Exists(UserFilePath))
                {
                    var _user = new UserModel(_username, _password, _admin, _firstName, _lastName);
                    Users.Add(_user);
                    var _line = $"{_username};{_password};{_admin};{_firstName};{_lastName}";
                    var _encryptedLine = EncryptionHelper.Encode(_line);
                    File.AppendAllText(UserFilePath, _encryptedLine + Environment.NewLine);
                }
                else
                {
                    var _user = new UserModel(_username, _password, _admin, _firstName, _lastName);
                    Users.Add(_user);
                    var _line = $"{_username};{_password};{_admin};{_firstName};{_lastName}";
                    var _encryptedLine = EncryptionHelper.Encode(_line);
                    File.WriteAllText(UserFilePath, _encryptedLine + Environment.NewLine);
                }
            }
        }

        public static void UpdateUser(int _index, string _username, string _password, bool? _admin, string _firstName, string _lastName)
        {
            if (CurrentUser.Admin)
            {
                var userToUpdate = Users[_index];
                userToUpdate.Username = _username;
                userToUpdate.Password = _password;
                userToUpdate.Admin = _admin ?? false;
                userToUpdate.FirstName = _firstName;
                userToUpdate.LastName = _lastName;
                Users[_index] = userToUpdate;
            }
        }

        public static void DeleteUser(int _index)
        {
            Debug.WriteLine("Removing user at index: " + _index);
            var _currentUserIndex = Users.IndexOf(CurrentUser);
            Debug.WriteLine("Current user at index: " + _currentUserIndex);
            if (_index == _currentUserIndex)
            {
                LogOutUser();
            }
            Users.RemoveAt(_index);
        }

        public static Task SaveUsers()
        {
            return Task.Run(() =>
            {
                if (File.Exists(UserFilePath))
                {
                    File.Delete(UserFilePath);
                }
                foreach (var user in Users)
                {
                    var _line = $"{user.Username};{user.Password};{user.Admin};{user.FirstName};{user.LastName}";
                    var _encryptedLine = EncryptionHelper.Encode(_line);
                    File.AppendAllText(UserFilePath, _encryptedLine + Environment.NewLine);
                }
            });
        }

        public static void LogOutUser()
        {
            WindowManager.CloseAllAccountWindows();
            CurrentUser = null;
            var _mainWindow = App.Current.MainWindow as MainWindow;
            _mainWindow?.UpdateCurrentUser();
        }

    }
}