using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using WebAPI.Data;
using WebAPI.Interfaces;
using WebAPI.Models;

namespace WebAPI.Services
{
    public class QuestionFormAnswerService : IQuestionFormAnswerService
    {
        private readonly HEMDbContext _context;
        private readonly IQuestionFormService _questionFormService;

        public QuestionFormAnswerService(HEMDbContext context, IQuestionFormService questionFormService)
        {
            this._context = context;
            this._questionFormService = questionFormService;
        }

        public QuestionFormAnswer SaveQuestionFormAnswer(QuestionFormAnswer questionFormAnswer)
        {
            if (!_questionFormService.QuestionFormExistsById(questionFormAnswer.QuestionFormId))
            {
                throw new QuestionFormDoesntExistException();
            }
            var questionForm = _questionFormService.GetQuestionForm(questionFormAnswer.QuestionFormId);
            var answeredQuestionNotInQuestionForm = questionFormAnswer.Answers.Any(answer => questionForm.Questions.All(question => answer.QuestionId != question.Id));
            if (answeredQuestionNotInQuestionForm)
            {
                throw new AnsweredQuestionNotInQuestionFormException();
            }
            foreach (var answer in questionFormAnswer.Answers)
            {
                var question = questionForm.Questions.SingleOrDefault(q => q.Id == answer.QuestionId);
                if (question is FreeTextQuestion freeTextQuestion)
                {
                    if (answer.AnswerText.Length > freeTextQuestion.MaxAnswerLength)
                    {
                        throw new AnswerTooLongException();
                    }
                }
                else if (question is MultipleChoiceQuestion multipleChoiceQuestion)
                {
                    if (!multipleChoiceQuestion.PossibleAnswers.Contains(answer.AnswerText))
                    {
                        throw new IncorrectAnswerFormatException("Defined answers do not contain the given answer!");
                    }
                }
                else if (question is TrueOrFalseQuestion trueOrFalseQuestion)
                {
                    if (answer.AnswerText != "true" && answer.AnswerText != "false")
                    {
                        throw new IncorrectAnswerFormatException("True or false answer expected!");
                    }

                }
            }
            // Register the new question form answer as an entity tracekd by EF
            var result = _context.QuestionFormAnswers.Add(questionFormAnswer);
            // Save to database
            _context.SaveChanges();
            return result.Entity;
        }

        public IEnumerable<QuestionFormAnswer> GetQuestionFormAnswers()
        {
            return _context
                .QuestionFormAnswers
                .Include(qfa => qfa.Answers)
                .ToList();
        }

        public QuestionFormAnswer GetQuestionFormAnswer(long id)
        {
            return _context
                .QuestionFormAnswers
                .Include(qfa => qfa.Answers)
                .SingleOrDefault(qfa => qfa.Id == id);
        }

        public bool QuestionFormAnswerExistsById(long id)
        {
            return _context
                .QuestionFormAnswers
                .Any(qfa => qfa.Id == id);
        }
    }
}
