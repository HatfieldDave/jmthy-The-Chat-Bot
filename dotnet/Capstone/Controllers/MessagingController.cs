using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;

namespace Capstone.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MessagingController : ControllerBase
    {
        Bot botRoast = new Bot();

      
   
        Bot newBot = new Bot(1, "hello", "hi");
        Bot helpBot = new Bot(2, "help", "How can I Help you");

        List<Bot> botResponses = new List<Bot>();
        botResponses.Add(newBot);
        botResponses.Add(helpBot);
    }
}
