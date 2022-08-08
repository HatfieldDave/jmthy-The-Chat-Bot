using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;

namespace Capstone.Controllers
{
    [Route("/messaging")]
    [ApiController]
    public class MessagingController : ControllerBase
    {
        Bot botRoast = new Bot();
        List<Bot> botList;
        public MessagingController()
        {
            botList = botRoast.ReturnBotList();
        }

        [HttpPost]
        public ActionResult CatchAndSend(Bot bot)
        {
            string botResponse = botRoast.ReturnBotResponse(bot);
            return Ok(botResponse);
        }
        
         
      
   
        
    }
}
