namespace chineseBackend.Modells
{
   using System.ComponentModel.DataAnnotations;

    public class Etel
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(100)]
        public string? Nev { get; set; }

        public string? Leiras { get; set; }

        [Required]
        public decimal Ar { get; set; }

        [Required]
        [MaxLength(50)]
        public string? Kategoria { get; set; }
    }
}
