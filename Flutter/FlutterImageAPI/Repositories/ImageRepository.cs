using FlutterImageAPI.Data;
using FlutterImageAPI.Interfaces;
using FlutterImageAPI.Models;
using System.Security.Cryptography;

namespace FlutterImageAPI.Repositories
{
    public class ImageRepository : IImageRepository
    {

        public void Add(ImageModel image)
        {
            try
            {
                ImageData.Images.Add(image);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void Delete()
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Get all images
        /// </summary>
        /// <returns>Image List</returns>
        public ICollection<ImageModel> GetAll()
        {
            return ImageData.Images;
        }

        /// <summary>
        /// Get a specific amount of images, method uses RandomNumberGenerator to securely get true random numbers
        /// </summary>
        /// <param name="amount">Amount of random images</param>
        /// <returns></returns>
        public ICollection<ImageModel> GetLimitedAmount(int amount)
        {
            // Copy image list, safely remove data when selecting random items
            List<ImageModel> copiedList = new List<ImageModel>(ImageData.Images);

            // List containing random images
            List<ImageModel> randomImages = new List<ImageModel>(amount);

            // Randomly select a index from the image list
            // Add image to a new list containing selected images
            // Delete selected image from the copied list
            if (amount > copiedList.Count) { return null; }
            for (int i = 0; i < amount; i++)
            {
                int randomIndex = RandomNumberGenerator.GetInt32(copiedList.Count);
                randomImages.Add(copiedList[randomIndex]);
                copiedList.RemoveAt(randomIndex);
            }
            return randomImages;
        }
    }
}
