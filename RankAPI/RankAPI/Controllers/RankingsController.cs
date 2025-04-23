using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using RankAPI.Data;
using System;

namespace RankAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RankingsController : ControllerBase
    {
        private readonly RankingContext _context;

        public RankingsController(RankingContext context)
        {
            _context = context;
        }

        [HttpGet("{year}/{month}")]
        public async Task<IActionResult> GetMonthlyRankings(int year, int month)
        {
            var rankings = await _context.MonthlyRankings
                .Include(r => r.Player)
                .Where(r => r.Year == year && r.Month == month)
                .OrderBy(r => r.Rank)
                .ToListAsync();

            return Ok(rankings);
        }
    }
}
