using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace FlutterImageAPI.Services
{
    public class JwtService
    {
        private readonly string _issuer;
        private readonly string _audience;
        private readonly byte[] _secretKey;

        public JwtService(IConfiguration configuration)
        {
            // Fetch jwt information from configuration
            _secretKey = Encoding.UTF8.GetBytes(configuration["Jwt:Key"]);
            _audience = configuration["Jwt:Audience"];
            _issuer = configuration["Jwt:Issuer"];
        }

        /// <summary>
        /// Generates and returns a JWT Token
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        public string GenerateToken(string username)
        {
            var key = new SymmetricSecurityKey(_secretKey);
            var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var claims = new Claim[]
{
                new Claim(ClaimTypes.Name, username),
};

            var token = new JwtSecurityToken(
                _issuer,
                _audience,
                claims,
                null,
                DateTime.Now.AddSeconds(15),
                credentials
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
