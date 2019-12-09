<template>
  <b-container id="app">
    <div id="nav">
      <router-link to="/network-map">Network-Map</router-link> |
      <router-link to="/sign-requests">Signing Requests</router-link> |
    </div>
    <StatusAlert >
      <router-view/>
    </StatusAlert>
  </b-container>
</template>

<script>
import StatusAlert from './components/StatusAlert'
export default {
  components: {
    StatusAlert
  }
}
</script>

<style lang="scss">
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;

  a {
    font-weight: bold;
    color: #2c3e50;

    &.router-link-exact-active {
      color: #42b983;
    }
  }
}

table {
  text-align: left;
  width: 100%;
}
tr:nth-child(even){
  background-color: azure;
}
td {
  margin: 1em;
}
</style>
