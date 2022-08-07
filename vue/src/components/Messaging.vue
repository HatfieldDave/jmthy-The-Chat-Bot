<template>
  <div>
  <ul>
      <li
      v-for= "message in messages"
			v-bind:key="message.ID"
			>
			{{message.message}}
      </li>
  </ul>
  <form >
          <input type="text" name="Chatbox" filled label="Label" auto-grow v-model="userMessage.message" />
          <input type="submit" value="Send" v-on:click.prevent="messageSent = true, saveMessage()" />
          
    </form>
  </div>
</template>

<script>

export default {
name: 'Messaging',

data(){
        return{
            userMessage: {
                ID: 0,
                message: ""
            },
            messageSent: false,
            messages:[
              
            ]
            
        };
    },
    methods:{
        saveMessage(){
            this.$store.commit('ADD_USER_MESSAGE', this.userMessage);
            this.messages.push(this.userMessage);
            this.userMessage = {
                ID: this.userMessage.ID++,
                message: ""
            }
            
        }
    }

}
</script>

<style>

</style>