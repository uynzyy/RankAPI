namespace RankAPI
{
    public class Player
    {
        public int PlayerID { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public DateTime CreatedAt { get; set; }
        public ICollection<GamePlays> GamePlays { get; set; }
    }

    public class GamePlays
    {
        public int PlayID { get; set; }
        public int PlayerID { get; set; }
        public Player Player { get; set; }
        public int Score { get; set; }
        public DateTime PlayedAt { get; set; }
    }

    public class MonthlyRankings
    {
        public int RankingID { get; set; }
        public int PlayerID { get; set; }
        public Player Player { get; set; }
        public int Year { get; set; }
        public int Month { get; set; }
        public int TotalScore { get; set; }
        public int Rank { get; set; }
    }
}
