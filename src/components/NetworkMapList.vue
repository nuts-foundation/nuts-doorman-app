<template>
  <table>
    <tbody>
      <tr>
        <th>CommonName</th>
        <th>Addresses</th>
        <th>Org</th>
        <th>Locality</th>
        <th>Country</th>
      </tr>
      <tr v-for="item in items" v-bind:key="item.legalEntity.commonName">
        <td >
          {{ item.legalEntity.commonName }}
        </td>
        <td>
          <p v-for="address in item.addresses" v-bind:key="address.host + address.port">
            tcp://{{ address.host }}:{{ address.port }}
          </p>
        </td>
        <td>{{ item.legalEntity.organisation }}</td>
        <td>{{ item.legalEntity.locality }}</td>
        <td>{{ item.legalEntity.country }}</td>
      </tr>
    </tbody>
  </table>

</template>

<script>
export default {
  name: 'NetworkMapList',
  data: () => {
    return { items: [] }
  },
  mounted: async function () {
    this.fetchNetworkMap()
  },
  methods: {
    fetchNetworkMap: async function () {
      const response = await fetch('http://localhost:8080/admin/network-map')
      this.items = await response.json()
    }
  }
}
</script>
