using System.ComponentModel.DataAnnotations;

namespace RegionApp.Models
{
    public class ZipCodeModel
    {
        [Required]
        [Display(Name ="Start")]
        public string Start { get; set; }
        [Required]
        [Display(Name = "End")]
        public string End { get; set; }
    }
}