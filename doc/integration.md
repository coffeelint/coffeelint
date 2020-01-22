This file is for anyone working on integrating CoffeeLint with another project.

What kinds of things can I build?
=================================

CoffeeLint is [exposed as a library](https://coffeelint.github.io/#api) that you
could use in build tools, or in the browser. Anywhere you can run Javascript.
You can also build [your own rules](https://coffeelint.github.io/#api), or custom reporter.

CoffeeLint is also a command line tool, so most non-javascript integrations run
that and parse the output. There are built in reporters for `csv`, `jslint`,
`checkstyle`, and `raw`.

Which version of CoffeeLint should I depend on?
===============================================

CoffeeLint follows [Semantic Versioning](https://semver.org), so any breaking change to the
API will be a major version change. I recommend depending on `^1.x` where x is
the current version.

How do I list my editor/build plugin on coffeelint.org?
=======================================================

Coffeelint.github.io uses
[coffeelint/coffeelint.github.io](https://github.com/coffeelint/coffeelint.github.io),
just send a pull request with your addition and it'll get reviewed. The list of
plugins is in `index-bottom.html`. `npm run compile` will regenerate `index.html`
with your changes.

How can people find my rule?
============================

All rules need to include the `coffeelintrule`. Coffeelint.github.io directs users to
<https://www.npmjs.org/search?q=coffeelintrule> to locate available
rules.

Does my rule need to be built into CoffeeLint?
==============================================

Built in rules use the same APIs as 3rd party rules. The only benefit of built
in rules is that they get included with CoffeeLint and are exposed to a wider
audience. If the rule mimics a rule in eslint then it can be added to the built
in rules.

Most new rules are set to `ignore` by default. My general guide line
is that if you can demonstrate the rule prevents a type of error it can be
`warn` or `error` by default. I think `no_debugger` is a good example of such a
rule.
