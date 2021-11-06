indentationRegex = /\S/

module.exports = class NoTabs

    rule:
        type: 'style'
        name: 'no_tabs'
        level: 'error'
        message: 'Line contains tab indentation'
        description: '''
            This rule forbids tabs in indentation. Enough said. It is enabled by
            default.
            '''

    lintLine: (line, lineApi) ->
        # Only check lines that have compiled tokens. This helps
        # us ignore tabs in the middle of multi line strings, heredocs, etc.
        # since they are all reduced to a single token whose line number
        # is the start of the expression.
        indentation = line.split(indentationRegex)[0]
        if lineApi.lineHasToken() and '\t' in indentation
            { columnNumber: indentation.indexOf('\t') }
        else if lineApi.lineHasToken() and line.match(/\t *$/)
            { columnNumber: indentation.indexOf('\t') }
        else
            null
