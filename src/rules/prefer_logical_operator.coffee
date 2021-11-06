module.exports = class PreferLogicalOperator

    rule:
        type: 'style'
        name: 'prefer_logical_operator'
        level: 'ignore'
        message: 'Don\'t use is, isnt, not, and, or, yes, on, no, off'
        doubleNotLevel: 'ignore'
        description: '''
            This rule prohibits is, isnt, not, and, or, yes, on, no, off.
            Use ==, !=, !, &&, ||, true, false instead.
            '''

    tokens: ['COMPARE', 'UNARY', 'BOOL', 'COMPOUND_ASSIGN', '&&', '||']

    lintToken: (token, tokenApi) ->
        # Compare the actual token with the lexed token.
        { first_column, last_column } = token[2]
        line = tokenApi.lines[tokenApi.lineNumber]
        actual_token = line[first_column..last_column]

        if token[0] is 'COMPOUND_ASSIGN' and actual_token in ['or=', 'and=']
            actual_token = token.origin[1]

        context =
            switch actual_token
                when 'is' then 'Replace "is" with "=="'
                when 'isnt' then 'Replace "isnt" with "!="'
                when 'or' then 'Replace "or" with "||"'
                when 'and' then 'Replace "and" with "&&"'
                when 'not' then 'Replace "not" with "!"'
                when 'yes' then 'Replace "yes" with true'
                when 'on' then 'Replace "on" with true'
                when 'off' then 'Replace "off" with false'
                when 'no' then 'Replace "no" with false'
                else undefined

        if context?
            { token, context }
