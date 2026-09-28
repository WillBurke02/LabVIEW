using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Windows;

namespace TimetTankSix
{
    public partial class App : Application
    {
        private readonly Dictionary<Type, object> services = new Dictionary<Type, object>();
        #region Constructor
        public App()
        {
            RegisterService(new Services.UserService());
            RegisterService(new Services.ConfigService());
        }
        #endregion
        #region Services
        private void RegisterService<T>(T service)
        {
            services[typeof(T)] = service;
        }
        public T GetService<T>()
        {
            if (services.TryGetValue(typeof(T), out var service))
            {
                return (T)service;
            }
            throw new InvalidOperationException($"Service of type {typeof(T).Name} not registered.");
        }
        #endregion
        #region Events
        protected override void OnExit(ExitEventArgs e)
        {
            Task.Run(() =>
            {
                Services.UserService.SaveUsers();
            }).Wait();

            base.OnExit(e);
        }
        #endregion
    }
}
