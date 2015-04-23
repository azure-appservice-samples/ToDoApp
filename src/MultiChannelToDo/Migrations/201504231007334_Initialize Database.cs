namespace MultiChannelToDo.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitializeDatabase : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "mobile_service_name.TodoItems",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        Text = c.String(),
                        Complete = c.Boolean(nullable: false),
                        CreatedAt = c.DateTimeOffset(precision: 7),
                        UpdatedAt = c.DateTimeOffset(precision: 7),
                        Deleted = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropTable("mobile_service_name.TodoItems");
        }
    }
}
