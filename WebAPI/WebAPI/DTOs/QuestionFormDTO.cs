using System.Collections.Generic;
using System.Linq;
using WebAPI.Models;

namespace WebAPI.DTOs
{
    public class QuestionFormDTO
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public List<QuestionDTO> Questions { get; set; }

        // Because of the way JSON Deserialization works (first an object is created, then
        // its properties set), we need a default constructor.
        public QuestionFormDTO()
        { }

        public QuestionFormDTO(QuestionForm questionForm)
        {
            this.Id = questionForm.Id;
            this.Name = questionForm.Name;
            this.Questions = questionForm
            .Questions
            .Select(q => new QuestionDTO(q))
            .ToList();
        }

        public QuestionForm ToEntity()
        {
            return new QuestionForm()
            {
                Id = this.Id,
                Name = this.Name,
                Questions = this.Questions.Select(q => q.ToEntity()).ToList()
            };
        }
    }
}