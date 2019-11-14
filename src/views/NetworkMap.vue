<template>
  <div class="network-map">
    <NetworkMapList/>
  </div>
</template>

<script>
// @ is an alias to /src
import NetworkMapList from '@/components/NetworkMapList'

export default {
  name: 'network-map',
  components: {
    NetworkMapList
  }
}
</script>
