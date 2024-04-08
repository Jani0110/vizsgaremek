using System.ComponentModel.DataAnnotations;

public class FoodItem
{
    [Key]
    public int Id { get; set; }

    [Required]
    [MaxLength(100)]
    public string Nev { get; set; }

    public string Leiras { get; set; }

    [Required]
    public float Ar { get; set; }

    [Required]
    [MaxLength(50)]
    public string Kategoria { get; set; }
}
