<template>
  <section>
    <b-spinner label="Spinning" v-if="!signRequests && !error"></b-spinner>
    <SignRequestList v-else-if="signRequests && signRequests.length > 0" v-bind:signRequests="signRequests" @approve="approveSignatureSigningRequests"></SignRequestList>
    <b-alert v-else-if="error" show variant="danger">{{ error }}</b-alert>
    <p v-else>No sign requests found</p>
  </section>
</template>

<script>
import SignRequestList from '../components/SignRequestList'
import Config from '../mixins/config'

export default {
  name: 'SignRequests',
  mixins: [Config],
  data () {
    return {
      signRequests: null,
      error: null
    }
  },
  mounted () {
    this.fetchSignatureSigningRequests()
  },
  methods: {
    fetchSignatureSigningRequests: async function () {
      const url = this.config.doormanUrl
      const response = await fetch(`${url}/admin/certificates/signrequests`)
      this.signRequests = await response.json()
    },
    approveSignatureSigningRequests: async function (request) {
      try {
        const url = this.config.doormanUrl
        const response = await fetch(`${url}/admin/certificates/signrequests/${request.legalName.x500Principal.name}/approve`, {
          method: 'PUT'
        })
        if (response.status === 200) {
          this.statusMessage(`Approving node with name [${request.legalName.commonName}] succeeded`, 'info')
          this.fetchSignatureSigningRequests()
        } else {
          this.statusMessage(`Approving node with name [${request.legalName.commonName}] failed. Reason: non 200 status`, 'danger')
        }
      } catch (e) {
        this.statusMessage(`Approving node with name [${request.legalName.commonName}] failed. Reason: [${e.message}]`, 'danger')
      }
    },
    statusMessage: function (message, type) {
      this.$parent.$emit('statusUpdate', { message, type })
    }
  },
  components: {
    SignRequestList
  }
}
</script>
