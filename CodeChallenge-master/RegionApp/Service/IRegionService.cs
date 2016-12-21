using RegionApp.Models;
using System.Collections.Generic;

namespace RegionApp.Service
{
    public interface IRegionService
    {
        string BASEURL { get; set; }
        List<RegionModel> FindAll();

        RegionModel Find(string id);
       
        bool create(RegionModel region);

        bool Edit(RegionModel region);

        bool Delete(RegionModel region);

        //ZipCodes

        List<Zip> ZipFindAll();
       
    }
}
