<template>
  <section>
    <b-table striped :items="signRequests" :fields="fields">
      <template v-slot:cell(publicKey)="request">
        <b-button :id="`popover-${request.index}`">Key</b-button>
        <b-popover :target="`popover-${request.index}`" triggers="hover" placement="top">
          <template v-slot:title>PublicKey of {{request.item.legalName.commonName}}</template>
          <pre>{{ request.item.publicKey }}</pre>
        </b-popover>
      </template>
      <template v-slot:cell(approve)="request">
        <ApproveSignRequestBtn v-bind:certificate="request.item" @approvalRequested="$emit('approve',request.item)"></ApproveSignRequestBtn>
      </template>
    </b-table>
  </section>
</template>

<script>
import ApproveSignRequestBtn from '@/components/ApproveSignRequestBtn'

export default {
  name: 'SignRequestsList',
  components: { ApproveSignRequestBtn },
  data () {
    return {
      fields: [
        { key: 'legalName.commonName', label: 'CommonName' },
        { key: 'legalName.organisation', label: 'Org' },
        { key: 'legalName.locality', label: 'Locality' },
        { key: 'legalName.country', label: 'Country' },
        { key: 'email', label: 'Email' },
        { key: 'approved', label: 'Approved' },
        { key: 'notary', label: 'Notary' },
        {
          key: 'submissionTime',
          label: 'Submission Time',
          formatter: (value, key, item) => new Date(item.submissionTime).toLocaleString()
        },
        { key: 'publicKey', label: 'PublicKey' },
        { key: 'approve', label: 'Approve requests' }
      ]
    }
  },
  props: {
    signRequests: {
      type: Array,
      default: () => []
    }
  }
}
</script>
