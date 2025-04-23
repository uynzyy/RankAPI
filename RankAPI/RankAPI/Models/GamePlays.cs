namespace RankAPI.Models
{
    public class GamePlays
    {
        public int PlayID { get; set; }
        public int PlayerID { get; set; }
        public Players Player { get; set; }
        public int Score { get; set; }
        public DateTime PlayedAt { get; set; }
    }
}
