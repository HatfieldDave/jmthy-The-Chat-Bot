﻿using System;
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

        //public string UserText { get; set; }

        public string BotResponse { get; set; } 

        public string InfoLink { get; set; }

        public string ImgLink { get; set; }

        public double SimilarityPercent { get; set; }

       
    }
}
