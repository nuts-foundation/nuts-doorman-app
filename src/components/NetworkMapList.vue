<template>
  <table>
    <tbody>
      <tr>
        <th>CommonName</th>
        <th>Org</th>
        <th>Locality</th>
        <th>Country</th>
        <th>Addresses</th>
      </tr>
      <tr v-for="item in networkMap" v-bind:key="item.legalName.commonName">
        <td >
          {{ item.legalName.commonName }}
        </td>
        <td>{{ item.legalName.organisation }}</td>
        <td>{{ item.legalName.locality }}</td>
        <td>{{ item.legalName.country }}</td>
        <td>
          <p v-for="address in item.addresses" v-bind:key="address.host + address.port">
            tcp://{{ address.host }}:{{ address.port }}
          </p>
        </td>
      </tr>
    </tbody>
  </table>

</template>

<script>
export default {
  name: 'NetworkMapList',
  props: {
    networkMap: Array
  }
}
</script>
