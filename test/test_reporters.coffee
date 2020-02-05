path = require 'path'
vows = require 'vows'
assert = require 'assert'

###
# # This will work from 3rd party code
# coffeelint = require 'coffeelint'
# RawReporter = require 'coffeelint/lib/reporters/raw'
###

coffeelint = require path.join('..', 'lib', 'coffeelint')
PassThroughReporter = require path.join('..', 'lib', 'reporters', 'passthrough')
CheckStyleReporter = require path.join('..', 'lib', 'reporters', 'checkstyle')
CSVReporter = require path.join('..', 'lib', 'reporters', 'csv')

class TestCheckStyleReporter extends CheckStyleReporter
    output = ''

    print: (input) ->
        output += input + '\n'

class TestCSVReporter extends CSVReporter
    output = ''

    print: (input) ->
        output += input + '\n'

    publish: () ->
        super()
        output

vows.describe('reporters').addBatch({

    'Can be used by 3rd party projects':
        topic:
            '''
            if true
                undefined
            '''

        '(example)': (code) ->

            # Grab your own ErrorReport
            errorReport = coffeelint.getErrorReport()
            # Lint your files, no need to save the results.
            # They're captured inside the ErrorReport.
            errorReport.lint 'stdin', code

            # Construct a new reporter and publish the results.
            # You can use the built in reporters, or make your own.
            reporter = new PassThroughReporter errorReport
            result = reporter.publish()

            assert.equal(result.stdin.length, 1)
            error = result.stdin[0]
            assert.equal(error.name, 'indentation')

    'CheckStyleReporter':
        topic: 'a = 1'

        'does not show undefined context': (code) ->
            config =
                eol_last: level: 'error'

            # Grab your own ErrorReport
            errorReport = coffeelint.getErrorReport()
            # Lint your files, no need to save the results.
            # They're captured inside the ErrorReport.
            errorReport.lint 'stdin', code, config

            # Construct a new reporter and publish the results.
            # You can use the built in reporters, or make your own.
            reporter = new TestCheckStyleReporter errorReport
            result = reporter.publish()

            assert.ok(!result.includes 'context:')

    'Make sure CSV is properly escaped':
        topic:
            '''
            { a: b}
            '''

        'Make sure CSV columns are quoted, and newlines are escaped': (code) ->
            config =
                braces_spacing:
                    level: 'error'

            errorReport = coffeelint.getErrorReport()
            errorReport.lint 'stdin', code, config

            # Construct a new reporter and publish the results. You can use the
            # built in reporters, or make your own.
            reporter = new TestCSVReporter errorReport
            result = reporter.publish().split(/\n/)
            output = result[1].split(',')

            assert.equal(output[0], 'stdin')
            assert.equal(output[1], 1)
            assert.equal(output[2], '')
            assert.equal(output[3], 'error')
            assert.equal(output[4], '"Curly braces must have the proper spacing ' +
                'There should be 0 spaces inside ""{"""')

}).export(module)
