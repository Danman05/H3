using carDataApi.Models;
using Newtonsoft.Json;

namespace carDataApi.dataRepository
{
  public class CarDataRepository
  {
     private readonly string constJsonFilePath = "./data/constCarData.json";
    private readonly string jsonFilePath = "./data/carData.json";

    /// <summary>
    /// Converts JSON contents to type
    /// </summary>
    /// <returns>List of type car</returns>
    public IEnumerable<Car>? JsonGet()
    {
      using (StreamReader r = new StreamReader(jsonFilePath))
      {
        string content = r.ReadToEnd();
        return string.IsNullOrEmpty(content) ? [] : JsonConvert.DeserializeObject<List<Car>>(content);
      }
    }

    /// <summary>
    /// Converts List of car to JSON string, writes to file
    /// </summary>
    /// <param name="cars"></param>
    /// <returns>Status code</returns>
    /// <exception cref="Exception">Returns code 500 - internal server error</exception>
    public int JsonSet(List<Car> cars)
    {
      try
      {
        string content = JsonConvert.SerializeObject(cars);
        File.WriteAllText(jsonFilePath, content);
        return 200;
      }
      catch (Exception) { return 500; }
    }

    /// <summary>
    /// Removes item from JSON
    /// </summary>
    /// <param name="car"></param>
    /// <returns>Status code</returns>
    public int JsonRemove(int id)
    {
      List<Car> cars = JsonGet().ToList();
      Car? carToBeRemoved = cars.FirstOrDefault(x => x.Rank == id);
      cars.Remove(carToBeRemoved);
      return JsonSet(cars);
    }

    /// <summary>
    /// edits an item
    /// </summary>
    /// <param name="car"></param>
    /// <returns>Status code</returns>
    public int JsonEdit(Car car)
    {
      List<Car> cars = JsonGet().ToList();
      Car? carToBeChanged = cars.FirstOrDefault(x => x.Rank == car.Rank);
      cars.Remove(carToBeChanged);
      cars.Add(car);
      return JsonSet(cars);
    }

    public void JsonReset()
    {
      string jsonContent = File.ReadAllText(constJsonFilePath);

      File.WriteAllText(jsonFilePath, jsonContent);
    }
  }
}
