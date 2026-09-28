namespace TimetTankSix.Helpers
{
    public class NumericValidationHelper
    {
        public static bool IsInputNumeric(string text)
        {
            System.Text.RegularExpressions.Regex _numericRegex = new
            System.Text.RegularExpressions.Regex("[^0-9.-]+");
            return _numericRegex.IsMatch(text) == false;
        }
        public static bool IsTextAValidNumber(string text)
        {
            return double.TryParse(text, out _);
        }
    }
}
