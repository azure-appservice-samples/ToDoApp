using System.Configuration;
using System.Web.Http;
using System.Web.Http.Cors;

namespace MultiChannelToDo
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                "DefaultApi",
                "api/{controller}/{id}",
                new { id = RouteParameter.Optional }
            );

            AppSettingsReader reader = new AppSettingsReader();
            string clientUrl = reader.GetValue("clientUrl", typeof(string)).ToString();

            config.EnableCors(new EnableCorsAttribute(clientUrl, "*", "*", "*"));
        }
    }
}
