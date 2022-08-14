using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;



namespace Capstone.DAO
{
    public class TopicSQLDAO : ITopicDAO
    {
       
        private readonly string connectionString;

        private string sqlGetTopic = "select  t.topic_info, t.info_link, t.img_link from topic t where t.topic_id = @topicID;";
        private string storeUserMessage = "INSERT INTO user_message (user_message, topic_id, user_id) VALUES (@userMessage,@topicId,@userId);";
        
        public TopicSQLDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
        public bool SaveUserMessage(UserMessage um)
        {
            using(SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(storeUserMessage, conn);
                cmd.Parameters.AddWithValue("@userMessage", um.UserText);
                cmd.Parameters.AddWithValue("@userId", um.UserID);
                cmd.Parameters.AddWithValue("@topicId", um.TopicID);
               
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
        public List<Topic> GetTopicQList()
        {
            List<Topic> TopicQsToCompare = new List<Topic>();
            string sql = "select topic_id, topic_q from topic";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Topic topic = GetTopicQFromReader(reader);
                    TopicQsToCompare.Add(topic);
                }
                return TopicQsToCompare;
            }
        }
        public BotMessage GetBotMessagebyTopicID(int topicID)
        {
            BotMessage botMessage = new BotMessage();
            
            
            using (SqlConnection conn = new SqlConnection(connectionString))
            {

                conn.Open();

                SqlCommand cmd = new SqlCommand(sqlGetTopic, conn);
                cmd.Parameters.AddWithValue("@topicID", topicID);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows && reader.Read())
                {
                    botMessage = GetBotMessageFromReader(reader);
                }

                return botMessage;
            }
        }
        private BotMessage GetBotMessageFromReader(SqlDataReader reader)
        {
            BotMessage bm = new BotMessage()
            {
                
                BotResponse = Convert.ToString(reader["topic_info"]),
                ImgLink = Convert.ToString(reader["img_link"]),
                InfoLink = Convert.ToString(reader["info_link"])
            };

            return bm;
        }
        private Topic GetTopicQFromReader(SqlDataReader reader)
        {
            Topic topicQandId = new Topic()
            {
                TopicID = Convert.ToInt32(reader["topic_id"]),
                TopicQList = Convert.ToString(reader["topic_q"]).Split("|").ToList<string>()

            };

            return topicQandId;
        }

        
    }
}
