using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(lab9_web.Startup))]
namespace lab9_web
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
