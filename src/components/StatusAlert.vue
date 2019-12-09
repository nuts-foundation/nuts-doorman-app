<template>
  <div>
    <b-alert :variant="type" dismissible fade
             :show="message"
             @dismissed="dismiss">{{ message }}</b-alert>
    <slot></slot>
  </div>
</template>

<script>
export default {
  name: 'StatusAlert',
  data () {
    return {
      type: null,
      message: null
    }
  },
  created () {
    this.$on('statusUpdate', function (status) {
      this.message = status.message
      this.type = status.type
    })
  },
  methods: {
    dismiss: function () {
      this.message = null
      this.type = null
    }
  }
}
</script>
