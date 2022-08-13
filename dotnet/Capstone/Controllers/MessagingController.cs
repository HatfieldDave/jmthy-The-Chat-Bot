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
        public List<string> BuzzWords = new List<string>
        {

            "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "$", "A", "about", "after", "all", "also", "an", "and", "another", "any", "aol", "are", "as", "at", "B", "be", "because", "been", "before", "being",
            "between", "both", "but", "by", "C", "ca", "came", "can", "co", "com", "come", "could", "D", "did", "do", "does", "E", "each", "edu", "else", "F", "for", "from", "G", "get", "gmail", "got", "H",
            "had", "has", "have", "he", "her", "here", "him", "himself", "his", "hotmail", "how", "I", "if", "in", "into", "is", "it", "its", "J", "just", "K", "L", "like", "live", "M", "make", "many", "me", "might",
            "more", "most", "msn", "much", "must", "my", "N", "net", "never", "no", "noemail", "now", "O", "of", "on", "only", "or", "org", "other", "our", "out", "over", "P", "Q", "R", "re", "S", "said", "same", "see",
            "should", "since", "so", "some", "still", "such", "T", "take", "than", "that", "the", "their", "them", "then", "there", "these", "they", "this", "those", "through", "to", "too", "U", "uk",
            "under", "up", "use", "V", "vdonotrepl", "very", "W", "want", "was", "way", "we", "well", "were", "what", "when", "where", "which", "while", "who", "will", "with", "would", "X", "Y", "ymail", "you", "your", "Z",
            "i", "need", "can", "you"
        };


        private string FilterBuzzWords(string userText)
        {

            string fiteredUserText = "";
            foreach (string buzz in BuzzWords)
            {
                if (userText.Contains(buzz))
                {
                    fiteredUserText += userText.Split(buzz);
                }
            }
            return fiteredUserText;
        }



        public MessagingController(ITopicDAO _topicDAO)
        {
            topicDAO = _topicDAO;

        }
        //need to be able to call full topic list with DAO one time inorder to pass it in for String LogicClass
        [HttpPost]
        public IActionResult GetTopic(UserMessage userMessage)
        {
            List<Topic> FullTopicList = topicDAO.GetTopicQList();
            string userText = FilterBuzzWords(userMessage.UserText);
            StringLogic sl = new StringLogic(FullTopicList, userText);
            sl.CalculateTopicThresholds(userMessage.UserText);


            int topicIdOfHighestThreshold = sl.CalculateTopicIdOfHighestThreshold();

            BotMessage botMessage = topicDAO.GetBotMessagebyTopicID(topicIdOfHighestThreshold);
            botMessage.UserText = userMessage.UserText;

            if (userMessage != null)
            {
                return Ok(botMessage);
            }
            else
            {
                return NotFound("I don't think we teach that here.");
            }
        }
    }
}
       

       