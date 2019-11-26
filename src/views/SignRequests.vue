<template>
  <section>
    <StatusAlert
      v-bind:message="statusMsg"
      v-bind:type="statusType"
    ></StatusAlert>
    <SignRequestList v-bind:signRequests="signRequests" @approve="approveSignatureSigningRequests"></SignRequestList>
  </section>
</template>

<script>
import SignRequestList from '../components/SignRequestList'
import StatusAlert from '../components/StatusAlert'
import Config from '../mixins/config'

export default {
  name: 'SignRequests',
  mixins: [Config],
  data () {
    return {
      signRequests: [],
      statusMsg: '',
      statusType: ''
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
          this.statusMsg = `Approving node with name [${request.legalName.commonName}] succeeded`
          this.statusType = 'info'
        } else {
          this.statusMsg = `Approving node with name [${request.legalName.commonName}] failed. Reason: non 200 status`
          this.statusType = 'fail'
        }
      } catch (e) {
        this.statusMsg = `Approving node with name [${request.legalName.commonName}] failed. Reason: [${e.message}]`
        this.statusType = 'fail'
      }
    }
  },
  components: {
    SignRequestList,
    StatusAlert
  }
}
</script>
