using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CCWcfService.Model
{
  public class Region
  {
    public string Id { get; set; }
    public string Name { get; set; }
    public List<ZipcodeGroup> Zipcodes { get; set; }
  }
}