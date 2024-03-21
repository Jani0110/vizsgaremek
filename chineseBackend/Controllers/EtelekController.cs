using chineseBackend.Modells;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;

namespace chineseBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EtelekController : ControllerBase
    {
        private readonly WebshopDbContext _context;

        public EtelekController(WebshopDbContext context)
        {
            _context = context;
        }

        // GET: api/Etelek
        [HttpGet]
        public IEnumerable<Etel> GetEtelek()
        {
            return _context.Etelek.ToList();
        }

        // GET: api/Etelek/5
        [HttpGet("{id}")]
        public ActionResult<Etel> GetEtel(int id)
        {
            var etel = _context.Etelek.Find(id);

            if (etel == null)
            {
                return NotFound();
            }

            return etel;
        }

        // POST: api/Etelek
        [HttpPost]
        public ActionResult<Etel> PostEtel(Etel etel)
        {
            _context.Etelek.Add(etel);
            _context.SaveChanges();

            return CreatedAtAction(nameof(GetEtel), new { id = etel.Id }, etel);
        }

        // PUT: api/Etelek/5
        [HttpPut("{id}")]
        public IActionResult PutEtel(int id, Etel etel)
        {
            if (id != etel.Id)
            {
                return BadRequest();
            }

            _context.Entry(etel).State = EntityState.Modified;
            _context.SaveChanges();

            return NoContent();
        }

        // DELETE: api/Etelek/5
        [HttpDelete("{id}")]
        public IActionResult DeleteEtel(int id)
        {
            var etel = _context.Etelek.Find(id);

            if (etel == null)
            {
                return NotFound();
            }

            _context.Etelek.Remove(etel);
            _context.SaveChanges();

            return NoContent();
        }
    }

    public class WebshopDbContext : DbContext
    {
        public WebshopDbContext(DbContextOptions<WebshopDbContext> options)
            : base(options)
        {
        }

        public DbSet<Etel> Etelek { get; set; }
    }
}
