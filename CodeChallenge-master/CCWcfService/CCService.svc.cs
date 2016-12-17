using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using CCWcfService.Model;

namespace CCWcfService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "CCService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select CCService.svc or CCService.svc.cs at the Solution Explorer and start debugging.
    public class CCService : ICCService
    {
        //private RegionsModelEntities _re;
        
        public bool create(Region region)
        {
            try
            {
                Region r = new Region();
                r.Id = region.Id;
                r.Name = region.Name;
                r.Zipcodes = region.Zipcodes;
               
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }

        public bool delete(Region region)
        {
            using (RegionsModelEntities _re = new RegionsModelEntities())
            {


                try
                {
                    Region r = _re.Regions.Single(reg => reg.Id == region.Id);
                    _re.Regions.Remove(r);
                    _re.SaveChanges();
                    return true;
                }
                catch (Exception)
                {

                    return false;
                }
            }
        }

        public Region find(string id)
        {
            using (RegionsModelEntities _re = new RegionsModelEntities())
            {


                return _re.Regions.Where(r => r.Id == id).Select(r => new Region
                {
                    Id = r.Id,
                    Name = r.Name,
                    Zipcodes = r.Zipcodes
                }).First();
            }
        }
        public List<Region> FindAll()
        {
            using (RegionsModelEntities _re = new RegionsModelEntities())
            {
              return  _re.Regions.Select(r => new Region
                {
                    Id = r.Id,
                    Name = r.Name,
                    Zipcodes = r.Zipcodes

                }).ToList();
            }
        }
    }
}
