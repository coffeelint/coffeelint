module.exports = class SpacingAfterComma
    rule:
        name: 'spacing_after_comma'
        level: 'ignore'
        ignore_elision: false
        message: 'a space is required after commas'
        description: '''
            This rule checks to make sure you have a space after commas.
            Consecutive commas are allowed when skipping array elements
            if "ignore_elision" is true.
            <pre><code>
            # ignore_elision: true
            [,, c,, e, f] = [1, 2, 3, 4, 5, 6]
            </code></pre>
            '''

    tokens: [',', 'REGEX_START', 'REGEX_END']

    constructor: ->
        @inRegex = false

    lintToken: (token, tokenApi) ->
        [type] = token

        if type is 'REGEX_START'
            @inRegex = true
            return
        if type is 'REGEX_END'
            @inRegex = false
            return

        { ignore_elision } = tokenApi.config[@rule.name]
        return null if ignore_elision and ',' in tokenApi.peek(1)

        unless token.spaced or token.newLine or @isGenerated(token, tokenApi) or
                @isRegexFlag(token, tokenApi)
            return { token }

    # Coffeescript does some code generation when using JSX syntax, and it adds
    # brackets & commas that are not marked as generated. The only way to check
    # these is to see if the comma has the same column number as the last token.
    isGenerated: (token, tokenApi) ->
        return true if token.generated
        offset = -1
        prevToken = tokenApi.peek(offset)
        while prevToken.generated
            offset -= 1
            prevToken = tokenApi.peek(offset)
        pos = token[2]
        prevPos = prevToken[2]
        if pos.first_line == prevPos.first_line and
               pos.first_column == prevPos.first_column
            return true

        return false

    # When generating a regex (///${whatever}///i) CoffeeScript generates tokens
    # for RegEx(whatever, "i") but doesn't bother to mark that comma as
    # generated or spaced. Looking 3 tokens ahead skips the STRING and CALL_END
    isRegexFlag: (token, tokenApi) ->
        return false unless @inRegex

        maybeEnd = tokenApi.peek(3)
        return maybeEnd?[0] is 'REGEX_END'
