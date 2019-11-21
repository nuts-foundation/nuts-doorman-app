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
      const response = await fetch('http://localhost:8080/admin/network-map')
      this.networkMap = await response.json()
    }
  }
}
</script>
