using FlutterImageAPI.Data;
using FlutterImageAPI.Models;
using FlutterImageAPI.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace FlutterImageAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ImageController : ControllerBase
    {

        private readonly ImageRepository _imageRepository;
        private readonly ILogger<ImageController> _logger;

        public ImageController(ILogger<ImageController> logger, ImageRepository imageRepo)
        {
            _logger = logger;
            _imageRepository = imageRepo;
        }

        [HttpGet]
        [Route("All")]
        public IActionResult AllImages()
        {
            try
            {
                _logger.LogInformation("Requested All Images");
                return Ok(_imageRepository.GetAll());
            }
            catch (Exception ex)
            {
                _logger.LogError($"Exception has occoured, AllImages {ex.Message}");
                return StatusCode(500, "An Error occoured ;( \nView error message on server");
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="amount">Has default value, can be changed if more images are desired</param>
        /// <returns></returns>
        [HttpGet]
        [Route("Limited")]
        public IActionResult LimitedImages(int amount = 3)
        {
            try
            {
                _logger.LogInformation("Requested Limited Images");
                ICollection<ImageModel> data = _imageRepository.GetLimitedAmount(amount);
                if (data == null)
                {
                    return BadRequest("Not enough photos taken to return random images");
                }
                return Ok(data);
            }
            catch (Exception ex)
            {
                _logger.LogError($"Exception has occoured, LimitedImages {ex.Message}");
                return StatusCode(500, "An Error occoured ;( \nView error message on server");
            }
        }

        [HttpPost]
        [Route("Add")]
        [Authorize]
        public IActionResult AddImage([FromBody] ImageModel image)
        {
            try
            {
                _logger.LogInformation("Added Image");
                _imageRepository.Add(image);
                return Ok("Image added");
            }
            catch (Exception ex)
            {
                _logger.LogError($"Exception has occoured, AddImage {ex.Message}");

                return StatusCode(500, "An Error occoured ;( \nView error message on server");
            }
        }
    }
}
