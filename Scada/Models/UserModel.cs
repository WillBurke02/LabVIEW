using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TimetTankSix.Models
{
    public class UserModel
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public bool Admin { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public UserModel(string _username, string _password, bool _admin, string _firstName, string _lastName)
        {
            Username = _username;
            Password = _password;
            Admin = _admin;
            FirstName = _firstName;
            LastName = _lastName;
        }
    }
}
