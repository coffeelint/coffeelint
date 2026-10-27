regexes =
    literateComment: ///
        ^\s*\#\s # indentation, up to comment followed by at least one space.
    ///
    url: /http[^\s]+/

module.exports = class MaxLineLength

    rule:
        type: 'style'
        name: 'max_line_length'
        value: 80
        level: 'error'
        limitComments: true
        message: 'Line exceeds maximum allowed length'
        description: '''
            This rule imposes a maximum line length on your code. <a
            href="https://www.python.org/dev/peps/pep-0008/">Python's style
            guide</a> does a good job explaining why you might want to limit the
            length of your lines, though this is a matter of taste.

            Lines can be no longer than eighty characters by default.
            '''

    lintLine: (line, lineApi) ->
        max = lineApi.config[@rule.name]?.value
        limitComments = lineApi.config[@rule.name]?.limitComments
        isLineComment = regexes.literateComment.test(line)

        lineLength = line.replace(/\s+$/, '').length
        if lineApi.isLiterate() and isLineComment
            lineLength -= 2

        if max and max < lineLength
            isCommentLine = isLineComment or lineApi.isBlockCommentLine()

            if isCommentLine and regexes.url.test(line)
                return

            unless limitComments
                if isCommentLine
                    return

            return {
                columnNumber: max
                context: "Length is #{lineLength}, max is #{max}"
            }
