<template>
  <div class="home">
    <h1>Welcome to JMTHY</h1>
	<div class="botPortalCont">
<label for="botPortal" id="lPortal">Talk to JMTHY</label>
    <input
      type="button"
      id="botPortal"
      placeholder="Talk to JMTHY"
      v-on:click="$router.push('greeting')"
    />
	</div>
  </div>
</template>

<script>
export default {};
</script>

<style>
.home {
  display: flex;
  flex-direction: column;
  flex-grow: 1;
  align-items: center;
}
#botPortal {
  background: url("https://i.imgur.com/7stJCAO.gif");
  border: none;
  width: 200px;
  height: 150px;
}
#botPortalCont{
background-repeat: no-repeat;
  object-fit: cover;
  flex-direction: column;
  align-items: center;
  padding-bottom: 5rem;
  align-content: center;
  display: flex;
  border-radius: 360px 360px 360px 360px;
  background: color teal;
}
</style>
