using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using F23.StringSimilarity;

namespace Capstone.Models
{
    public class Topic
    {
        private Levenshtein Vlad = new Levenshtein();
        public int TopicID { get; set; }
        public List<string> TopicQList { get; set; } 
        public double Threshold { get; set; }

        public void CalculateThreshold(string userText)
        {
            foreach(string q in TopicQList)
            {
                double distance = Vlad.Distance(userText, q);
                double totalChar = userText.Length + q.Length;
                Threshold += (1 - (distance / totalChar));
            }
        }
    }
}
