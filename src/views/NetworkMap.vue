<template>
  <b-container class="network-map">
    <b-spinner label="Spinning" v-if="!networkMap && !error"></b-spinner>
    <NetworkMapList v-bind:networkMap="networkMap" v-else-if="networkMap && networkMap.length > 0"/>
    <b-alert v-else-if="error" show variant="danger">{{ error }}</b-alert>
    <p v-else>No nodes found</p>
  </b-container>
</template>

<script>
// @ is an alias to /src
import NetworkMapList from '@/components/NetworkMapList'
import Config from '../mixins/config'

export default {
  name: 'network-map',
  mixins: [Config],
  data () {
    return {
      networkMap: null,
      error: null
    }
  },
  components: {
    NetworkMapList
  },
  mounted () {
    this.fetchNetworkMap()
  },
  methods: {
    fetchNetworkMap: async function () {
      const url = this.config.networkMapUrl
      try {
        const response = await fetch(`${url}/admin/network-map`)
        this.networkMap = await response.json()
      } catch (e) {
        this.error = e.message
      }
    }
  }
}
</script>
