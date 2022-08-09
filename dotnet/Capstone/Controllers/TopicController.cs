using Microsoft.AspNetCore.Mvc;
using Capstone.DAO;
using Capstone.Models;
using Capstone.Security;
using Microsoft.AspNetCore.Authorization;

namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class TopicController : Controller
    {
        private readonly ITopicDAO topicDAO;
        public TopicController(ITopicDAO _topicDAO)
        {
            topicDAO = _topicDAO;
        }
        [HttpGet]
        public IActionResult GetTopic(string topicQ)
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
