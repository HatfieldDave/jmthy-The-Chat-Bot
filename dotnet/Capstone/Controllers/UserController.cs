using Microsoft.AspNetCore.Mvc;
using Capstone.DAO;
using Capstone.Models;
using Capstone.Security;
using Microsoft.AspNetCore.Authorization;

namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class UserController : Controller
    {
        private readonly IUserDAO userDAO;
        public UserController(IUserDAO _userDAO)
        {
            userDAO = _userDAO;
        }
        [HttpGet]
        public IActionResult GetUser()
        {
            string username = User.Identity.Name;
            User user = userDAO.GetUser(username);
            if (user != null)
            {
                return Ok(user);
            }
            else
            {
                return NotFound(username + "? Never heard of her.");
            }
        }
    }
}
