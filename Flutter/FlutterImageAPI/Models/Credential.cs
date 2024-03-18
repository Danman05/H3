namespace FlutterImageAPI.Models
{
    public class Credential
    {
        // Properties
        public string Username { get; set; }
        public string PrivateKey { get; set; }

        // Constructor
        public Credential(string username, string privateKey)
        {
            Username = username;
            PrivateKey = privateKey;
        }
    }
}
