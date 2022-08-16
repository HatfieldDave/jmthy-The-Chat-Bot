<template>
  <div class="chat-bot">
    <ul class="messages-area" style="list-style: none" ref="messagesContainer">
      <div class="greetingMsgContainer">
        <li id="greeting_message">
          Hello, good to see you, {{ this.$store.state.user.nickname }}! How can
          I help you?
        </li>
        <span class="msg_time"
          ><i>{{ getTime() }}</i></span
        >
      </div>

      <li
        v-for="message in messages"
        v-bind:key="message.botResponse"
        class="allMessages"
      >
        <div class="userMsgContainer" v-show="message.userText">
          <span class="msg_time" 
            ><i>{{ message.msgTime }}</i></span
          >

          <span
            class="message userMsgBox"
            id="user_message"
            v-if="message.userText"
          >
            {{ message.userText }}
          </span>
        </div>
       
        <div class="botMsgContainer" v-show="message.botResponse"  v-for="(string, index) in message.botResponse"
          v-bind:key="index">
       
        <div class="message botMsgBox" id="bot_message">
          <span v-if="string">
            {{ string }}
          </span>
        </div>
        <span class="msg_time"><i>{{ message.msgTime }}</i></span>
        

        <div class="linkContainer" v-show="index == (message.botResponse.length-1)">
          <span id="link_message" v-if="message.infoLink">
            <a>
              For more information Click Here,
              <a
                :href="message.infoLink"
                target="_blank"
                v-show="message.infoLink"
              >
                Link
              </a>
            </a>
          </span>

          <span class="msg_time" v-if="message.infoLink"
            ><i>{{ message.msgTime }}</i></span
          >
        </div>

        <div class="imgContainer">
          <span id="image_message" v-if="message.imgLink">
            <img
              v-bind:src="message.imgLink"
              v-show="message.imgLink"
              max-width="40%"
            />
          </span>

          <span class="msg_time" v-if="message.imgLink"
            ><i>{{ message.msgTime }}</i></span
          >
        </div>
        </div>

      </li>
    </ul>
    <form class="text-box">
      <input
        type="text"
        name="Chatbox"
        placeholder="Talk to JMTHY"
        filled
        label="Label"
        auto-grow
        v-model="userMessage.userText"
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
        userText: "",
        userId: 0,
        msgTime: "",
      },
      botMessage: {
        //ID: 1,
        botResponse: "",
        infoLink: "",
        imgLink: "",
        msgTime: "",
      },

      messageSent: false,
      messages: [],
    };
  },
  methods: {
    getTime() {
      this.time;
      let current = new Date();
      let minutes = current.getMinutes();
      let time = current.getHours() + ":" + minutes;
      if (String(minutes).length === 1) {
        minutes = String(0 + minutes);
      }
      return time;
    },
    clearUserMessage() {
      this.userMessage = {
        //ID: this.userMessage.ID+=2,
        userText: "",
      };
    },
    clearBotMessage() {
      this.botMessage = {
        //ID: this.botMessage.ID+=2,
        botResponse: "",
        InfoLink: "",
        ImgLink: "",
      };
    },
    saveUserMessage() {
      this.userMessage.msgTime = new Date().toLocaleTimeString();
      this.userMessage.userId = this.$store.state.user.userId;
      this.$store.commit("ADD_USER_MESSAGE", this.userMessage);
      this.messages.push(this.userMessage);
    },
    saveBotMessage() {
      this.botMessage.msgTime = new Date().toLocaleTimeString();
      this.messages.push(this.botMessage);
    },
    sendInput() {
      this.saveUserMessage();
      console.log("sending", this.userMessage);
      chatService.sendInput(this.userMessage).then((msgControllerResponse) => {
        if (msgControllerResponse.status == 200) {
          this.botMessage = msgControllerResponse.data;
          this.saveBotMessage();
        }
        this.clearUserMessage();
        this.clearBotMessage();
        setTimeout(() => this.scrollToEnd(), 100);
        this.scrollToEnd();
      });
    },
    scrollToEnd() {
      let content = document.querySelector(
        "li.allMessages:last-child > div:last-child"
      );
      //content.scrollTop = content.scrollHeight;
      console.log(content, content.scrollTop, content.scrollHeight);
      content.scrollIntoView();
    },
    updated() {
      // This will be called when the component updates
      // try toggling a todo
      this.scrollToEnd();
    },
  },
};
</script>
<style>
.chat-bot {
  display: flex;
  flex-direction: column;
  flex-grow: 1;
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
  width: auto;
  height: 5rem;
}
.messages-area {
  flex-direction: column;
  align-items: stretch;
  padding-bottom: 5rem;
  align-content: space-between;
  display: flex;
}
.text-box input[type="text"] {
  flex: 1;
  height: 5rem;
}
.text-box input[type="submit"] {
  height: 5rem;
  width: 5rem;
  background-color: #5bc0de;
}
#user_message {
  border-radius: 20px 20px 5px;
  color: white;
  background-color: #8cd3e8;
  padding: 1%;
  border-radius: 0.6rem;
  display: flex;
  list-style: none;
  align-items: stretch;
  max-width: 40%;
  margin-bottom: 20px;
  margin-right: 32px;
}
#bot_message {
  border-radius: 5px 20px 20px;
  color: white;
  background-color: #499ab2;
  padding: 1%;
  border-radius: 0.6rem;
  display: flex;
  list-style: none;
  align-items: stretch;
  max-width: 40%;
  margin-bottom: 20px;
}
#greeting_message {
  border-radius: 5px 20px 20px;
  color: white;
  background-color: #499ab2;
  padding: 1%;
  border-radius: 0.6rem;
  display: flex;
  list-style: none;
  align-items: stretch;
  max-width: 40%;
  margin-bottom: 20px;
}
#link_message {
  border-radius: 5px 20px 20px;
  color: white;
  background-color: #499ab2;
  padding: 1%;
  border-radius: 0.6rem;
  display: flex;
  list-style: none;
  align-items: stretch;
  max-width: 40%;
  margin-bottom: 20px;
}
img {
  width: 100%;
}
#image_message {
  border-radius: 5px 20px 20px !important;
  color: white;
  background-color: #499ab2;
  padding: 1%;
  border-radius: 0.6rem;
  display: flex;
  list-style: none;
  width: 40%;
  margin-bottom: 20px;
}

.userMsgContainer {
  display: flex;
  justify-content: flex-end;
  align-items: flex-end;
}
.botMsgContainer {
  display: flex;
  justify-content: flex-start;
  align-items: flex-end;
}
.greetingMsgContainer {
  display: flex;
  justify-content: flex-start;
  align-items: flex-end;
}
.imgContainer {
  display: flex;
  justify-content: flex-start;
  align-items: flex-end;
}
.linkContainer {
  display: flex;
  justify-content: flex-start;
  align-items: flex-end;
}
.allMessagesLi {
  display: flex;
  flex-direction: row;
  align-self: stretch;
}
.msg_time {
  color: grey;
  font-size: 14px;
}
</style>
