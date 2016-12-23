using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace RegionApp.Models
{
    public class RegionModel
    {

        [Required]
        [Key]
        [Display(Name = "ID")]
        public string ID { get; set; }
        [Required]
        [Display(Name = "Name")]
        public string Name { get; set; }
        [Required]
        [Display(Name = "Zipcodes")]
        public List<ZipCodeModel> ZipCodes { get; set; }
        [Required]
        [Display(Name = "Zipcodes")]
        public string Zip { get; set; }
        [Display(Name = "Start")]
        public string Start { get; set; }
        [Display(Name = "End")]
        public string End { get; set; }



    }
}