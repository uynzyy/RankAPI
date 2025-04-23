namespace RankAPI.Models
{
    public class Players
    {
        public int PlayerID { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public DateTime CreatedAt { get; set; }
        public ICollection<GamePlays> GamePlays { get; set; }
    }
}
