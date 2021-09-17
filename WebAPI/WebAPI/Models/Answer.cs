namespace WebAPI.Models
{
    public class Answer
    {
        public long Id { get; set; }
        public long QuestionId { get; set; }
        public string AnswerText { get; set; }
    }
}
