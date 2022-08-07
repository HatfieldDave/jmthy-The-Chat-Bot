import axios from "axios";
//TODO get it to work pl0x
export default {
	getUser() {
		return axios.get("/user");
	},
};
