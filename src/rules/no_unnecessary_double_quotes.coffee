module.exports = class NoUnnecessaryDoubleQuotes

    rule:
        type: 'stylistic_issue'
        name: 'no_unnecessary_double_quotes'
        level: 'ignore'
        message: 'Unnecessary double quotes are forbidden'
        description: '''
            This rule prohibits double quotes unless string interpolation is
            used or the string contains single quotes.
            <pre>
            <code># Double quotes are discouraged:
            foo = "bar"

            # Unless string interpolation is used:
            foo = "#{bar}baz"

            # Or they prevent cumbersome escaping:
            foo = "I'm just following the 'rules'"
            </code>
            </pre>
            Double quotes are permitted by default.
            '''

    constructor: ->
        @regexps = []
        @interpolationLevel = 0
        @inJSX = false
        @JSXCallLevel = 0

    tokens: ['STRING', 'STRING_START', 'STRING_END', 'JSX_TAG', 'CALL_START', 'CALL_END']

    lintToken: (token, tokenApi) ->
        [type, tokenValue] = token

        if type in ['STRING_START', 'STRING_END']
            return @trackInterpolation arguments...

        if type in ['JSX_TAG', 'CALL_START', 'CALL_END']
            return @trackJSX arguments...
        
        isSingleQuote = tokenValue.quote is "'"
        isSingleBlock = tokenValue.quote is "'''"

        if isSingleQuote or isSingleBlock # no double quotes, all OK
            return false

        # When CoffeeScript generates calls to RegExp it double quotes the 2nd
        # parameter. Using peek(2) becuase the peek(1) would be a CALL_END
        if tokenApi.peek(2)?[0] is 'REGEX_END'
            return false

        hasLegalConstructs = @inJSX or @isInInterpolation() or @hasSingleQuote(tokenValue)
        if not hasLegalConstructs
            { token }

    isInInterpolation: () ->
        @interpolationLevel > 0

    trackInterpolation: (token, tokenApi) ->
        if token[0] is 'STRING_START'
            @interpolationLevel += 1
        else if token[0] is 'STRING_END'
            @interpolationLevel -= 1
        # We're not linting, just tracking interpolations.
        null

    trackJSX: (token, tokenApi) ->
        if token[0] is 'JSX_TAG'
            @inJSX = true
        else if token[0] is 'CALL_START'
            if @inJSX then @JSXCallLevel += 1
        else if token[0] is 'CALL_END'
            if @inJSX
                @JSXCallLevel -= 1
                @inJSX = false if @JSXCallLevel is 0
        # We're not linting, just tracking interpolations.
        null

    hasSingleQuote: (tokenValue) ->
        return tokenValue.indexOf("'") isnt -1
