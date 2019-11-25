<template>
  <section>
    <table>
      <tbody>
        <tr>
          <th>CommonName</th>
          <th>Org</th>
          <th>Locality</th>
          <th>Country</th>
          <th>Email</th>
          <th>Approved?</th>
          <th>Notary?</th>
          <th>Submission Time</th>
          <th>Approve request</th>
        </tr>
        <template v-for="request in signRequests" >
          <tr v-bind:key="request.commonName" @click="selectedRow=request.legalName.commonName">
            <td>{{ request.legalName.commonName }}</td>
            <td>{{ request.legalName.organisation }}</td>
            <td>{{ request.legalName.locality }}</td>
            <td>{{ request.legalName.country }}</td>
            <td>{{ request.email }}</td>
            <td>{{ request.approved}}</td>
            <td>{{ request.notary }}</td>
            <td>{{ request.submissionTime }}</td>
            <ApproveSignRequestBtn v-bind:certificate="request" @approvalRequested="$emit('approve',request)"></ApproveSignRequestBtn>
          </tr>
          <tr v-bind:key="request.legalName.commonName" v-show="selectedRow===request.legalName.commonName">
            <td colspan="9">
              <pre>
                {{ request.publicKey}}
              </pre>
            </td>
          </tr>
        </template>
      </tbody>
    </table>
  </section>
</template>

<script>
import ApproveSignRequestBtn from '@/components/ApproveSignRequestBtn'

export default {
  name: 'SignRequestsList',
  components: { ApproveSignRequestBtn },
  data () {
    return { selectedRow: '' }
  },
  props: {
    signRequests: {
      type: Array,
      default: () => []
    }
  }
}
</script>
