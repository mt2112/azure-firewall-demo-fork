param parentName string

resource parentFirewall 'Microsoft.Network/firewallPolicies@2021-05-01' existing = {
  name: parentName
}

resource vnetRuleCollectionGroup 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2020-11-01' = {
  name: 'Spoke-To-Spoke-Rules-Group'
  parent: parentFirewall
  properties: {
    priority: 300
    ruleCollections: [
      {
        name: 'Allow-Online-To-Corp-Network-Rules'
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        priority: 301
        action: {
          type: 'Allow'
        }
        rules: []
      }
      {
        name: 'Allow-Online-To-Corp-Application-Rules'
        priority: 302
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: []
      }
      {
        name: 'Allow-VNET-To-VNET-Network-Rules'
        priority: 303
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: []
      }
      {
        name: 'Allow-VNET-To-VNET-Application-Rules'
        priority: 303
        ruleCollectionType: 'FirewallPolicyNatRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: []
      }
    ]
  }
}
