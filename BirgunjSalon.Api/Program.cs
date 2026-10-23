var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/api/salons", () =>
{
    var salons = new[]
    {
        new
        {
            Id = 1,
            Name = "Birgunj Classic Salon",
            Location = "Adarsh Nagar, Birgunj",
            Price = 300
        },
        new
        {
            Id = 2,
            Name = "Gentlemen's Barber Shop",
            Location = "Main Road, Birgunj",
            Price = 250
        }
    };

    return Results.Ok(salons);
});

app.Run();



