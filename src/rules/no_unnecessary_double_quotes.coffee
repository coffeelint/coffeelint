module.exports = class NoUnnecessaryDoubleQuotes

    rule:
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
        @inCSX = false
        @CSXCallLevel = 0

    tokens: ['STRING', 'STRING_START', 'STRING_END', 'CSX_TAG', 'CALL_START', 'CALL_END']

    lintToken: (token, tokenApi) ->
        [type, tokenValue] = token

        if type in ['STRING_START', 'STRING_END']
            return @trackInterpolation arguments...

        if type in ['CSX_TAG', 'CALL_START', 'CALL_END']
            return @trackCSX arguments...

        stringValue = tokenValue.match(/^\"(.*)\"$/)

        return false unless stringValue # no double quotes, all OK

        # When CoffeeScript generates calls to RegExp it double quotes the 2nd
        # parameter. Using peek(2) becuase the peek(1) would be a CALL_END
        if tokenApi.peek(2)?[0] is 'REGEX_END'
            return false

        hasLegalConstructs = @inCSX or @isInInterpolation() or @hasSingleQuote(tokenValue)
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

    trackCSX: (token, tokenApi) ->
        if token[0] is 'CSX_TAG'
            @inCSX = true
        else if token[0] is 'CALL_START'
            if @inCSX then @CSXCallLevel += 1
        else if token[0] is 'CALL_END'
            if @inCSX
                @CSXCallLevel -= 1
                @inCSX = false if @CSXCallLevel is 0
        # We're not linting, just tracking interpolations.
        null

    hasSingleQuote: (tokenValue) ->
        return tokenValue.indexOf("'") isnt -1
