path = require 'path'
vows = require 'vows'
assert = require 'assert'
coffeelint = require path.join('..', 'lib', 'coffeelint')

rulesArray = Object.values(coffeelint.getRules())
namedRulesArray = rulesArray.filter((it) -> it.hasOwnProperty('name'))

hasCorrectPropertyType = (rule) ->
    correctValues = [ 'style', 'problem' ]
    return rule.hasOwnProperty('type') and rule.type in correctValues

vows.describe('coffeelint').addBatch({

    'CoffeeLint\'s named rules':
        topic: namedRulesArray

        'has correct property "type"': (rules) ->
            assert.isTrue(rules.every(hasCorrectPropertyType))

}).export(module)
