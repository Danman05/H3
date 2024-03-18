using FlutterImageAPI.Models;

namespace FlutterImageAPI.Interfaces
{
    /*
        
        Interface that contains methods for the repository pattern

     */
    public interface IImageRepository
    {
        public ICollection<ImageModel> GetAll();
        public ICollection<ImageModel> GetLimitedAmount(int amount);
        public void Add(ImageModel image);

        public void Delete();

    }
}
