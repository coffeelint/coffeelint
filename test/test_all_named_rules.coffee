path = require 'path'
vows = require 'vows'
assert = require 'assert'
coffeelint = require path.join('..', 'lib', 'coffeelint')

rules = Object.values(coffeelint.getRules())
namedRules = rules.filter((it) -> it.hasOwnProperty('name'))

knownRuleTypes = [ 'style', 'problem' ]

hasCorrectPropertyType = (rule) ->
    return rule.hasOwnProperty('type') and rule.type in knownRuleTypes

vows.describe('coffeelint').addBatch({

    'CoffeeLint\'s named rules':
        topic: namedRules

        'has correct property "type"': (rules) ->
            assert.isTrue(rules.every(hasCorrectPropertyType))

}).export(module)
