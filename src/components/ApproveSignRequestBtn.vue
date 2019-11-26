<template>
  <b-button v-on:click="approveSignRequest">Approve</b-button>
</template>

<script>
export default {
  name: 'ApproveSignRequestBtn',
  props: {
    certificate: Object
  },
  methods: {
    approveSignRequest: async function () {
      if (confirm(`Would you like to approve ${this.certificate.legalName.commonName}?`)) {
        this.$emit('approvalRequested')
      }
    }
  }
}
</script>
