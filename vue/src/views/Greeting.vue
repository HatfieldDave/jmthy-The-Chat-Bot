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
}
div {
}

.text-box {
	align-items: flex-end;
}
</style>
