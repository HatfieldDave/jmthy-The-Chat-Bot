<template>
  <div class="Home" style="myStyle">
    <div>
      <input
        type="button"
        value="Try out now"
        v-on:click="$router.push('greeting')"
      />
    </div>
  </div>
</template>

<script>
export default {
    name: "homepage",
  data() {
    return {
      myStyle: {
        backgroundColor: "teal",
      },
    };
  },
};
</script>

<style>
body {
  background-color: teal;
}
</style>
