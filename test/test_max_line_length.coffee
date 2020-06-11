path = require 'path'
vows = require 'vows'
assert = require 'assert'
coffeelint = require path.join('..', 'lib', 'coffeelint')

RULE = 'max_line_length'
vows.describe(RULE).addBatch({

    'Maximum line length':
        topic: () ->
            # Every line generated here is a comment.
            line = (length) ->
                return '# ' + new Array(length - 1).join('-')
            lengths = [50, 79, 80, 81, 100, 200]
            (line(l) for l in lengths).join('\n')

        'defaults to 80': (source) ->
            errors = coffeelint.lint(source)
            assert.equal(errors.length, 3)
            error = errors[0]
            assert.equal(error.lineNumber, 4)
            assert.equal(error.message, 'Line exceeds maximum allowed length')
            assert.equal(error.rule, RULE)

        'is configurable': (source) ->
            config =
                max_line_length:
                    value: 99
                    level: 'error'
            errors = coffeelint.lint(source, config)
            assert.equal(errors.length, 2)

        'is optional': (source) ->
            for length in [null, 0, false]
                config =
                    max_line_length:
                        value: length
                        level: 'ignore'
                errors = coffeelint.lint(source, config)
                assert.isEmpty(errors)

        'can ignore comments': (source) ->
            config =
                max_line_length:
                    limitComments: false

            errors = coffeelint.lint(source, config)
            assert.isEmpty(errors)

        'respects Windows line breaks': ->
            source = new Array(81).join('X') + '\r\n'

            errors = coffeelint.lint(source, {})
            assert.isEmpty(errors)

    'Literate Line Length':
        topic: ->
            # This creates a line with 80 Xs.
            source = new Array(81).join('X') + '\n'

            # Long URLs are ignored by default even in Literate code.
            source += 'http://testing.example.com/really-really-long-url-' +
                'that-shouldnt-have-to-be-split-to-avoid-the-lint-error'

        'long urls are ignored': (source) ->
            errors = coffeelint.lint(source, {}, true)
            assert.isEmpty(errors)

    'Maximum length exceptions':
        topic:
            '''
            # Since the line length check only reads lines in isolation it will
            # see the following line as a comment even though it's in a string.
            # I don't think that's a problem.
            #
            # http://testing.example.com/really-really-long-url-that-shouldnt-have-to-be-split-to-avoid-the-lint-error
            '''

        'excludes long urls': (source) ->
            errors = coffeelint.lint(source)
            assert.isEmpty(errors)

    'Indented comment':
        topic: ->
            # This test text should never generate an error on the URL
            # line. Instead, it should only report an error on line 2,
            # unless errors are desactivated in comments.
            # These tests work with the default line length limit of 80
            # chars and the default indent size of 2.
            text = '''
            class Test
              # Lorem ipsum dolor sit amet, consectetur adipiscing elit.
              # @see https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/fetch fetch API on mozdev
              request: (opts) ->
                doSomething()
            '''
            text_lines = text.split('\n')
            # Artificially augment the second line. We do that this way
            # to avoid a lint error in this project itself when reading
            # the text above, as the project config doesn't allow long
            # line in comments.
            text_lines[1] += ' Cras porta lacinia elementum.'
            text_lines.join('\n')

        'report error in comment by default, but ignore url': (source) ->
            errors = coffeelint.lint(source)
            assert.equal(errors.length, 1)
            assert.equal(errors[0].lineNumber, 2)

        'can ignore comments': (source) ->
            config =
                max_line_length:
                    limitComments: false

            errors = coffeelint.lint(source, config)
            assert.isEmpty(errors)

}).export(module)
