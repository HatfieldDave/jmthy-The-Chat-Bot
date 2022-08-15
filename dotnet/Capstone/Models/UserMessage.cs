using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class UserMessage //all lives in user_message table in DB
    {
        public int UserMessageID { get; set; }
        public string UserText { get; set; }
        public int TopicID { get; set; }
        public int UserID { get; set; } 

        public string MsgTime { get; set; }

        //needs to have the method that takes a user text- determines 
    }
}
