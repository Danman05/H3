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

  [HttpPost]
  public IActionResult CarAdd(Car car)
  {
    List<Car> cars = _carData.JsonGet().ToList();
    cars.Add(car);
    int statusCode = _carData.JsonSet(cars);
    return StatusCode(statusCode);
  }

  [HttpDelete]
  public IActionResult CarRemove(Car car)
  {
    int statusCode = _carData.JsonRemove(car);
    if (statusCode >= 200 && statusCode < 300)
    {
      return Ok();
    }
    return StatusCode(statusCode);
  }

  [HttpPut]
  public IActionResult CarEdit(Car car)
  {
    int statusCode = _carData.JsonEdit(car);
    if (statusCode >= 200 && statusCode < 300)
    {
      return Ok();
    }
    return StatusCode(statusCode);
  }

}
