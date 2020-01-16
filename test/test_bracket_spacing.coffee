path = require 'path'
vows = require 'vows'
assert = require 'assert'
coffeelint = require path.join('..', 'lib', 'coffeelint')

sources =
    monoArray:
        noSpaces: '[foo]'
        oneSpace: '[ foo ]'
        twoSpaces: '[  foo  ]'
    emptyArray:
        noSpaces: '[]'
        oneSpace: '[ ]'
        twoSpaces: '[  ]'
    ownLine: '''
             x = [
               foo, bar
             ]
             '''
    sameLine:
        noSpaces: '[foo, bar]'
        oneSpace: '[ foo, bar ]'
        twoSpaces: '[  foo, bar  ]'
    splitLine:
        noSpaces: '''
                  [foo,
                   bar] = x
                  '''
        oneSpace: '''
                  [ foo,
                    bar ] = x
                  '''
        twoSpaces: '''
                   [  foo,
                      bar  ] = x
                   '''
    exceptions:
        objectArray: '[{ foo: bar }]'
        squareBrackets: '[ [foo, bar] ]'
        stringInterpolation: '[\'string\', "#{i + n}terpolatio#{n}"]'

configs =
    oneEmptyArraySpace:
        bracket_spacing: { level: 'error', empty_array_spaces: 1 }
    oneMonoArraySpace:
        bracket_spacing: { level: 'error', mono_array_spaces: 1 }
    oneSpace:
        bracket_spacing: { level: 'error', spaces: 1 }
    zeroEmptyArraySpaces:
        bracket_spacing: { level: 'error', empty_array_spaces: 0 }
    zeroMonoArraySpaces:
        bracket_spacing: { level: 'error', mono_array_spaces: 0 }
    zeroSpaces:
        bracket_spacing: { level: 'error', spaces: 0 }
    exceptBraces:
        bracket_spacing: { level: 'error', spaces: 1, exceptions: ['{', '}'] }
    exceptBrackets:
        bracket_spacing: { level: 'error', spaces: 0, exceptions: ['[', ']'] }
    exceptQuotes:
        bracket_spacing: { level: 'error', spaces: 1, exceptions: ["'", '"'] }

shouldPass = (source, config = {}) ->
    topic: coffeelint.lint(source, config)
    'returns no errors': (errors) ->
        assert.isEmpty(errors)

shouldFail = (source, config, errorMessages = []) ->
    context = {}
    context.topic = coffeelint.lint(source, config)
    context["returns #{errorMessages.length} errors"] = (errors) ->
        assert.equal(errors.length, errorMessages.length)
        for error, index in errors
            assert.equal(error.context, errorMessages[index])
            assert.equal(error.rule, RULE)
    context

RULE = 'bracket_spacing'

