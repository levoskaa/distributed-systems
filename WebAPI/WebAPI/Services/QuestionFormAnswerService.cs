using Microsoft.EntityFrameworkCore;
using System.Linq;
using WebAPI.Data;
using WebAPI.Interfaces;
using WebAPI.Models;

namespace WebAPI.Services
{
    public class QuestionFormAnswerService : IQuestionFormAnswerService
    {
        private readonly HEMDbContext _context;

        public QuestionFormAnswerService(HEMDbContext context)
        {
            this._context = context;
        }

        public QuestionFormAnswer GetQuestionFormAnswer(long id)
        {
            return _context
                .QuestionFormAnswers
                .Include(qfa => qfa.Answers)
                .SingleOrDefault(qfa => qfa.Id == id);
        }

        public QuestionFormAnswer SaveQuestionFormAnswer(QuestionFormAnswer questionFormAnswer)
        {
            // If there is already a question form answer with this Id, throw an exception
            if (QuestionFormAnswerExistsById(questionFormAnswer.Id))
            {
                throw new QuestionFormAnswerExistsException();
            }
            // Register the new question form answer as an entity tracekd by EF
            var result = _context.QuestionFormAnswers.Add(questionFormAnswer);
            // Save to database
            _context.SaveChanges();
            return result.Entity;
        }

        public bool QuestionFormAnswerExistsById(long id)
        {
            return _context
                .QuestionFormAnswers
                .Any(qfa => qfa.Id == id);
        }
    }
}
