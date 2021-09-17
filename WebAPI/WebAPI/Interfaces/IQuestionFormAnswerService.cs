using WebAPI.Models;

namespace WebAPI.Interfaces
{
    public interface IQuestionFormAnswerService
    {
        QuestionFormAnswer GetQuestionFormAnswer(long id);

        QuestionFormAnswer SaveQuestionFormAnswer(QuestionFormAnswer questionFormAnswer);

        bool QuestionFormAnswerExistsById(long id);
    }
}
