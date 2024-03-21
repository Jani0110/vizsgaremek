using chineseBackend.Modells;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace chineseBackend.Modells
{
    public class RendeltTermek
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public int RendeltTermekId { get; set; }

        [Required]
        public int Mennyiseg { get; set; }

        [Required]
        [Column(TypeName = "decimal(18,2)")]
        public decimal Osszesen { get; set; }

        [ForeignKey("RendeltTermekId")]
        public required RendeltTermek RendeltTermekek { get; set; }

        public int RendelesId { get; set; }
        public required Rendeles Rendeles { get; set; }
    }
}
