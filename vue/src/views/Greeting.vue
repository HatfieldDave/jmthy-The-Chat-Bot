<template>
	<div>
		<messaging />
	</div>
</template>

<script>
import Messaging from "@/components/Messaging.vue";
export default {
	name: "greeting",
	components: {
		Messaging,
	},
	data() {
		return {
			messages: [],
		};
	},
	methods: {},
	created() {},
};
</script>

<style scoped>
* {
	display: flex;
	background-color: coral;
}
div {
	background-color: blue;
}

.text-box {
	align-items: flex-end;
}
</style>
