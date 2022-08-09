import axios from 'axios';
export default {
    
  sendInput(input) {
        return axios.post('/messaging', input)
      },
    
}