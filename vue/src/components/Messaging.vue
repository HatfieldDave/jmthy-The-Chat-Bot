<template>
  <div class="chat-bot">
    <ul class="messages-area" style="list-style:none">
      <li class="greeting botMsgBox">
        Hello, good to see you,
        {{ this.$store.state.user.nickname }}! How can I help you?
        <span class="msg_time"><i>insert time here</i></span>
      </li>
      <li v-for="TopicQ in messages" v-bind:key="TopicQ.TopicQ" class="allMessages" >
        <div class="userMsgContainer">
          <span class="message userMsgBox" id="user_message" v-if="TopicQ.TopicQ">
          {{ TopicQ.TopicQ }}
          </span>
          <span class="msg_time" v-if="TopicQ.TopicQ"><i>insert time here</i></span>
        </div>
        <div class="botMsgContainer">
          <span class="message botMsgBox" id="bot_message" v-if="TopicQ.topicInfo">
          {{ TopicQ.topicInfo }}
          <a v-bind:href="TopicQ.link" v-show="botMessage.link"> Link </a>
         </span>
       <span class="msg_time" v-if="TopicQ.topicInfo"><i>insert time here</i></span>
        </div>
        
      </li>
    </ul>
    <form class="text-box">
      <input
        type="text"
        name="Chatbox"
        placeholder="Talk to Jimothy"
        filled
        label="Label"
        auto-grow
        v-model="userMessage.TopicQ"
      />
      <input
        type="submit"
        value="Send"
        v-on:click.prevent="(messageSent = true), sendInput()"
      />
    </form>
  </div>
</template>

<script>
import chatService from "../services/ChatService";

export default {
  name: "Messaging",

  data() {
    return {
      userMessage: {
        //ID: 0,
        TopicQ: "",
      },
      botMessage: {
        //ID: 1,
        topicInfo: "",
        link: "",
      },
      messageSent: false,
      messages: [],

    };
  },
  methods: {
    clearUserMessage() {
      this.userMessage = {
        //ID: this.userMessage.ID+=2,
        TopicQ: "",
      };
    },
    clearBotMessage() {
      this.botMessage = {
        //ID: this.botMessage.ID+=2,
        topicInfo: "",
      };
    },
    saveUserMessage() {
      this.$store.commit("ADD_USER_MESSAGE", this.userMessage);
      this.messages.push(this.userMessage);
    },
    saveBotMessage() {
      this.messages.push(this.botMessage);
    },
    sendInput() {
      this.saveUserMessage();
      console.log("sending", this.userMessage);
      chatService.sendInput(this.userMessage).then((response) => {
        if (response.status == 200) {
          this.botMessage = response.data;
          this.saveBotMessage();
        }
        this.clearUserMessage();
        this.clearBotMessage();
      });
    },
  },
};
</script>

<style>
.chat-bot {
 display: flex;
  flex-direction: column;
  flex-grow: 1;
  max-width: 40rem;
  

 
  
}
.greeting {
   display: flex;
  align-items: flex-end;

}
.text-box {
  display: flex;

  align-items: flex-start;
  position: fixed;
  bottom: 0rem;
  right: 0rem;
  left: 0rem;
  width: auto

}
.messages-area {
  flex-direction: column;
  align-items:stretch;
  padding-bottom: 1rem;
  align-content: space-between;

  
  display:flex;
  
  
}

.text-box input[type="text"] {
  flex: 1;
}
#user_message {
  border-radius: 20px 20px 5px;
  color: white;
  background-color: green;
  padding: 1%;
  border-radius: 0.6rem;
   display: flex;
  list-style: none;
  align-items: stretch;

}
#bot_message {
  border-radius: 5px 20px 20px;
  color: white;
  background-color: rgb(0, 40, 218);
  padding: 1%;
  border-radius: 0.6rem;

   display: flex;
  list-style: none;
  align-items: stretch;
}
.userMsgContainer{
  display:flex;
  justify-content: flex-end;
  align-items: flex-end;
}
.botMsgContainer{
  display: flex;
  justify-content: flex-start;
  flex-direction: row;
  align-items: flex-start;
}
.allMessagesLi{
  display: flex;
  flex-direction: row;
  align-self: stretch;
}

</style>
