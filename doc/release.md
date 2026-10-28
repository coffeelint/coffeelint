Release Steps
=============

Releases are automated with [semantic-release](https://semantic-release.org/).
Every push to `master` runs the `Release` job in `.github/workflows/test.yml`,
which uses the [Conventional Commits](https://www.conventionalcommits.org/)
messages since the last release to decide the next version:

* `fix:` → patch release
* `feat:` → minor release
* `BREAKING CHANGE:` in the commit body → major release
* other types (`chore:`, `ci:`, `docs:`, ...) → no release

The job then:

1. Updates `CHANGELOG.md` and the version in `package.json`.
2. Publishes to npm using trusted publishing (OIDC), with provenance.
3. Creates a GitHub release and comments on released issues and pull requests.
4. Commits `CHANGELOG.md`, `package.json` and `package-lock.json` back to
   `master` as `chore(release): x.y.z [skip ci]`.
5. Triggers a rebuild of [coffeelint.github.io](https://coffeelint.github.io/)
   with the new version.

The plugins are configured in `.releaserc.yml`.
