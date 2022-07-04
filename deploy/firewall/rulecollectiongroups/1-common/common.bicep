param parentName string

resource parentFirewall 'Microsoft.Network/firewallPolicies@2021-05-01' existing = {
  name: parentName
}

resource commonRuleCollectionGroup 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2021-05-01' = {
  name: 'Common-Rules-Group'
  parent: parentFirewall
  properties: {
    priority: 100
    ruleCollections: [
      {
        name: 'Allow-Common-Network-Rules'
        priority: 101
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: []
      }
      {
        name: 'Allow-Common-Application-Rules'
        priority: 102
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: []
      }
    ]
  }
}
