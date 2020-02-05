Release Steps
=============

1. Review changelog
-------------------

I always use the "Latest Changes" changelog link on
[coffeelint.github.io](https://coffeelint.github.io/#changelog) and change it
to point to `compare/vx.x.x...master`. Look through the pull request to figure
out whether this is a minor or patch release.

2. Tag
------

CoffeeLint follows [semver](https://semver.org/). When a new rule is added even
if it's off by default, it's at least a minor release.

    npm version <major|minor|patch>

3. Write changelog
------------------

The changelog is in `scripts/index-bottom.html` on
[`coffeelint/coffeelint.github.io`](https://github.com/coffeelint/coffeelint.github.io).
Update it based on the PRs found in step 1. I don't always mention every PR. Many internal
changes like updates to Travis don't matter to users of CoffeeLint, so I leave them out.

4. Update `coffeelint/coffeelint.github.io`
--------------------------------

    npm run compile

This updates `js/coffeelint.js`, `js/coffeescript.js`, and `index.html`

5. Release all the things!
--------------------------

    git push --follow-tags
    npm publish

I think it's important that people be able to install CoffeeLint directly from
git.
