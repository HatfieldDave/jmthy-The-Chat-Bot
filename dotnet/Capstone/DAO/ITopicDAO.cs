﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;

namespace Capstone.DAO
{
   public interface ITopicDAO
    {
        List<Topic> GetTopicQList();
        BotMessage GetBotMessagebyTopicID(int topicID);
        bool SaveUserMessage(UserMessage um);



    }
}
