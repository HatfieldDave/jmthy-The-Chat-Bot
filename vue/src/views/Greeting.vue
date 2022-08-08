<template>
	<div>
		<ul> 
			<li>
				Hello, good to see you,
				{{ this.$store.state.user.nickname }}! How can I help you?
				<span class="msg_time"><i>insert time here</i></span>
				<!--<ul>
					<li>Pathway</li>
					<li>Curriculum</li>
					<li>Motivational Quotes</li>
					<li>Find Open Positions</li>
				</ul>-->
			</li>
		</ul>
		<messaging />
	</div>
</template>

<script>

import Messaging from '@/components/Messaging.vue';
export default {
	name: "greeting",
	components:{
		Messaging
	},
	data() {
		return{
			messages:[],
		}
	},
	methods: {
	
		
	},
	created() {},
};
</script>

<style></style>
