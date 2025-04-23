namespace RankAPI.Models
{
    public class MonthlyRankings
    {
        public int RankingID { get; set; }
        public int PlayerID { get; set; }
        public Players Player { get; set; }
        public int Year { get; set; }
        public int Month { get; set; }
        public int TotalScore { get; set; }
        public int Rank { get; set; }
    }
}
