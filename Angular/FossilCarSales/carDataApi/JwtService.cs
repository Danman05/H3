using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
namespace carDataApi
{
  public class JwtService
  {
    // Empty fields, assigned in constructor
    private byte[] _JwtKey;
    public JwtService(IConfiguration configuration)
    {
      // Get configuration values
      _JwtKey = Encoding.UTF8.GetBytes(configuration["JwtSettings:Key"]);
    }


    public string GenerateJSONWebToken(string user)
    {
      // Claims
      List<Claim> claims = new List<Claim>()
            {
                new Claim(ClaimTypes.Name, user),
                
                /*  Custom claim
                 *  userId, helps keep track for vault context
                 *  
                */
                new Claim("userId", user)
            };
      var securityKey = new SymmetricSecurityKey(_JwtKey);
      var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

      var token = new JwtSecurityToken(
        issuer: null,
        audience: null,
        claims,
        expires: DateTime.Now.AddMinutes(30),
        signingCredentials: credentials);

      return new JwtSecurityTokenHandler().WriteToken(token);
    }
  }
}
