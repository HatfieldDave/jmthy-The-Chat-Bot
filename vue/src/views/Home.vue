<template>
	<div class="home">
				<h1>Welcome to JMTHY</h1>
				<router-link v-bind:to="{name: 'greeting'}"> </router-link>
				<input type="button" value="Try out now" v-on:click="$router.push('greeting')"/>
				
			</div>
</template>

<script>

export default {

};

