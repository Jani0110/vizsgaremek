using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace chineseBackend.Modells
{
    public class Rendeles
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public DateTime RendelesDatum { get; set; }

        [Required]
        public required List<Etel> Etelek { get; set; }

        [Required]
        [MaxLength(100)]
        public string? MegrendeloNeve { get; set; }

        [Required]
        public decimal Vegosszeg { get; set; }
    }

}
