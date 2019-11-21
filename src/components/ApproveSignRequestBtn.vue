<template>
  <button v-on:click="approveSignRequest">Approve</button>
</template>

<script>
export default {
  name: 'ApproveSignRequestBtn',
  props: {
    certificate: Object
  },
  methods: {
    approveSignRequest: async function () {
      console.log(this.certificate)
      if (confirm(`Would you like to approve ${this.certificate.legalName.commonName}?`)) {
        this.$emit('approvalRequested')
      }
    }
  }
}
</script>
