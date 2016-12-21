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
        [Display(Name = "ZipCodes")]
        public List<ZipCodeModel> ZipCodes { get; set; }
    }
}