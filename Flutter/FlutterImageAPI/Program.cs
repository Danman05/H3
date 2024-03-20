
using FirebaseAdmin;
using FlutterImageAPI.Interfaces;
using FlutterImageAPI.Repositories;
using FlutterImageAPI.Services;
using Google.Apis.Auth.OAuth2;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Collections.Generic;
using System.Text;

namespace FlutterImageAPI
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            string jwtKey = builder.Configuration.GetSection("Jwt:Key").Get<string>();
            string jwtIssuer = builder.Configuration.GetSection("Jwt:Issuer").Get<string>();
            string jwtAudience = builder.Configuration.GetSection("Jwt:Audience").Get<string>();


            FirebaseApp.Create(new AppOptions()
            {
                Credential = GoogleCredential.FromFile("D:\\Coding\\H3\\H3\\Flutter\\FlutterImageAPI\\my-first-firebase-e4fc9-firebase-adminsdk-cfum7-a2b563b97b.json"),
                ProjectId = "my-first-firebase-e4fc9",
            });

            // Add services to the container.

            builder.Services.AddControllers();
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();


            // Dependency injection
            builder.Services.AddSingleton<ImageRepository>();
            builder.Services.AddTransient<JwtService>();


            builder.Services.AddAuthentication(x =>
            {
                x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = jwtIssuer,
                    ValidAudience = jwtAudience,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtKey)),
                    ClockSkew = TimeSpan.Zero // remove clockskew, mostly for testing purposes.
                                              // If JWT token is set to expire in 1 minute,
                                              // Then it will not expire because ClockSkew has a defualt value of 5 minutes
                };
            });

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseAuthorization();


            app.MapControllers();

            app.Run();
        }
    }
}
