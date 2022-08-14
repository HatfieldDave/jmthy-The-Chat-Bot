<template>
  <div id="app">
    <!-- If you start to get random styling you don't like, remove container from this div -->

    <nav class="navbar navbar-dark bg-primary">
      <div class="container-fluid">
        <img class="logo" src="@/assets/thisisyeti.png" alt="" />
        <a class="navbar-brand" href="#">JMTHY</a>
        <button
          class="navbar-toggler"
          type="button"
          data-toggle="collapse"
          data-target="#navbarColor01"
          aria-controls="navbarColor01"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse" id="navbarColor01">
          <ul class="navbar-nav me-auto">
            <li class="nav-item">
              <router-link class="nav-link" v-bind:to="{ name: 'home' }">
                <i class="fas fa-home"></i>
                <!-- This is a font awesome icon -->
                Home
              </router-link>
              <span class="visually-hidden">(current)</span>
            </li>
            <li class="nav-item">
              <router-link
                class="nav-link"
                v-bind:to="{ name: 'register' }"
                v-if="!$store.state.token"
                >Register</router-link
              >
            </li>
            <li class="nav-item">
              <router-link
                class="nav-link"
                v-bind:to="{ name: 'login' }"
                v-if="!$store.state.token"
                >Login
              </router-link>
            </li>
            <li class="nav-item">
              <router-link
                class="nav-link"
                v-bind:to="{ name: 'logout' }"
                v-if="$store.state.token"
                >Logout
              </router-link>
            </li>
            <li class="nav-item">
              <router-link
                class="nav-link"
                v-bind:to="{ name: 'Greeting' }"
                v-if="$store.state.token"
                >Chat 
              </router-link>
              </li>
          </ul>
        </div>
      </div>
    </nav>
    <router-view class="body" />
  </div>
</template>

<script>
export default {};
</script>

<!-- Application-Wide Styles go here. 
     Any valid CSS or SCSS is allowable here. See https://sass-lang.com/documentation/style-rules for info on SCSS -->
<style lang="scss">
#app {
	display:grid;
  grid-template-areas: 
  "header"
  "body";
}
.logo {
	width: 50px;
}
.body{
  grid-area: body;
  display: flex;
  flex-grow:1;
 
}
.navbar{
  grid-area: header;
}
.navbar-brand {
  letter-spacing: 0.5rem;
  font-weight: 900;
}
.nav-item{
text-align: right
}


@import "./styles/colors.scss";

// Import the bootstrap styles. If you want to override Bootstrap colors, it needs to happen above this line
@import "../node_modules/bootstrap/scss/bootstrap";

// Your custom styles go below this point
//@import "_bootswatch.scss";
</style>
