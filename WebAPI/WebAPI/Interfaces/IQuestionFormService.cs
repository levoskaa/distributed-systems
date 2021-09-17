using System.Collections.Generic;
using WebAPI.Models;

namespace WebAPI.Interfaces
{
    public interface IQuestionFormService
    {
        IEnumerable<QuestionForm> GetQuestionForms();

        QuestionForm GetQuestionForm(long id);

        QuestionForm SaveQuestionForm(QuestionForm questionForm);

        void UpdateQuestionForm(long id, QuestionForm questionForm);

        void DeleteQuestionForm(long id);

        bool QuestionFormExistsById(long id);
    }
}