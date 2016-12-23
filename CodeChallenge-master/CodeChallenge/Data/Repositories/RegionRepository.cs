using CodeChallenge.Data.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CodeChallenge.Entities;
using System.Runtime.Serialization.Json;
using System.IO;
using System.Text;
using System.Net;
using System.Web.Script.Serialization;

namespace CodeChallenge.Data.Repositories
{
    public class RegionRepository : IRegionRepository
    {
        Dictionary<Guid, Region> regions;
        string BASEURL = "http://localhost:60390/Service/ServiceRegions.svc/";

        public RegionRepository()
        {
            this.regions = new Dictionary<Guid, Region>();
        }

        public void Add(Region region)
        {

            if (regions.ContainsKey(region.Id))
            {


                regions[region.Id] = region;

            }
            else
            {
                DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof
                   (Region));
                MemoryStream mem = new MemoryStream();
                ser.WriteObject(mem, region);
                string data = Encoding.UTF8.GetString(mem.ToArray(), 0, (int)mem.Length);
                WebClient webClient = new WebClient();
                webClient.Headers["Content-type"] = "application/json";
                webClient.Encoding = Encoding.UTF8;
                webClient.UploadString(BASEURL + "create", "POST", data);
                regions.Add(region.Id, region);

            }

        }

        public Region Get(Guid regionId)
        {

            try
            {
                Region region = null;
                var webClient = new WebClient();
                string url = string.Format(BASEURL + "find/{0}", regionId.ToString());
                var json = webClient.DownloadString(url);
                var js = new JavaScriptSerializer();
                return js.Deserialize<Region>(json);
                regions.TryGetValue(regionId, out region);

                return region;

            }
            catch (Exception)
            {

                return null;
            }

        }

        public void Remove(Guid regionId, Region region)
        {
            if (!regions.ContainsKey(regionId))
            {
                throw new InvalidOperationException(string.Format("Region #{0} does not exist.", regionId));
            }

            try
            {
                DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof
                    (Region));
                MemoryStream mem = new MemoryStream();
                ser.WriteObject(mem, region);
                string data = Encoding.UTF8.GetString(mem.ToArray(), 0, (int)mem.Length);
                WebClient webClient = new WebClient();
                webClient.Headers["Content-type"] = "application/json";
                webClient.Encoding = Encoding.UTF8;
                webClient.UploadString(BASEURL + "delete", "DELETE", data);
                regions.Remove(regionId);


            }
            catch (Exception)
            {

                throw;
            }


        }


    }
}