using System.Collections.Generic;

namespace WebAPI.Models
{
    public class QuestionFormAnswer
    {
        public long Id { get; set; }
        public long QuestionFormId { get; set; }
        public ICollection<Answer> Answers { get; set; }

    }
}
