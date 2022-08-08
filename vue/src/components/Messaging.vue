<template>
	<div>
		<ul>
			<li v-for="keywords in messages" v-bind:key="keywords.ID">
				{{ keywords.keywords }}
			</li>
            <li v-for="responses in messages" v-bind:key="responses.ID">
                {{ responses.responses }}
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
                responses: '',
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
                responses: "",
			};
		},
		sendInput() {
            this.saveMessage();
			chatService.sendInput(this.messages[0]).then((response) => {
				if (response.status == 200) {
					this.messages.push=response.data;
				}
			});

		},
	},
};
</script>

<style></style>
