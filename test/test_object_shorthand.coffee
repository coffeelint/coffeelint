path = require 'path'
vows = require 'vows'
assert = require 'assert'
coffeelint = require path.join('..', 'lib', 'coffeelint')

RULE = 'object_shorthand'

vows.describe(RULE).addBatch({

    'Object property-value shorthand':
        topic:
            '''
            test = 'value'
            a = {test: test}
            b = {
              t: 1
              tt: 2
              test: test
            }

            c = test: test
            '''

        'not required by default': (source) ->
            errors = coffeelint.lint(source)
            assert.isArray(errors)
            assert.isEmpty(errors)

        'can be required': (source) ->
            config = object_shorthand: { level: 'error' }
            errors = coffeelint.lint(source, config)
            assert.isArray(errors)
            assert.lengthOf(errors, 2)
            
            error = errors[0]
            assert.equal(error.lineNumber, 2)
            assert.equal(error.message, "Use property-value shorthand when using explicit braces")
            assert.equal(error.rule, RULE)
            
            error = errors[1]
            assert.equal(error.lineNumber, 6)
            assert.equal(error.message, "Use property-value shorthand when using explicit braces")
            assert.equal(error.rule, RULE)

}).export(module)

# vim: expandtab shiftwidth=4 softtabstop=4
