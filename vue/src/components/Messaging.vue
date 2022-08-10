<template>
  <div class="chat-bot">
    <ul>
      <li>
        Hello, good to see you,
        {{ this.$store.state.user.nickname }}! How can I help you?
        <span class="msg_time"><i>insert time here</i></span>
      </li>
      <li v-for="TopicQ in messages" v-bind:key="TopicQ.TopicQ">
        <span class="message" id="user_message" v-if="TopicQ.TopicQ">
          {{ TopicQ.TopicQ }}</span
        >
        <span class="message" id="bot_message" v-if="TopicQ.topicInfo">
          {{ TopicQ.topicInfo }}</span
        >
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

<style scoped>
.chat-bot {
  display: flex;
  flex-direction: column;
}
.text-box {
  display: flex;
  align-items: flex-start;
  position: fixed;
  bottom: 0rem;
  right: 0rem;
  left: 0rem;
  width: auto;

}
.text-box input[type="text"]{
	flex: 1;
}
#user_message {
  border-radius: 20px 20px 5px;
  color: white;
  background-color: green;
  align-content: right;
}

li {
  display: flex;
  list-style: none;
  align-items: stretch;
}

ul {
  align-items: stretch;
}
</style>
