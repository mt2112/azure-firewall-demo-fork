param parentName string

resource parentFirewall 'Microsoft.Network/firewallPolicies@2021-05-01' existing = {
  name: parentName
}

resource hubRuleCollectionGroup 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2020-11-01' = {
  name: 'Hub-Rules-Group'
  parent: parentFirewall
  properties: {
    priority: 200
    ruleCollections: [
      {
        name: 'Allow-Hub-Network-Rules'
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        priority: 201
        action: {
          type: 'Allow'
        }
        rules: []
      }
      {
        name: 'Allow-Hub-Application-Rules'
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        priority: 202
        action: {
          type: 'Allow'
        }
        rules: []
      }
    ]
  }
}
