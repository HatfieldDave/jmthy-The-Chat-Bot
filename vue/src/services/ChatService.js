import axios from 'axios';
export default {
    
  sendInput(userMessage) {
        return axios.post('/messaging', userMessage)
      },
    
}