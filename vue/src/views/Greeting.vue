<template>
	<div>
		<ul>
			<li>
				Hello, good to see you,
				{{ this.$store.state.user.nickname }}! How can I help you?
				<span class="msg_time"><i>insert time here</i></span>
			</li>
		</ul>
	</div>
</template>

<script>

export default {
	name: "greeting",
	data() {
		
	},
	methods: {
		
	},
	created() {},
};
</script>

<style></style>
