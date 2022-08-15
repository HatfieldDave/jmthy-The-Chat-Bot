using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using F23.StringSimilarity;

namespace Capstone.Models
{
    public class StringLogic
    {
        public List<Topic> FullTopicList;
        
        public StringLogic(List<Topic> fullTopicList, string userText)
        {
            this.FullTopicList = fullTopicList;
            this.UserText = userText;
        }
        public StringLogic()
        {

        }
        public int TopicId { get; set; }
        public double HighestThreshold { get; set; } = 0.75;
        public string UserText { get; set; }

        /// <summary>
        /// Lopps over a list of TopicQs in the database and sets t
        /// </summary>
        /// <param name="userText"></param>
        public void CalculateTopicThresholds(string userText)
        {
           foreach(Topic t in FullTopicList)
            {
                t.CalculateThreshold(userText);
            }
            
        }
        public int CalculateTopicIdOfHighestThreshold()
        {
            foreach(Topic t in FullTopicList)
            {
                if(t.Threshold > HighestThreshold)
                {
                    HighestThreshold = t.Threshold;
                    TopicId = t.TopicID;
                }
            }
            //catch any messages that don't meet minimum threshold value and returns catchall topic ID in DB
            if(TopicId > 0)
            {
                return TopicId;
            }
            else
            {
                return 1;
            }
        }


    }
}
