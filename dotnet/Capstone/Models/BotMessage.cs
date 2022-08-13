using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class BotMessage
    { 
        public BotMessage()
        {

        }

        public string UserText { get; set; } // lives in user_message table in DB (still need sql query to insert into)

        public string BotResponse { get; set; } //lives in topicInfo in DB

        public string Link { get; set; }

        public double SimilarityPercent { get; set; }

       
    }
}
