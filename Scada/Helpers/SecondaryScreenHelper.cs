using System.Linq;
using WpfScreenHelper;

namespace TimetTankSixHelpers
{
    public class SecondaryScreenHelper
    {
        public static bool IsSecondaryScreenAvailable()
        {
            var _screens = Screen.AllScreens;
            int _screenCount = _screens.Count();
            return _screenCount > 1;
        }

        public static Screen GetSecondaryScreen()
        {
            var _screens = Screen.AllScreens;
            if (_screens.Count() > 1)
            {
                return _screens.ElementAt(1);
            }
            return null;
        }
    }
}
