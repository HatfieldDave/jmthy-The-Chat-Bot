using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Bot
    {
        public Bot()
        {

        }
        public Bot(int keywordId, string keywords, string reponses)
        {
            this.KeywordID = keywordId;
            this.Keywords = keywords;
            this.Responses = reponses;
        }

        public int KeywordID { get; set; }
        public string Keywords { get; set; }
        public string Responses { get; set; }

        public List<Bot> BotResponses { get; set; } = new List<Bot>();
        public List<Bot> ReturnBotList()
        {
            Bot newBot = new Bot(1, "hello", "hi");
            Bot helpBot = new Bot(2, "help", "How can I Help you");

            
            BotResponses.Add(newBot);
            BotResponses.Add(helpBot);

            return BotResponses;
        }
        /// <summary>
        /// Takes in userword string and checks against existing known keywords to bot and returns correct response.
        /// </summary>
        /// <param name="babyBot"></param>
        /// <returns></returns>
        public string ReturnBotResponse(Bot babyBot)
        {
            string lowerUserWord = babyBot.Keywords.ToLower();
            List<Bot> botList = ReturnBotList();
            string botResponse= "I'm sorry I'm still learning how to help with that";
            foreach(Bot bot in botList)
            {
                if (bot.Keywords.Contains(lowerUserWord))
                {
                    botResponse = bot.Responses;
                } 
            }
            return botResponse;
        }
      
    }
}
