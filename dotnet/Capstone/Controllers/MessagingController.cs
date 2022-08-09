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
        public IActionResult GetTopic(Topic topicQ)
        {

            Topic topic = topicDAO.GetTopic(topicQ);
            if (topicQ != null)
            {
                return Ok(topic);
            }
            else
            {
                return NotFound(topic + "I don't think we teach that here.");
            }
        }
    }
}
