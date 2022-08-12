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
        

        public MessagingController(ITopicDAO _topicDAO)
        {
            topicDAO = _topicDAO;
           
        }
        //need to be able to call full topic list with DAO one time inorder to pass it in for String LogicClass
        [HttpPost]
        public IActionResult GetTopic(UserMessage userMessage)
        {
            List<Topic> FullTopicList = topicDAO.GetTopicQList();

            StringLogic sl = new StringLogic(FullTopicList, userMessage.UserText);
            sl.CalculateTopicThresholds(userMessage.UserText);
            

            int topicIdOfHighestThreshold = sl.CalculateTopicIdOfHighestThreshold();

            BotMessage botMessage = topicDAO.GetBotMessagebyTopicID(topicIdOfHighestThreshold);
           
            
            if (userMessage != null)
            {
                return Ok(botMessage);
            }
            else
            {
                return NotFound(botMessage + "I don't think we teach that here.");
            }
        }
        private void GetFullTopicList()
        {
            
        }
    }
}
