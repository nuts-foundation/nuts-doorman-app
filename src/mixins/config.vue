<script>
export default {
  data () {
    const doormanUrl = process.env.VUE_APP_NUTS_DOORMAN_URL || '$NUTS_DOORMAN_URL'
    const networkMapUrl = process.env.VUE_APP_NUTS_NETWORKMAP_URL || '$NUTS_NETWORKMAP_URL'
    return {
      config: {
        doormanUrl,
        networkMapUrl
      }
    }
  }
}
</script>
