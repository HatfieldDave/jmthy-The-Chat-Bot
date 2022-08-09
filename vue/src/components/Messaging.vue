<template>
	<div>
		<ul>
			<li v-for="TopicQ in messages" v-bind:key="TopicQ.ID">
			<span v-if="TopicQ.TopicQ" >	{{ TopicQ.TopicQ }}</span>
			<span v-if="TopicQ.topicInfo" >	{{ TopicQ.topicInfo }}</span>
			</li>
           
		</ul>
		<form>
			<input
				type="text"
				name="Chatbox"
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
				ID: 0,
				TopicQ: "",
			},
			botMessage:{
				ID: 1,
				topicInfo: "",
				link: "",
			},
			messageSent: false,
			messages: [],
		};
	},
	methods: {
		clearUserMessage(){
			this.userMessage = {
				ID: this.userMessage.ID++,
				TopicQ: "",
			};
		},
		clearBotMessage(){
			this.botMessage = {
				ID: this.botMessage.ID++,
				topicInfo: "",
			};
		},
		saveUserMessage() {
			this.$store.commit("ADD_USER_MESSAGE", this.userMessage);
			this.messages.push(this.userMessage);
			
		},
		saveBotMessage(){
			this.messages.push(this.botMessage);
		},
		sendInput() {
            this.saveUserMessage();
			console.log("sending", this.userMessage);
			chatService.sendInput(this.userMessage)
			.then((response) => {
				if (response.status == 200) {
					this.botMessage=response.data;
					this.saveBotMessage();
				}
				this.clearUserMessage();
				this.clearBotMessage()
			});

		},
	},
};
</script>

<style></style>
