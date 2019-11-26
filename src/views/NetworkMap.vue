<template>
  <div class="network-map">
    <NetworkMapList v-bind:networkMap="networkMap"/>
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
    return { networkMap: [] }
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
