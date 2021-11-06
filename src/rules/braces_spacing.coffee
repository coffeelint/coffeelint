module.exports = class BracesSpacing

    rule:
        type: 'stylistic_issue'
        name: 'braces_spacing'
        level: 'ignore'
        spaces: 0
        empty_object_spaces: 0
        message: 'Curly braces must have the proper spacing'
        description: '''
            This rule checks to see that there is the proper spacing inside
            curly braces. The spacing amount is specified by "spaces".
            The spacing amount for empty objects is specified by
            "empty_object_spaces".
            The spacing amount for objects containing a single item is
            specified by "mono_object_spaces".
            <pre><code>
            # Spaces is 0
            {a: b}     # Good
            {a: b }    # Bad
            { a: b}    # Bad
            { a: b }   # Bad
            # Spaces is 1
            {a: b}     # Bad
            {a: b }    # Bad
            { a: b}    # Bad
            { a: b }   # Good
            { a: b  }  # Bad
            {  a: b }  # Bad
            {  a: b  } # Bad
            # Empty Object Spaces is 0
            {}         # Good
            { }        # Bad
            # Empty Object Spaces is 1
            {}         # Bad
            { }        # Good
            # Mono Object Spaces is 0
            {a}        # Good
            { a }      # Bad
            # Mono Object Spaces is 1
            {a}        # Bad
            { a }      # Good
            </code></pre>
            This rule is disabled by default.
            '''

    tokens: ['{', '}']

    distanceBetweenTokens: (firstToken, secondToken) ->
        secondToken[2].first_column - firstToken[2].last_column - 1

    findNearestToken: (token, tokenApi, difference) ->
        totalDifference = 0
        loop
            totalDifference += difference
            nearestToken = tokenApi.peek(totalDifference)
            continue if nearestToken?[0] is 'OUTDENT' or nearestToken?.generated?
            return nearestToken

    tokensOnSameLine: (firstToken, secondToken) ->
        firstToken[2].first_line is secondToken[2].first_line

    tokenSetsMatch: (a, b) -> JSON.stringify(a) is JSON.stringify b

    getExpectedSpaces: (tokenApi, tokens) ->
        config = tokenApi.config[@rule.name]
        mono = [ 'IDENTIFIER', @tokens...]
        tokens = tokens
            .map (token) -> token?[0]
            .filter (token) -> token in mono

        if @tokenSetsMatch tokens[0..1], @tokens
            config.empty_object_spaces ? config.spaces
        else if @tokenSetsMatch mono, tokens.sort()
            config.mono_object_spaces ? config.spaces
        else
            config.spaces

    lintToken: (token, tokenApi) ->
        return null if token.generated

        [firstToken, secondToken] = tokens = if token[0] is '{'
            [token, @findNearestToken(token, tokenApi, 1),
                    @findNearestToken(token, tokenApi, 2)]
        else
            [@findNearestToken(token, tokenApi, -1), token,
             @findNearestToken(token, tokenApi, -2)]

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
