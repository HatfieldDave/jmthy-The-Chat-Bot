<template>
  <div class="home">
    <h1>Welcome to JMTHY</h1>
    <div class="glow-on-hover" v-on:click="$router.push('greeting')">
      <a type="button" id="botPortal" />
      <a class="talk">Talk to JMTHY</a>
    </div>
    <ul class="readColumns">
      <a>
        <div>Pathway</div>
        <li class="ThumbsUp" />
        <div>Gives you interview tips</div>
        <li class="ThumbsUp" />
        <div>more pathway stuff</div>
        <li class="ThumbsUp" />
        <div>even more pathway stuff</div>
      </a>
      <a>
        <div>Curriculum</div>
        <li class="ThumbsUp" />
        <div>curriculum stuff</div>
        <li class="ThumbsUp" />
        <div>more curriculum stuff</div>
        <li class="ThumbsUp" />
        <div>even more curriculum stuff</div>
      </a>
      <a>
        <div>Motivation</div>
      </a>
    </ul>
    <div></div>
  </div>
</template>

<script>
export default {
  methods: {},
};
</script>

<style scoped>

.talk {
  
  border-radius: 10px;
  float: right;
  margin-top: 3.5rem;
  margin-right: 30%;
  font-size: 30px;
  border-radius: 10px;
  background-image: linear-gradient(
    45deg,
    #ff0000,
    #ff7300,
    #fffb00,
    #48ff00,
    #00ffd5,
    #002bff,
    #7a00ff,
    #ff00c8,
    #ff0000
  );
  background-size: 800% 800%;
  -webkit-text-fill-color: transparent;
  animation: glowing 20s linear infinite;
  transition: opacity 0.3s ease-in-out;
  border-radius: 10px;
 background-clip: text;
-webkit-background-clip: text;
color: transparent;
  z-index: -1;
}
.home {
  display: flex;
  flex-direction: column;
  flex-grow: 1;
  align-items: center;
}
.readColumns {
  display: flex;
  justify-content: space-evenly;
  flex-wrap: wrap;
 
}
.readColumns > a {
  border: 2px solid black;
   background: cornflowerblue;
  align-content: center;
  border-radius: 10px;
  width: 258px;
  height: 550px;
  margin: 20px;
}
.readColumns > a:hover {
  border-radius: 10px;
  width: 400px;
  height: 550px;
  margin: 20px;
}
.readColumns > a > div {
  font-size: 20px;

  text-align: left;
  justify-content: space-evenly;
  margin-left: 3.9rem;
  margin-bottom: 3rem;
  font-family: colfax, sans-serif;
}
@font-face {
  font-family: "colfax";
  src: url("../assets/Fonts/Colfax-Regular.otf") format("opentype");
}
.ThumbsUp {
  content: "";
  display: block;
  width: 30px;
  height: 40px;
  position: absolute;
  background-image: url("https://i.imgur.com/sTszr76.png");
  background-size: 100% auto;
  margin-top: 0rem;
  margin-left: 1.6rem;
}
body{
 background-attachment: fixed;
 background-image: url('../assets/gifs/snowy-mountain.gif');
	overflow: hidden;
}
#botPortal {
  background: url("https://i.imgur.com/pPHJVSF.png");
  border: none;
  width: 105px;
  height: 140px;
  margin-left: 2rem;
}
#botPortal:hover {
  background-repeat: no-repeat;
  background: url("https://i.imgur.com/iZpJZhI.gif");
  border: none;
  width: 105px;
  height: 140px;
  margin-left: 2rem;
}
#lPortal {
  color: aqua;
  margin-left: 1rem;
  margin-bottom: 1rem;
  font-family: colfax;
  font-size: 20px;
}
.botPortalCont {
  border-radius: 360px 360px !important;
  color: white;
  background-color: #499ab2;
  padding: 1%;
  border-radius: 0.6rem;
  display: flex;
  list-style: none;
  width: 40%;
  margin-bottom: 20px;
}

.glow-on-hover {
  border-radius: 360px 360px !important;
  margin-top: 5rem;
  width: 40%;
  outline: none;
  color: #fff;
  background: cornflowerblue;
  cursor: pointer;
  position: relative;
  z-index: 0;
  border-radius: 10px;
}

.glow-on-hover:before {
  content: "";
  background: linear-gradient(
    45deg,
    #ff0000,
    #ff7300,
    #fffb00,
    #48ff00,
    #00ffd5,
    #002bff,
    #7a00ff,
    #ff00c8,
    #ff0000
  );
  position: absolute;
  top: -2px;
  left: -2px;
  background-size: 400%;
  z-index: -1;
  filter: blur(5px);
  width: calc(100% + 4px);
  height: calc(100% + 4px);
  animation: glowing 20s linear infinite;
  opacity: 0;
  transition: opacity 0.3s ease-in-out;
  border-radius: 10px;
}

.glow-on-hover:active {
  color: cornflowerblue;
}

.glow-on-hover:active:after {
  background: transparent;
}

.glow-on-hover:hover:before {
  opacity: 1;
}

.glow-on-hover:after {
  z-index: -1;
  content: "";
  position: absolute;
  width: 100%;
  height: 100%;
  background: cornflowerblue;
  left: 0;
  top: 0;
  border-radius: 10px;
}

@keyframes glowing {
  0% {
    background-position: 0 0;
  }
  50% {
    background-position: 400% 0;
  }
  100% {
    background-position: 0 0;
  }
}
</style>>
