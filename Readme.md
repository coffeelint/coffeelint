CoffeeLint
CoffeeLint is a style checker that helps keep CoffeeScript code clean and consistent.

For guides on installing, using and configuring CoffeeLint, head over here.

To suggest a feature, report a bug, or general discussion, head over here.

Team
Current:

https://github.com/orgs/coffeelint/people
Past:

Shuan Wang
Asa Ayers
Matt Perpick
Contributing
New rules should be set to a warn level. Developers will expect new changes to NOT break their existing workflow, so unless your change is extremely usefull, default to warn. Expect discussion if you choose to use error.

Look at existing rules and test structures when deciding how to name your rule. no_foo.coffee is used for many tests designed to catch specific errors, whereas foo.coffee is used for tests that are designed to enforce formatting and syntax.

Steps
Fork the repo locally.
Run npm install to get dependencies.
Create your rule in a single file as src/rules/your_rule_here.coffee, using the existing rules as a guide. You may examine the AST and tokens using https://asaayers.github.io/clfiddle/.
Add your test file my_test.coffee to the test directory.
Register your rule in src/coffeelint.coffee.
Run your test using npm run testrule test/your_test_here.coffee.
Run the whole tests suite using npm test.
Submit a pull request.
Github Actions

Updating documentation when adding a new rule
When adding a new rule, its documentation is specified by setting a description property within its rule property:

module.exports = class NoComment

    rule:
        name: 'no_comment'
        level: 'ignore'
        message: 'No comment'
        description: '''
            Disallows any comment in the code
            '''

    tokens: ['#', '###']

    lintToken : (token, tokenApi) ->
		return {context: "Found '#{token[0]}'"}
The description property is a string that can embed HTML code:

description: '''
	Disallows any comment in the code. This code would not pass:
	<pre>
	<code>### Some code with comments
	foo = ->
		# some other comments
		bar()
	</code>
	</pre>
	'''
Coffeelint's website generates each rule's documentation based on this description property.
