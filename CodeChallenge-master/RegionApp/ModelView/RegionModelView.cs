using RegionApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RegionApp.ModelView
{
    public class RegionModelView
    {
        public List<RegionModel> lrm { get; set; }
        public RegionModel rm { get; set; }
        public List<ZipCodeModel> lcm { get; set; }
        public ZipCodeModel zcp { get; set; }
        public List<Zip> lz { get; set; }
        public Zip z { get; set; }


    }
}