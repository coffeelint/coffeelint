module.exports = class ObjectShorthand
    rule:
        type: 'stylistic_issue'
        name: 'object_shorthand'
        level: 'ignore'
        message: 'Use property-value shorthand when using explicit braces'
        description: '''
        <p>Use property value shorthand in objects, when explicit braces are used.</p>
        <pre><code>test = "value"

        # Good
        {test}
        test: test

        # Bad
        {test: test}
        </code></pre>
        '''

    tokens: [':']

    lintToken: (token, tokenApi) ->
        checkExplicit = ->
            current = -2
            while tokenApi.peek(current)[0] isnt '{'
                current--

            return not tokenApi.peek(current).generated

        # Get the property name and the value
        property = tokenApi.peek -1
        value = tokenApi.peek 1

        # Check if we have explicit {}
        explicit = checkExplicit()

        if explicit and property[1] is value[1]
            context: "Use '{#{property[1]}}'"
        else
            null
