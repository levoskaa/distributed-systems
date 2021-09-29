using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using WebAPI.DTOs;
using WebAPI.Interfaces;
using WebAPI.Models;
using WebAPI.Services;

namespace WebAPI.Controllers
{
    [Route("api/question-form-answer")]
    [ApiController]
    public class QuestionFormAnswerController : ControllerBase
    {
        private readonly IQuestionFormAnswerService _service;

        public QuestionFormAnswerController(IQuestionFormAnswerService service)
        {
            this._service = service;
        }

        // Fetch all question form answers
        [HttpGet]
        public ActionResult<IEnumerable<QuestionFormAnswerDTO>> GetQuestionForms()
        {
            return Ok(_service.GetQuestionFormAnswers().Select(qfa => new QuestionFormAnswerDTO(qfa)));
        }

        // Create a new question form answer
        [HttpPost]
        public ActionResult<QuestionFormAnswerDTO> CreateNewQuestionFormAnswer(QuestionFormAnswerDTO questionFormAnswerDTO)
        {
            // Handle error if no data is sent.
            if (questionFormAnswerDTO == null)
            {
                return BadRequest("QuestionFormAnswer data must be set!");
            }
            try
            {
                // Map the DTO to entity and save the entity
                QuestionFormAnswer createdEntity = _service.SaveQuestionFormAnswer(questionFormAnswerDTO.ToEntity());
                // According to the conventions, we have to return a HTTP 201 created repsonse, with
                // field "Location" in the header pointing to the created object
                return CreatedAtAction(string.Empty,
                    new QuestionFormAnswerDTO(createdEntity)
                    );
            }
            catch (QuestionFormDoesntExistException)
            {
                return BadRequest("No QuestionForm exists with the given ID!");
            }
            catch (AnsweredQuestionNotInQuestionFormException)
            {
                return BadRequest("Answer given for a Question that is not part of the QuestionForm!");
            }
            catch (AnswerTooLongException)
            {
                return BadRequest("Answer too long!");
            }
            catch (IncorrectAnswerFormatException e)
            {
                return BadRequest(e.Message);
            }
        }
    }
}
