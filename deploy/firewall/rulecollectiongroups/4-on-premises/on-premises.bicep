param parentName string

resource parentFirewall 'Microsoft.Network/firewallPolicies@2021-05-01' existing = {
  name: parentName
}

resource vnetRuleCollectionGroup 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2020-11-01' = {
  name: 'OnPremises-Rules-Group'
  parent: parentFirewall
  properties: {
    priority: 400
    ruleCollections: [
      {
        name: 'Allow-OnPremises-To-VNET-Network-Rules'
        priority: 401
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: []
      }
      {
        name: 'Allow-OnPremises-To-VNET-Application-Rules'
        priority: 402
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: []
      }
      {
        name: 'Allow-VNET-To-OnPremises-Network-Rules'
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        priority: 403
        action: {
          type: 'Allow'
        }
        rules: []
      }
      {
        name: 'Allow-VNET-To-OnPremises-Application-Rules'
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        priority: 404
        action: {
          type: 'Allow'
        }
        rules: []
      }
    ]
  }
}
