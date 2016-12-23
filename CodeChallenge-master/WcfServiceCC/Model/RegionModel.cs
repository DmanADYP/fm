using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WcfServiceCC.Model
{
    public class RegionModel
    {
        public string Name { get; set; }
        public string ID { get; set; }
        public List<ZipCodeModel> ZipCodes { get; set; }
        public string  Zip { get; set; }
    }
}