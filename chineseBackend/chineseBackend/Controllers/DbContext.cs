using chineseBackend.Modells;
using Microsoft.EntityFrameworkCore;

namespace chineseBackend.Data
{
    public class WebshopDbContext : DbContext
    {
        public WebshopDbContext(DbContextOptions<WebshopDbContext> options)
            : base(options)
        {
        }

        public DbSet<Etel> Etelek { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

        }
    }
}
