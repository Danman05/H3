﻿using FlutterImageAPI.Models;

namespace FlutterImageAPI.Data
{
    public class ImageData
    {
        // Thread safe singleton

        private static readonly object obj = new object ();
        private static ImageData? instance = null;


        public static List<ImageModel> Images = new List<ImageModel>()
        {
                new ImageModel {Base64 = "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"}
        };
        public static ImageData Instance
        {
            get
            {
                // locks obj to make it thread safe
                lock (obj)
                    {
                        if (instance == null)
                        {
                            instance = new ImageData();
                        }
                        return instance;
                    }
            }
        }
        public int ImageLength => Images.Count;
    }
}
