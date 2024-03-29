module.exports = class CyclomaticComplexity

    rule:
        type: 'problem'
        name: 'cyclomatic_complexity'
        level: 'ignore'
        message: 'The cyclomatic complexity is too damn high'
        value: 10
        description: '''
            Examine the complexity of your function.
            '''

    # returns the "complexity" value of the current node.
    getComplexity: (node) ->
        name = @astApi.getNodeName node
        complexity = if name in ['If', 'While', 'For', 'Try']
            1
        else if name is 'Op' and node.operator in ['&&', '||']
            1
        else if name is 'Switch'
            node.cases.length
        else
            0
        return complexity

    lintAST: (node, @astApi) ->
        @lintNode node
        undefined

    # Lint the AST node and return its cyclomatic complexity.
    lintNode: (node) ->
        # Get the complexity of the current node.
        name = @astApi?.getNodeName node
        complexity = @getComplexity(node)

        # Add the complexity of all child's nodes to this one.
        node.eachChild (childNode) =>
            childComplexity = @lintNode(childNode)
            if @astApi?.getNodeName(childNode) isnt 'Code'
                complexity += childComplexity

        rule = @astApi.config[@rule.name]

        # If the current node is a function, and it's over our limit, add an
        # error to the list.
        if name is 'Code' and complexity >= rule.value
            error = @astApi.createError {
                context: complexity + 1
                lineNumber: node.locationData.first_line + 1
                lineNumberEnd: node.locationData.last_line + 1
                columnNumber: node.locationData.first_column + 1
                columnNumberEnd: node.locationData.last_column + 1
            }
            @errors.push error if error

        # Return the complexity for the benefit of parent nodes.
        return complexity
