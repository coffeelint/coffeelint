regexes =
    literateComment: ///
        ^\s*\#\s # indentation, up to comment followed by at least one space.
    ///
    longUrlComment: ///
      ^\s*\#\s # indentation, up to comment followed by at least one space.
      .* # Any string may precedes url
      http[^\s]+ # Actual link
      .*$ # Line may end by other things
    ///

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
        isCommentLine = regexes.literateComment.test(line)

        lineLength = line.replace(/\s+$/, '').length
        if lineApi.isLiterate() and isCommentLine
            lineLength -= 2

        if max and max < lineLength and not regexes.longUrlComment.test(line)

            unless limitComments
                if isCommentLine
                    return

            return {
                columnNumber: max
                context: "Length is #{lineLength}, max is #{max}"
            }
