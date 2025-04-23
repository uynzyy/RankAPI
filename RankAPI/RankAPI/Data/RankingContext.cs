using Microsoft.EntityFrameworkCore;
using RankAPI.Models;

namespace RankAPI.Data
{
    public class RankingContext : DbContext
    {
        public RankingContext(DbContextOptions<RankingContext> options) : base(options) { }

        public DbSet<Players> Players { get; set; }
        public DbSet<GamePlays> GamePlays { get; set; }
        public DbSet<MonthlyRankings> MonthlyRankings { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<MonthlyRankings>()
                .HasOne(r => r.Player)
                .WithMany(p => p.Score)
                .HasForeignKey(r => r.PlayerId);
        }
    }
}