vows.describe(RULE).addBatch({

    'disabled by default':
        'with no spaces': shouldPass(sources.sameLine.noSpaces)
        'with one space': shouldPass(sources.sameLine.oneSpace)


    'enabled with spaces set to 0':
        'brackets on their own lines':
            shouldPass(sources.ownLine, configs.zeroSpaces)

        'brackets on the line':
            'no spaces inside both brackets':
                shouldPass(sources.sameLine.noSpaces, configs.zeroSpaces)

            'one space inside on both brackets':
                shouldFail(sources.sameLine.oneSpace,
                           configs.zeroSpaces,
                           ['There should be 0 spaces inside "["',
                            'There should be 0 spaces inside "]"'])

            'two spaces inside on both brackets':
                shouldFail(sources.sameLine.twoSpaces,
                           configs.zeroSpaces,
                           ['There should be 0 spaces inside "["',
                            'There should be 0 spaces inside "]"'])

        'brackets on separate lines':
            'no spaces inside both brackets':
                shouldPass(sources.splitLine.noSpaces, configs.zeroSpaces)

            'one space inside on both brackets':
                shouldFail(sources.splitLine.oneSpace,
                           configs.zeroSpaces,
                           ['There should be 0 spaces inside "["',
                            'There should be 0 spaces inside "]"'])

            'two spaces inside on both brackets':
                shouldFail(sources.splitLine.twoSpaces,
                           configs.zeroSpaces,
                           ['There should be 0 spaces inside "["',
                            'There should be 0 spaces inside "]"'])

        'string interpolation':
            'no spaces inside both braces': ->
                shouldPass(sources.exceptions.stringInterpolation,
                           configs.zeroSpaces)

        except:
            'square brackets':
                shouldPass(sources.exceptions.squareBrackets,
                           configs.exceptBrackets)

    'enabled with spaces set to 1':
        'brackets on their own lines':
            shouldPass(sources.ownLine, configs.oneSpace)

        'brackets on the line':
            'no spaces inside both brackets':
                shouldFail(sources.sameLine.noSpaces,
                           configs.oneSpace,
                           ['There should be 1 space inside "["',
                            'There should be 1 space inside "]"'])

            'one space inside on both brackets':
                shouldPass(sources.sameLine.oneSpace, configs.oneSpace)

            'two spaces inside on both brackets':
                shouldFail(sources.sameLine.twoSpaces,
                           configs.oneSpace,
                           ['There should be 1 space inside "["',
                            'There should be 1 space inside "]"'])

        'brackets on separate lines':
            'no spaces inside both brackets':
                shouldFail(sources.splitLine.noSpaces,
                           configs.oneSpace,
                           ['There should be 1 space inside "["',
                            'There should be 1 space inside "]"'])

            'one space inside on both brackets':
                shouldPass(sources.splitLine.oneSpace, configs.oneSpace)

            'two spaces inside on both brackets':
                shouldFail(sources.splitLine.twoSpaces,
                           configs.oneSpace,
                           ['There should be 1 space inside "["',
                            'There should be 1 space inside "]"'])

        'string interpolation':
            'no spaces inside both braces': ->
                shouldFail(sources.exceptions.stringInterpolation,
                           configs.oneSpace,
                           ['There should be 0 spaces inside "["',
                            'There should be 0 spaces inside "]"'])

        except:
            braces:
                shouldPass(sources.exceptions.objectArray,
                           configs.exceptBraces)

            quotes:
                shouldPass(sources.exceptions.stringInterpolation,
                           configs.exceptQuotes)


    'enabled with empty array spaces set to 0':
        'no spaces inside both brackets':
            shouldPass(sources.emptyArray.noSpaces,
                       configs.zeroEmptyArraySpaces)

        'one space inside on both brackets':
            shouldFail(sources.emptyArray.oneSpace,
                       configs.zeroEmptyArraySpaces,
                       ['There should be 0 spaces inside "["',
                        'There should be 0 spaces inside "]"'])

        'two spaces inside on both brackets':
            shouldFail(sources.emptyArray.twoSpaces,
                       configs.zeroEmptyArraySpaces,
                       ['There should be 0 spaces inside "["',
                        'There should be 0 spaces inside "]"'])


    'enabled with empty array spaces set to 1':
        'no spaces inside both brackets':
            shouldFail(sources.emptyArray.noSpaces,
                       configs.oneEmptyArraySpace,
                       ['There should be 1 space inside "["',
                        'There should be 1 space inside "]"'])

        'one space inside on both brackets':
            shouldPass(sources.emptyArray.oneSpace,
                       configs.oneEmptyArraySpace)

        'two spaces inside on both brackets':
            shouldFail(sources.emptyArray.twoSpaces,
                       configs.oneEmptyArraySpace,
                       ['There should be 1 space inside "["',
                        'There should be 1 space inside "]"'])


    'enabled with mono array spaces set to 0':
        'no spaces inside both braces':
            shouldPass(sources.monoArray.noSpaces,
                       configs.zeroMonoArraySpaces)

        'one space inside on both braces':
            shouldFail(sources.monoArray.oneSpace,
                       configs.zeroMonoArraySpaces,
                       ['There should be 0 spaces inside "["',
                        'There should be 0 spaces inside "]"'])

        'two spaces inside on both braces':
            shouldFail(sources.monoArray.twoSpaces,
                       configs.zeroMonoArraySpaces,
                       ['There should be 0 spaces inside "["',
                        'There should be 0 spaces inside "]"'])


    'enabled with mono array spaces set to 1':
        'no spaces inside both braces':
            shouldFail(sources.monoArray.noSpaces,
                       configs.oneMonoArraySpace,
                       ['There should be 1 space inside "["',
                        'There should be 1 space inside "]"'])

        'one space inside on both braces':
            shouldPass(sources.monoArray.oneSpace,
                       configs.oneMonoArraySpace)

        'two spaces inside on both braces':
            shouldFail(sources.monoArray.twoSpaces,
                       configs.oneMonoArraySpace,
                       ['There should be 1 space inside "["',
                        'There should be 1 space inside "]"'])

}).export(module)
