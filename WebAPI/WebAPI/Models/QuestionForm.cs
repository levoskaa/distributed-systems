using System.Collections.Generic;

namespace WebAPI.Models
{
    public class QuestionForm
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public ICollection<Question> Questions { get; set; }
    }
}