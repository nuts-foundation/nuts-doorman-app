<template>
  <p v-bind:class="type">
    {{ message }}
  </p>
</template>

<script>
export default {
  name: 'StatusAlert',
  props: {
    message: String,
    type: String
  }
}
</script>

<style>
.fail {
  border: 1px solid red;
}
</style>
