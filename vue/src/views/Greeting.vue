<template>
	<div>
		<messaging />
	</div>
</template>

<script>
import Messaging from "@/components/Messaging.vue";
export default {
	name: "Greeting",
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

<style>


</style>
