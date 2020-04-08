module.exports = class NewlinesAfterClasses

    rule:
        name: 'newlines_after_classes'
        value: 3
        level: 'ignore'
        message: 'Wrong count of blank lines between a class and other code'
        description: '''
            <p>Checks the number of blank lines between classes and other code.</p>

            Options:
            - <pre><code>value</code></pre> - The number of required blank lines
            after class definitions. Defaults to 3.
            '''

    tokens: ['CLASS', '}', '{']

    classBracesCount: 0
    classCount: 0

    lintToken: (token, tokenApi) ->
        [type, numIndents, { first_line: lineNumber }] = token
        { lines } = tokenApi

        ending = tokenApi.config[@rule.name].value
        if type is 'CLASS'
            @classCount++

        if @classCount > 0 and token.generated?
            if type is '{' and token.origin?[0] is ':'
                @classBracesCount++

            if type is '}' and token.origin?[0] is 'OUTDENT'
                @classBracesCount--
                @classCount--
                if @classCount is 0 and @classBracesCount is 0
                    afters = 1
                    comment = 0
                    outdent = token.origin[2].first_line
                    start = Math.min(lineNumber, outdent)
                    trueLine = start + 1

                    while (/^\s*(#|$)/.test(lines[start + afters]))
                        if /^\s*#/.test(lines[start + afters])
                            comment += 1
                        afters += 1

                    # add up blank lines, subtract comments, subtract 2 because
                    # before/after counters started at 1.
                    got = afters - comment - 1

                    # if `got` and `ending` don't match throw an error _unless_
                    # we are at the end of the file.
                    if got isnt ending and trueLine + got isnt lines.length
                        return {
                            context: "Expected #{ending} got #{got}"
                            lineNumber: trueLine
                        }
