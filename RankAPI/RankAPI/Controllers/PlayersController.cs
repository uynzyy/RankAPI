using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RankAPI.Data;
using System;

namespace RankAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PlayersController : ControllerBase
    {
        private readonly RankingContext _context;

        public PlayersController(RankingContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll() =>
            Ok(await _context.Players.ToListAsync());

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var player = await _context.Players.FindAsync(id);
            return player == null ? NotFound() : Ok(player);
        }

        [HttpGet("{id}/scores")]
        public async Task<IActionResult> GetScores(int id)
        {
            var scores = await _context.GamePlays
                .Where(p => p.PlayerID == id)
                .OrderByDescending(p => p.PlayedAt)
                .ToListAsync();
            return Ok(scores);
        }
    }
}
