<template>
	<div>
		<ul>
			<li v-for="keywords in messages" v-bind:key="keywords.ID">
				{{ keywords.keywords }}
			</li>
            <li v-for="response in messages" v-bind:key="response.ID">
                {{ response.response }}
            </li>
		</ul>
		<form>
			<input
				type="text"
				name="Chatbox"
				filled
				label="Label"
				auto-grow
				v-model="userMessage.keywords"
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
				keywords: "",
                response: '',
			},
			messageSent: false,
			messages: [],
		};
	},
	methods: {
		saveMessage() {
			this.$store.commit("ADD_USER_MESSAGE", this.userMessage);
			this.messages.push(this.userMessage);
			this.userMessage = {
				ID: this.userMessage.ID++,
				keywords: "",
                response: "",
			};
		},
		sendInput() {
            this.saveMessage();
			chatService.sendInput(this.messages[0]).then((response) => {
				if (response.status == 200) {
					this.messages[0].response=response.data;
				}
			});
		},
	},
};
</script>

<style></style>
