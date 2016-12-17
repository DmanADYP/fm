using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CCWcfService.Model
{
    public class Regions
    {
        public string Name { get; set; }
        public string ID { get; set; }
        List<ZipcodeGroup> ZipCodes { get; set; }
    }
}