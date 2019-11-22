<template>
  <div class="network-map">
    <NetworkMapList v-bind:networkMap="networkMap"/>
  </div>
</template>

<script>
// @ is an alias to /src
import NetworkMapList from '@/components/NetworkMapList'

export default {
  name: 'network-map',
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
      const url = process.env.VUE_APP_NETWORKMAP_URL
      const response = await fetch(`http://${url}/admin/network-map`)
      this.networkMap = await response.json()
    }
  }
}
</script>
