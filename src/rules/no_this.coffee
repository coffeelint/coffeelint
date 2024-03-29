module.exports = class NoThis

    rule:
        type: 'style'
        name: 'no_this'
        level: 'ignore'
        message: "Don't use 'this', use '@' instead"
        description: '''
            This rule prohibits 'this'.
            Use '@' instead.
            '''

    tokens: ['THIS']

    lintToken: (token, tokenApi) ->
        { config: { no_stand_alone_at: { level } } } = tokenApi
        nextToken = tokenApi.peek(1)?[0]

        { token } unless level isnt 'ignore' and nextToken isnt '.'
