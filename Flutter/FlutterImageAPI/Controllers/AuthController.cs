using FlutterImageAPI.Models;
using FlutterImageAPI.Services;


using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
namespace FlutterImageAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {

        JwtService _jwtService;
        public AuthController(JwtService jwtService)
        {
            _jwtService = jwtService;
        }
        [AllowAnonymous]
        [HttpPost]
        public IActionResult Login(Credential credential)
        {
            try
            {
                if (string.IsNullOrEmpty(credential.Username) || string.IsNullOrEmpty(credential.PrivateKey))
                    return BadRequest("Username or password is not"); // Status code 400 - bad request

                bool loginResult = credential.Username == "user" &&
                                   credential.PrivateKey == "SecurePa$$";

                if (!loginResult) { return Unauthorized("Unauthorized"); } // Status code 401 - Unauthorized

                // Generate JWT Token and return token
                string token = _jwtService.GenerateToken(credential.Username);
                return Ok(token); // Status code 200 - OK
            }
            catch (Exception)
            {
                return BadRequest("Failed login - try again");
            }
        }
    }
}
