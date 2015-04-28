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
                "{namespace}/{controller}/{id}",
                new { @namespace = "api", controller = "ToDoItems", id = RouteParameter.Optional }
            );

            AppSettingsReader reader = new AppSettingsReader();
            string clientUrl = reader.GetValue("clientUrl", typeof(string)).ToString();

            // CORS URL must be all lowercase
            clientUrl = clientUrl.ToLowerInvariant();

            config.EnableCors(new EnableCorsAttribute(clientUrl, "*", "*", "*"));
        }
    }
}
