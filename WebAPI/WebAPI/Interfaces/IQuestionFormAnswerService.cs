using System.Collections.Generic;
using WebAPI.Models;

namespace WebAPI.Interfaces
{
    public interface IQuestionFormAnswerService
    {
        IEnumerable<QuestionFormAnswer> GetQuestionFormAnswers();

        QuestionFormAnswer GetQuestionFormAnswer(long id);

        QuestionFormAnswer SaveQuestionFormAnswer(QuestionFormAnswer questionFormAnswer);

        bool QuestionFormAnswerExistsById(long id);
    }
}
