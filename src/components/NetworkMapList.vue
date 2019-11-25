<template>
  <div>
    <b-table striped :items="networkMap" :fields="fields">
      <template v-slot:cell(addresses)="data">
        tcp://{{ data.item.addresses[0].host }}:{{ data.item.addresses[0].port }}
      </template>
    </b-table>
  </div>
</template>

<script>
export default {
  name: 'NetworkMapList',
  data () {
    return {
      fields: [
        { key: 'legalName.commonName', label: 'CommonName' },
        { key: 'legalName.organisation', label: 'Org' },
        { key: 'legalName.locality', label: 'Locality' },
        { key: 'legalName.country', label: 'Country' },
        { key: 'addresses', label: 'Addresses' }
      ]
    }
  },
  props: {
    networkMap: Array
  }
}
</script>
