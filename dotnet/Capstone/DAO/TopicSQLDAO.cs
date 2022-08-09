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

        private string sqlGetTopic = "select t.topic_info from topic t where t.topic_q = @topicQ";

        public TopicSQLDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public Topic GetTopic(string topicQ)
        {
            Topic returnTopic = null;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {

                conn.Open();

                SqlCommand cmd = new SqlCommand(sqlGetTopic, conn);
                cmd.Parameters.AddWithValue("@topicQ", topicQ);
                SqlDataReader reader = cmd.ExecuteReader();
               
                if (reader.HasRows && reader.Read())
                {
                    returnTopic = GetTopicFromReader(reader);
                }

                return returnTopic;
            }
        }
        private Topic GetTopicFromReader(SqlDataReader reader)
        { 
            Topic t = new Topic()
                {

                    TopicQ = Convert.ToString(reader["topicQ"])
                };

                return t;
        }   
    }
}
