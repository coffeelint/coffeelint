 CoffeeLint
==========

CoffeeLint is a style checker that helps keep CoffeeScript code
clean and consistent.

For guides on installing, using and configuring CoffeeLint, head over
[here](https://coffeelint.github.io/).

To suggest a feature, report a bug, or general discussion, head over
[here](https://github.com/coffeelint/coffeelint/issues/).

## Team

Current:

- https://github.com/orgs/coffeelint/people

Past:

- [Shuan Wang](https://github.com/swang)
- [Asa Ayers](https://github.com/AsaAyers)
- [Matt Perpick](https://github.com/clutchski)

## Contributing

* New rules should be set to a `warn` level. Developers will expect new changes to NOT break their existing workflow, so unless your change is extremely usefull, default to `warn`. Expect discussion if you choose to use `error`.

* Look at existing rules and test structures when deciding how to name your rule. `no_foo.coffee` is used for many tests designed to catch specific errors, whereas `foo.coffee` is used for tests that are designed to enforce formatting and syntax.

### Steps

1. Fork the repo locally.
2. Run `npm install` to get dependencies.
3. Create your rule in a single file as `src/rules/your_rule_here.coffee`, using the existing
   rules as a guide. You may examine the AST and tokens using https://asaayers.github.io/clfiddle/.
4. Add your test file `my_test.coffee` to the `test` directory.
5. Register your rule in `src/coffeelint.coffee`.
6. Run your test using `npm run testrule test/your_test_here.coffee`.
7. Run the whole tests suite using `npm test`.
8. Submit a pull request.

[![Github Actions](https://github.com/coffeelint/coffeelint/workflows/CI/badge.svg?branch=master)](https://github.com/coffeelint/coffeelint/actions)

### Updating documentation when adding a new rule

When adding a new rule, its documentation is specified by setting a
`description` property within its `rule` property:
```coffeescript
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
```

The description property is a string that can embed HTML code:
```html
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
```
[Coffeelint's website](https://coffeelint.github.io/) generates each
rule's documentation based on this `description` property.
