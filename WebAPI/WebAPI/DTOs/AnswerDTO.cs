using WebAPI.Models;

namespace WebAPI.DTOs
{
    public class AnswerDTO
    {
        public long QuestionId { get; set; }
        public string AnswerText { get; set; }

        public AnswerDTO()
        { }

        public AnswerDTO(Answer answer)
        {
            this.QuestionId = answer.QuestionId;
            this.AnswerText = answer.AnswerText;
        }

        public Answer ToEntity()
        {
            return new Answer
            {
                QuestionId = this.QuestionId,
                AnswerText = this.AnswerText
            };
        }
    }
}
