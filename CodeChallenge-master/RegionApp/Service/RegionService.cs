using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RegionApp.Models;
using System.Net;
using System.Web.Script.Serialization;
using System.Runtime.Serialization.Json;
using System.IO;
using System.Text;

namespace RegionApp.Service
{
    public class RegionService : IRegionService
    {
      
        

        public string BASEURL
        {
            get
            {
            return "http://localhost:60390/Service/ServiceRegions.svc/";
            }

            set
            {
                BASEURL = value;
            }
        }

       
        
        public RegionService()
        {

        }
        public bool create(RegionModel region)
        {
            DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof
                    (RegionModel));
            MemoryStream mem = new MemoryStream();
            ser.WriteObject(mem, region);
            string data = Encoding.UTF8.GetString(mem.ToArray(), 0, (int)mem.Length);
            WebClient webClient = new WebClient();
            webClient.Headers["Content-type"] = "application/json";
            webClient.Encoding = Encoding.UTF8;
            webClient.UploadString(BASEURL + "create", "POST", data);
            return true;
        }

        public bool Delete(RegionModel region)
        {
            try
            {
                DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof
                    (RegionModel));
                MemoryStream mem = new MemoryStream();
                ser.WriteObject(mem, region);
                string data = Encoding.UTF8.GetString(mem.ToArray(), 0, (int)mem.Length);
                WebClient webClient = new WebClient();
                webClient.Headers["Content-type"] = "application/json";
                webClient.Encoding = Encoding.UTF8;
                webClient.UploadString(BASEURL + "delete", "DELETE", data);
                return true;

            }
            catch (Exception)
            {

                return false;
            }
        }

        public bool Edit(RegionModel region)
        {
            try
            {
                DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof
                    (RegionModel));
                MemoryStream mem = new MemoryStream();
                ser.WriteObject(mem, region);
                string data = Encoding.UTF8.GetString(mem.ToArray(), 0, (int)mem.Length);
                WebClient webClient = new WebClient();
                webClient.Headers["Content-type"] = "application/json";
                webClient.Encoding = Encoding.UTF8;
                webClient.UploadString(BASEURL + "edit", "PUT", data);
                return true;

            }
            catch (Exception)
            {

                return false;
            }
        }

        public RegionModel Find(string id)
        {
            try
            {
                var webClient = new WebClient();
                string url = string.Format(BASEURL + "find/{0}", id);
                var json = webClient.DownloadString(url);
                var js = new JavaScriptSerializer();
                return js.Deserialize<RegionModel>(json);

            }
            catch (Exception)
            {

                return null;
            }
        }

        public List<RegionModel> FindAll()
        {
            try
            {
                var webClient = new WebClient();
                var json = webClient.DownloadString(this.BASEURL + "findAll");
                var js = new JavaScriptSerializer();
                return js.Deserialize<List<RegionModel>>(json);

            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<Zip> ZipFindAll()
        {
            var webClient = new WebClient();
            var json = webClient.DownloadString(this.BASEURL + "zipfindall");
            var js = new JavaScriptSerializer();
            return js.Deserialize<List<Zip>>(json);
        }

      
    }
}