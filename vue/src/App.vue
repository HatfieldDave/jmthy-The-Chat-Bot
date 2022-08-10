<template>
  <div id="app">
    <!-- If you start to get random styling you don't like, remove container from this div -->

    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
      <div class="container-fluid">
        <img class="logo" src="@/assets/thisisyeti.png" alt="" />
        <a class="navbar-brand" href="#">JMTHY</a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarColor01"
          aria-controls="navbarColor01"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse show" id="navbarColor01">
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
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                data-bs-toggle="dropdown"
                href="#"
                role="button"
                aria-haspopup="true"
                aria-expanded="false"
                >Dropdown</a
              >
              <div class="dropdown-menu">
                <a class="dropdown-item" href="#">Home</a>
                <a class="dropdown-item" href="#">Register</a>
                <a class="dropdown-item" href="#">Login</a>
                <a class="dropdown-item" href="#">Logout</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Separated link</a>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <router-view />
  </div>
</template>

<script>
export default {};
</script>

<!-- Application-Wide Styles go here. 
     Any valid CSS or SCSS is allowable here. See https://sass-lang.com/documentation/style-rules for info on SCSS -->
<style lang="scss">
#app {
	display: flex;
	flex-direction: column;
}

.logo {
	width: 50px;
}

#JMTHY {
	justify-content: center;
}

.header {
	display: flex;
	align-items: center;
	justify-content: space-between;
}
@import "./styles/colors.scss";

// Import the bootstrap styles. If you want to override Bootstrap colors, it needs to happen above this line
@import "../node_modules/bootstrap/scss/bootstrap";

// Your custom styles go below this point
//@import "_bootswatch.scss";
</style>
