using System.Collections.Generic;
using System.Linq;
using WebAPI.Models;

namespace WebAPI.DTOs
{
    public class QuestionFormAnswerDTO
    {
        public long QuestionFormId { get; set; }
        public List<AnswerDTO> Answers { get; set; }

        public QuestionFormAnswerDTO()
        { }

        public QuestionFormAnswerDTO(QuestionFormAnswer questionFormAnswer)
        {
            this.QuestionFormId = questionFormAnswer.QuestionFormId;
            this.Answers = questionFormAnswer
                .Answers
                .Select(a => new AnswerDTO(a))
                .ToList();
        }

        public QuestionFormAnswer ToEntity()
        {
            return new QuestionFormAnswer()
            {
                QuestionFormId = this.QuestionFormId,
                Answers = this.Answers.Select(a => a.ToEntity()).ToList()
            };
        }
    }
}
