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


        public List<string> BotResponse { get; set; } //lives in topicInfo in DB

        public string InfoLink { get; set; }

        public string ImgLink { get; set; }

        public double SimilarityPercent { get; set; }

       
    }
}
