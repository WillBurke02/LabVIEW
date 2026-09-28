using System;
using System.Text;

namespace TimetTankSix.Helpers
{
    public class EncryptionHelper
    {
        static public string Decode(string _toDecode)
        {
            byte[] _encodedDataAsBytes = Convert.FromBase64String(_toDecode);
            string _returnValue = Encoding.ASCII.GetString(_encodedDataAsBytes);
            return _returnValue;
        }

        static public string Encode(string _toEncode)
        {
            byte[] _toEncodeAsBytes = Encoding.ASCII.GetBytes(_toEncode);
            string _returnValue = Convert.ToBase64String(_toEncodeAsBytes);
            return _returnValue;
        }
    }
}