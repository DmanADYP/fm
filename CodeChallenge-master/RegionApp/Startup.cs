using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(RegionApp.Startup))]
namespace RegionApp
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
