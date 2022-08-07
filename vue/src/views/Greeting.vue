<template>
	<div>
		<ul>
			<li>
				Hello, Nice to Meet you,
				{{ this.$store.state.activeUser.nickname }} what should I call you?
				<span class="msg_time"><i>insert time here</i></span>
			</li>
		</ul>
	</div>
</template>

<script>
import UserService from "@/services/UserService.js";
export default {
	name: "greeting",
	data() {
		return {
			user: {
				nickname: "",
				pronouns: "",
			},
		};
	},
	methods: {
		getUserNickname() {
			UserService.getUser()
				.then((response) => {
					if (response.status == 200) {
						this.$store.commit("SAVE_ACTIVE_USER", response.data);
					}
				})
				.catch((err) => {
					console.log(err + "GET FUCKED LOSER");
				});
		},
	},
	created() {},
};
</script>

<style></style>
