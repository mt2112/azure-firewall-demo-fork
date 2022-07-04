param parentName string

resource parentFirewall 'Microsoft.Network/firewallPolicies@2021-05-01' existing = {
  name: parentName
}

resource spokesRuleCollectionGroup 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2020-11-01' = {
  name: 'Spoke-Specific-Rules-Group'
  parent: parentFirewall
  properties: {
    priority: 500
    ruleCollections: [
      {
        name: 'Allow-SpokeX-To-Network-Rules'
        priority: 502
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: []
      }
      {
        name: 'Allow-SpokeX-To-Application-Rules'
        priority: 502
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: []
      }
    ]
  }
}
