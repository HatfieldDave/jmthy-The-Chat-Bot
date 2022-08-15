using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;
using Capstone.DAO;

namespace Capstone.Controllers
{
    [Route("/messaging")]
    [ApiController]
    public class MessagingController : ControllerBase
    {
        private readonly ITopicDAO topicDAO;
        //public List<string> BuzzWords = new List<string>
        //{

        //    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "$", "about", "after", "all", "also", "an", "and", "another", "any", "aol", "are", "as", "at", "be", "because", "been", "before", "being",
        //    "between", "both", "but", "by", "ca", "came", "can", "co", "com", "come", "could", "did", "do", "does", "each", "edu", "else", "for", "from", "get", "gmail", "got",
        //    "had", "has", "have", "he", "her", "here", "him", "himself", "his", "hotmail", "how", "if", "in", "into", "is", "it", "its", "just", "like", "live", "make", "many", "me", "might",
        //    "more", "most", "msn", "much", "must", "my", "never", "no", "noemail", "now", "of", "on", "only", "or", "org", "other", "our", "out", "over","re", "said", "same", "see",
        //    "should", "since", "so", "some", "still", "such","take", "than", "that", "the", "their", "them", "then", "there", "these", "they", "this", "those", "through", "to", "too", "uk",
        //    "under", "up", "use", "vdonotrepl", "very", "want", "was", "way", "we", "well", "were", "what", "when", "where", "which", "while", "who", "will", "with", "would", "ymail", "you", "your",
        //    "need", "can", "you"
        //};

       
        //private string FilterBuzzWords(string userText)
        //{

        //    string fiteredUserText = "";
        //    foreach (string buzz in BuzzWords)
        //    {
        //        if (userText.Contains(buzz))
        //        {
        //           fiteredUserText+= userText.Replace(buzz, "");
        //            //fiteredUserText += userText.Split(buzz);
        //        }
        //    }
        //    if(fiteredUserText != "")
        //    {
        //        return fiteredUserText;
        //    }
        //    return userText;
        //}



        public MessagingController(ITopicDAO _topicDAO)
        {
            topicDAO = _topicDAO;

        }
        //need to be able to call full topic list with DAO one time inorder to pass it in for String LogicClass
        [HttpPost]
        public IActionResult GetTopic(UserMessage userMessage)
        {
            //Gets full list of topics to loop through in string comparison
            List<Topic> FullTopicList = topicDAO.GetTopicQList();
           
           // Creates new instance of Stringlogic class where string comparison happens
            StringLogic sl = new StringLogic(FullTopicList, userMessage.UserText);
            //this lethod loops through each topicQ in full topic list and compares it against the user's message
            // saves the percentage of similarity between them as a property of each topic
            sl.CalculateTopicThresholds(userMessage.UserText);
            // this method then loops through them all again to find the topic id that has the highest threshold
            int topicIdOfHighestThreshold = sl.CalculateTopicIdOfHighestThreshold();
            // this then gets the matching bot response with that id from database and saves it into the Botmessage object
            BotMessage botMessage = topicDAO.GetBotMessagebyTopicID(topicIdOfHighestThreshold);
            // this saves the topic id (found and saved 2 lines above in topicOfHighestThreshold) to an object of the userMessage class
            // do this so that we can save this UserMessage object into the Database
            userMessage.TopicID = topicIdOfHighestThreshold;
            // this saves the userMessage object into the user_message table in the database
            bool didSheSave = topicDAO.SaveUserMessage(userMessage);

            if (userText != null)
            {
                if (botMessage == null)
                {

                    botMessage.BotResponse = "Did you fall asleep on the KeyBoard? I need a little help understanding you.";
                   
                }
                return Ok(botMessage);
            }
            else
            {

                return NotFound("I don't think we teach that here.");
            }

        }
    }
}
       

       