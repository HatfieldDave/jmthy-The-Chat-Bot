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
       
      
    }
}
