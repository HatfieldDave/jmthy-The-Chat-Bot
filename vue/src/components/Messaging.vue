<template>
  <div class="chat-bot">
    <ul class="messages-area" style="list-style:none">
      <li class="greeting botMsgBox">
        Hello, good to see you,
        {{ this.$store.state.user.nickname }}! How can I help you?
        <span class="msg_time"><i>insert time here</i></span>
      </li>
      <li v-for="message in messages" v-bind:key="message.botResponse" class="allMessages" >
        <div class="userMsgContainer">
          <span class="message userMsgBox" id="user_message" v-if="message.userText">
          {{ message.userText }}
          </span>
          <span class="msg_time" v-if="message.userText"><i>insert time here</i></span>
        </div>
        <div class="botMsgContainer">
          <span class="message botMsgBox" id="bot_message" v-if="message.botResponse">
          {{ message.botResponse }}
          <a v-bind:href="message.link" v-show="botMessage.infoLink"> Link </a>
          <image-card v-show="botMessage.imgLink" />
         </span>
       <span class="msg_time" v-if="message.botResponse"><i>insert time here</i></span>
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
			},
			botMessage: {
				//ID: 1,
				botResponse: "",
				infoLink: "",
				imgLink: "",
			},
			messageSent: false,
			messages: [],
		};
	},
	methods: {
		getTime() {
			this.time;
			let current = new Date();
			let time = current.getHours() + ":" + current.getMinutes();
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
		scrollToEnd: function() {
			let content = this.$refs.messagesContainer;
			content.scrollTop = content.scrollHeight;
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
