using FirebaseAdmin.Messaging;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace FlutterImageAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NotificationController : ControllerBase
    {
        ILogger<NotificationController> _logger;
        public NotificationController(ILogger<NotificationController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public async void Get()
        {
            // The topic name can be optionally prefixed with "/topics/".
            var topic = "test_topic";

            // See documentation on defining a message payload.

            // Construct the message
            var message = new Message()
            {   
                // Base Notification
                Notification = new Notification()
                {
                    Title = "API Notification",
                    Body = "This is a notification from API",
                    
                },
                // Android
                Android = new AndroidConfig()
                {   
                    Notification = new AndroidNotification() {
                        Sound = "dial_up_bad_signal",
                    },
                    Priority = Priority.High,
                },

                // IOS
                Apns = new ApnsConfig()
                {
                    Headers = new Dictionary<string, string>()
                    {
                        { "apns-priority", "5" }
                    },
                    Aps = new Aps()
                    {
                        Sound = "dial_up_bad_signal",
                        ContentAvailable = true,
                    }
                },
                // broadcasted topic
                Topic = topic,
            };

            // Send a message to the devices subscribed to the provided topic.
            string response = await FirebaseMessaging.DefaultInstance.SendAsync(message);

            // Log message ID string.
            _logger.LogInformation("Sucessfully sent message: " + response);
        }

    }
}
