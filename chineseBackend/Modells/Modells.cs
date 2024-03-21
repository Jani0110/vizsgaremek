using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

public class Etel
{
    [Key]
    public int Id { get; set; }

    [Required]
    [MaxLength(100)]
    public string? Nev { get; set; }

    public string? Leiras { get; set; }

    [Required]
    [Column(TypeName = "decimal(18,2)")]
    public decimal Ar { get; set; }

    [Required]
    [MaxLength(50)]
    public string? Kategoria { get; set; }

    public string? ImageUrl { get; set; }

    public required ICollection<RendeltTermek> RendeltTermekek { get; set; }
}

public class Rendeles
{
    [Key]
    public int Id { get; set; }

    [Required]
    public DateTime RendelesDatum { get; set; }

    [Required]
    [MaxLength(100)]
    public required string MegrendeloNeve { get; set; }

    [Required]
    [Column(TypeName = "decimal(18,2)")]
    public decimal Vegosszeg { get; set; }

    [Required]
    public required List<RendeltTermek> RendeltTermekek { get; set; }
}

public class RendeltTermek
{
    [Key]
    public int Id { get; set; }

    [Required]
    public int EtelId { get; set; }

    [Required]
    public int Mennyiseg { get; set; }

    [Required]
    [Column(TypeName = "decimal(18,2)")]
    public decimal Osszesen { get; set; }

    [ForeignKey("EtelId")]
    public required Etel Etel { get; set; }
    public int RendelesId { get; set; }
    public required Rendeles rendeles { get; set; }
}
