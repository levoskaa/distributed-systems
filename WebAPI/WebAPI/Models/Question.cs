namespace WebAPI.Models
{
    public abstract class Question
    {
        public long Id { get; set; }
        public string QuestionText { get; set; }
    }
}