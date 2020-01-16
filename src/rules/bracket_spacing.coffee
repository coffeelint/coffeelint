module.exports = class BracketSpacing

    rule:
        name: 'bracket_spacing'
        level: 'ignore'
        spaces: 0
        empty_array_spaces: 0
        exceptions: []
        message: 'Square brackets must have the proper spacing'
        description: '''
            This rule checks to see that there is the proper spacing inside
            square brackets. The spacing amount is specified by "spaces".
            The spacing amount for empty arrays is specified by
            "empty_array_spaces".
            The spacing amount for arrays containing a single item is
            specified by "mono_array_spaces".
            Specified characters will be ignored if listed in "exceptions".
            <pre><code>
            # Spaces is 0
            [a, b]     # Good
            [a, b ]    # Bad
            [ a, b]    # Bad
            [ a, b ]   # Bad
            # Except brackets
            [ [a, b] ] # Good
            [[ a, b ]] # Bad
            # Spaces is 1
            [a, b]     # Bad
            [a, b ]    # Bad
            [ a, b]    # Bad
            [ a, b ]   # Good
            [ a, b  ]  # Bad
            [  a, b ]  # Bad
            [  a, b  ] # Bad
            # Except braces
            [{ a: b }] # Good
            [ {a: b} ] # Bad
            # Empty Array Spaces is 0
            []         # Good
            [ ]        # Bad
            # Empty Array Spaces is 1
            []         # Bad
            [ ]        # Good
            # Mono Array Spaces is 0
            [a]        # Good
            [ a ]      # Bad
            # Mono Array Spaces is 1
            [a]        # Bad
            [ a ]      # Good
            </code></pre>
            This rule is disabled by default.
            '''

    tokens: ['[', ']']

    distanceBetweenTokens: (firstToken, secondToken) ->
        secondToken[2].first_column - firstToken[2].last_column - 1

    findNearestToken: (token, tokenApi, difference) ->
        totalDifference = 0
        loop
            totalDifference += difference
            nearestToken = tokenApi.peek(totalDifference)
            # Render quotes for string interpolation.
            nearestToken[1] = '"' if nearestToken?[0].startsWith 'STRING_'
            continue if nearestToken?[0] is 'OUTDENT' or nearestToken?.generated?
            return nearestToken

    tokensOnSameLine: (firstToken, secondToken) ->
        firstToken[2].first_line is secondToken[2].first_line

    escape: (string) -> string.replace /[.*+?^${}()|[\]\\]/g, '\\$&'

    getExpectedSpaces: (tokenApi, tokens) ->
        config = tokenApi.config[@rule.name]
        except = @escape config.exceptions.join ''
        pattern = tokens
            .map (token) -> token?[1]
            .join ''

        switch
            when except and ///^\[[#{except}]|[#{except}]\]$///.test pattern
                if config.spaces then 0 else 1
            when pattern.includes '[]'
                config.empty_array_spaces ? config.spaces
            when /\[\w+\]/.test pattern
                config.mono_array_spaces ? config.spaces
            else
                config.spaces

    lintToken: (token, tokenApi) ->
        return null if token.generated

        tokens = if token[0] is @tokens[0]
            firstToken = token
            secondToken = @findNearestToken token, tokenApi, 1
            [firstToken, secondToken, @findNearestToken(token, tokenApi, 2)]
        else
            firstToken = @findNearestToken token, tokenApi, -1
            secondToken = token
            [@findNearestToken(token, tokenApi, -2), firstToken, secondToken]

        return null unless @tokensOnSameLine firstToken, secondToken

        expected = @getExpectedSpaces tokenApi, tokens
        actual = @distanceBetweenTokens firstToken, secondToken

        if actual is expected
            null
        else
            msg = "There should be #{expected} space"
            msg += 's' unless expected is 1
            msg += " inside \"#{token[0]}\""
            { token, context: msg }
