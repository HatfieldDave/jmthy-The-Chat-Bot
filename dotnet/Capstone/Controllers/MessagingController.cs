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
        [HttpPost]
        public IActionResult GetTopic(Topic userMessage)
        {

            Topic botMessage = topicDAO.GetBotMessage(userMessage);
            if (userMessage != null)
            {
                return Ok(botMessage);
            }
            else
            {
                return NotFound(botMessage + "I don't think we teach that here.");
            }
        }
    }
}
