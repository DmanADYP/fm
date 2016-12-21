using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CodeChallenge.Api.Controllers
{
  public class PingController : ApiController
  {
    public string Get()
    {
           string BASEURL = "http://localhost:60390/Service/ServiceRegions.svc/"; ;
            try
            {
                var webClient = new WebClient();
                var json = webClient.DownloadString(BASEURL + "findAll");
                return "Pong!";

            }
            catch (Exception)
            {

                throw;
            }
            

     
    }
  }
}
