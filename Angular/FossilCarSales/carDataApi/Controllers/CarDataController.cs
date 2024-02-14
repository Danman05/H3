using Microsoft.AspNetCore.Mvc;
using carDataApi.Models;
using carDataApi.dataRepository;

namespace carDataApi.Controllers;

[ApiController]
[Route("Car")]
public class CarDataController : ControllerBase
{
  readonly CarDataRepository _carData = new CarDataRepository();

  private readonly ILogger<CarDataController> _logger;

  public CarDataController(ILogger<CarDataController> logger)
  {
    _logger = logger;
  }

  [HttpGet]
  public IEnumerable<Car>? CarGet()
  {
    return _carData.JsonGet();
  }

  /// <summary>
  /// Factory resets cars in JSON file
  /// </summary>
  /// <returns></returns>
  [HttpGet]
  [Route("Reset")]
  public IActionResult CarReset()
  {
    _carData.JsonReset();
    _logger.LogInformation("JSON data has been rollbacked");
    return Ok();
  }


  /// <summary>
  /// Adds a new car entry to the JSON file
  /// </summary>
  /// <param name="car"></param>
  /// <returns></returns>
  [HttpPost]
  public IActionResult CarAdd(Car car)
  {
    List<Car> cars = _carData.JsonGet().ToList();
    cars.Add(car);
    int statusCode = _carData.JsonSet(cars);
    if (statusCode >= 200 && statusCode < 300)
    {
      _logger.LogInformation("Data has been added to JSON");
      return Created();
    }
    return StatusCode(statusCode);
  }

/// <summary>
/// Delete a car from JSON file
/// </summary>
/// <param name="id"></param>
/// <returns></returns>
  [HttpDelete("{id}")]
  public IActionResult CarRemove(int id)
  {
    int statusCode = _carData.JsonRemove(id);
    if (statusCode >= 200 && statusCode < 300)
    {
            _logger.LogInformation("Data has been removed from JSON");
      return Ok();
    }
    return StatusCode(statusCode);
  }

  /// <summary>
  /// Edit car data, currently not working :)
  /// </summary>
  /// <param name="car"></param>
  /// <returns></returns>
  [HttpPut]
  public IActionResult CarEdit(Car car)
  {
    int statusCode = _carData.JsonEdit(car);
    if (statusCode >= 200 && statusCode < 300)
    {
                  _logger.LogInformation("Data has been removed from JSON");
      return Ok();
    }
    return StatusCode(statusCode);
  }

}
