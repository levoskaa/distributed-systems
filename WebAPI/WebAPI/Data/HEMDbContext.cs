using Microsoft.EntityFrameworkCore;
using WebAPI.Models;

namespace WebAPI.Data
{
    public class HEMDbContext : DbContext
    {
        public HEMDbContext(DbContextOptions<HEMDbContext> options) : base(options) { }

        public DbSet<QuestionForm> QuestionForms { get; set; }
        public DbSet<Question> Questions { get; set; }
        public DbSet<FreeTextQuestion> FreeTextQuestions { get; set; }
        public DbSet<MultipleChoiceQuestion> MultipleChoiceQuestions { get; set; }
        public DbSet<TrueOrFalseQuestion> TrueOrFalseQuestions { get; set; }

        public DbSet<QuestionFormAnswer> QuestionFormAnswers { get; set; }
        public DbSet<Answer> Answers { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Question>().ToTable("Questions");
            modelBuilder.Entity<FreeTextQuestion>().ToTable("Questions");
            modelBuilder.Entity<MultipleChoiceQuestion>().ToTable("Questions");
            modelBuilder.Entity<TrueOrFalseQuestion>().ToTable("Questions");
        }
    }
}