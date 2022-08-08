using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Bot
    {
        public Bot(int keywordId, string keywords, string reponses)
        {
            this.KeywordID = keywordId;
            this.Keywords = keywords;
            this.Responses = reponses;
        }

        public int KeywordID { get; set; }
        public string Keywords { get; set; }
        public string Responses { get; set; }

        public List<Bot> ReturnBotList()
        {
            Bot newBot = new Bot(1, "hello", "hi");
            Bot helpBot = new Bot(2, "help", "HOw can I Help you");

            List<Bot> botResponses = new List<Bot>();
            botResponses.Add(newBot);
            botResponses.Add(helpBot);

            return botResponses;

        }
    }
}
