module.exports = class NoImplicitParens

    rule:
        type: 'style'
        name: 'no_implicit_parens'
        level: 'ignore'
        message: 'Implicit parens are forbidden'
        strict: true
        description: '''
            This rule prohibits implicit parens on function calls.
            <pre>
            <code># Some folks don't like this style of coding.
            myFunction a, b, c

            # And would rather it always be written like this:
            myFunction(a, b, c)
            </code>
            </pre>
            Implicit parens are permitted by default, since their use is
            idiomatic CoffeeScript.
            '''


    tokens: ['CALL_END']

    lintToken: (token, tokenApi) ->
        if token.generated
            unless tokenApi.config[@rule.name].strict is false
                return { token }
            else
                # If strict mode is turned off it allows implicit parens when
                # the expression is spread over multiple lines.
                i = -1
                loop
                    t = tokenApi.peek(i)
                    sameLine = t[2].first_line is token[2].first_line
                    genCallStart = t[0] is 'CALL_START' and t.generated

                    if not t? or genCallStart and sameLine
                        return { token: t or token }

                    # If we have not found a CALL_START token that is generated,
                    # and we've moved into a new line, this is fine and should
                    # just return.
                    if not sameLine
                        return null

                    i -= 1
