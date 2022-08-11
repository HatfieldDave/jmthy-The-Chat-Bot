using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;

namespace Capstone.BotStuff
{
    public class NLP
    {

        ///Calculate the percentage of similarity between 2 strings using the Levenshtein distance
        public double Calculate(string string1, string string2)
        {
            int string1Length = string1.Length;
            int string2Length = string2.Length;

            var matrix = new double[string1Length + 1, string2Length + 1];

            // if input is empty returns length
            if (string1Length == 0)
            {
                return string2Length;
            }


            if (string2Length == 0)
            {
                return string1Length;
            }


            // Initialization of matrix with row size source1Length and columns size source2Length
            for (int i = 0; i <= string1Length; matrix[i, 0] = i++)
            {

            }
            for (int j = 0; j <= string2Length; matrix[0, j] = j++)
            {

            }

            // Calculate rows and collumns distances
            for (int i = 1; i <= string1Length; i++)
            {
                for (int j = 1; j <= string2Length; j++)
                {
                    double cost = (string2[j - 1] == string1[i - 1]) ? 0 : 1;

                    matrix[i, j] = Math.Min(
                        Math.Min(matrix[i - 1, j] + 1, matrix[i, j - 1] + 1),
                        matrix[i - 1, j - 1] + cost);
                }
            }


            return matrix[string1Length, string2Length];
        }
        public string BotLanguageDetection(Topic topic)
        {
            //replace me with topic.Threshold when it gets added
            double threshold = .83;
            NLP levenshtein_Distance = new NLP();
            //REPLACE ME WHEN I"M AVALIBLE
            string userInput = "pathway";
            List<string> TopicQ = SplitArrayTopicQ(topic.TopicQ);
            double highestThreshold = 0;
            List<Threshold> thresholds = new List<Threshold>();
            //Calculates perc for similarity in each topicQ
            foreach (string topicQ in TopicQ)
            {
                double distance = levenshtein_Distance.Calculate(userInput, topicQ);
                double totalChar = userInput.Length + topic.TopicQ.Length;
                double perc = distance / totalChar;
                //add the perc to a list along with the topic id as a Threshold object
                if (perc >= threshold)
                {
                    perc = highestThreshold;
                    Threshold newThreshold = new Threshold();
                    newThreshold.ThresholdNum = perc;
                    newThreshold.id = topic.TopicId;
                    thresholds.Add(newThreshold);
                }
                
            }
            //gets the highest percentage
            foreach (Threshold num in thresholds)
            {
                if (num.ThresholdNum > threshold)
                {
                    threshold = num.ThresholdNum;
                }
              
            }
            //does something when it matches 
            foreach (Threshold num in thresholds)
            {
                if (num.ThresholdNum == threshold)
                {
                    // maybe call topic by id?
                }  
            }





        }
        public List<string> SplitArrayTopicQ(string stringToSplit)
        {
            return stringToSplit.Split("|").ToList<string>();

        }



    }
}
