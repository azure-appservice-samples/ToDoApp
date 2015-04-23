namespace MultiChannelToDo.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;
    using MultiChannelToDo.Models;
    using System.Collections.Generic;

    internal sealed class Configuration : DbMigrationsConfiguration<MultiChannelToDo.Models.MultiChannelToDoContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(MultiChannelToDo.Models.MultiChannelToDoContext context)
        {
            context.ToDoItems.AddRange(new List<TodoItem> {
            new TodoItem
            {
                Id = Guid.NewGuid().ToString(),
                Text = "Build Sample",
                Complete = false,
                Deleted = false,
                UpdatedAt = DateTimeOffset.UtcNow,
                CreatedAt = DateTimeOffset.UtcNow
            },
            new TodoItem
            {
                Id = Guid.NewGuid().ToString(),
                Text = "Create ARM Template",
                Complete = false,
                Deleted = false,
                UpdatedAt = DateTimeOffset.UtcNow,
                CreatedAt = DateTimeOffset.UtcNow
            },
            new TodoItem
            {
                Id = Guid.NewGuid().ToString(),
                Text = "Publish to Azure",
                Complete = false,
                Deleted = false,
                UpdatedAt = DateTimeOffset.UtcNow,
                CreatedAt = DateTimeOffset.UtcNow
            },
            new TodoItem
            {
                Id = Guid.NewGuid().ToString(),
                Text = "Make Money",
                Complete = false,
                Deleted = false,
                UpdatedAt = DateTimeOffset.UtcNow,
                CreatedAt = DateTimeOffset.UtcNow
            }});
        }
    }
}
