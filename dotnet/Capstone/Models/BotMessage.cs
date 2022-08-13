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

<<<<<<< HEAD
        public string UserText { get; set; } // lives in user_message table in DB (still need sql query to insert into)
=======
        //public string UserText { get; set; }
>>>>>>> dc4c6ffa12c01691eeed00938ccf8336eb16fcf9

        public string BotResponse { get; set; } //lives in topicInfo in DB

        public string InfoLink { get; set; }

        public string ImgLink { get; set; }

        public double SimilarityPercent { get; set; }

       
    }
}
