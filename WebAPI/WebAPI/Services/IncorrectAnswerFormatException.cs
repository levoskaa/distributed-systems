using System;

namespace WebAPI.Services
{
    public class IncorrectAnswerFormatException : Exception
    {
        public IncorrectAnswerFormatException()
        { }

        public IncorrectAnswerFormatException(string message)
            : base(message)
        { }
    }
}
