<template>
  <div class="network-map">
    <b-spinner label="Spinning" v-if="!networkMap"></b-spinner>
    <NetworkMapList v-bind:networkMap="networkMap" v-else-if="networkMap.length > 0"/>
    <p v-else>No nodes found</p>
  </div>
</template>

<script>
// @ is an alias to /src
import NetworkMapList from '@/components/NetworkMapList'
import Config from '../mixins/config'

export default {
  name: 'network-map',
  mixins: [Config],
  data () {
    return { networkMap: null }
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
      const response = await fetch(`${url}/admin/network-map`)
      this.networkMap = await response.json()
    }
  }
}
</script>
