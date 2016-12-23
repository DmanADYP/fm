using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Text;
using WcfServiceCC.Model;
using WcfServiceCC.Repository;

namespace WcfServiceCC.Service
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "ServiceRegions" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select ServiceRegions.svc or ServiceRegions.svc.cs at the Solution Explorer and start debugging.
    public class ServiceRegions : IServiceRegions
    {
        
        public bool create(RegionModel region)
        {
            using (RegionEntities re = new RegionEntities())
            {
                try
                {
                    Region r = new Region();
                    ZipCode z = new ZipCode();

                    r.ID = region.ID;
                    r.Name = region.Name;
                   

                    z.ID = region.ID;
                    z.Start = region.ZipCodes[0].Start;
                    z.End = region.ZipCodes[0].End;

                    re.Regions.Add(r);
                    re.SaveChanges();

                    re.ZipCodes.Add(z);
                    re.SaveChanges();

                    return true;

                }
                catch (Exception)
                {

                    return false;
                }
            }


        }

        public bool Delete(RegionModel Region)
        {
            using (RegionEntities re = new RegionEntities())
            {
                try
                {
                    
                    Region r = re.Regions.Single(reg => reg.ID == Region.ID);
                    ZipCode z = re.ZipCodes.Single(zip => zip.ID == Region.ID);
                    re.Regions.Remove(r);
                    re.ZipCodes.Remove(z);
                    re.SaveChanges();
                    return true;
                }
                catch (Exception)
                {

                    return false;
                }
            }
        }

        public bool Edit(RegionModel Region)
        {
            using (RegionEntities re = new RegionEntities())
            {
                try
                {
                    
                    Region r = re.Regions.Single(reg => reg.ID == Region.ID);
                    r.ID = Region.ID;
                    r.Name = Region.Name;
                   
                    ZipCode z = re.ZipCodes.Single(zip => zip.ID == Region.ID);
                    z.Start = Region.ZipCodes[0].Start;
                    z.End = Region.ZipCodes[0].End;
                    re.SaveChanges();
                    return true;
                }
                catch (Exception)
                {

                    return false;
                }
            }
        }

        public RegionModel Find(string id)
        {
            using (RegionEntities re = new RegionEntities())
            {
                
                return re.RegionZipCodes.Where(reg => reg.ID == id).Select(reg => new RegionModel
                {
                    ID = reg.ID,
                    Name = reg.Name,
                    ZipCodes = new List<ZipCodeModel> { new ZipCodeModel { Start = reg.Start, End = reg.End} }
                    

                }).FirstOrDefault();
            }
        }
    

        public List<RegionModel> FindAll()
        {
            
            using (RegionEntities re = new RegionEntities())
            {
                return re.RegionZipCodes.Select(r => new RegionModel
                {
                    ID = r.ID,
                    Name = r.Name,
                    Zip =r.Start+"-"+r.End
                   
                }).ToList();

            }
        }

        public List<ZipModel> ZipFindAll()
        {
            using (RegionEntities re = new RegionEntities())
            {
                return re.Zips.Select(z => new ZipModel
                {
                    ZipCode = z.ZipCode
                }).ToList();
            }
        }
    }
}
