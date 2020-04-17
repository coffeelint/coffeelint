<div> <h3 class="changelog_header">v3.2.0</h3> <small
          class="changelog_date">- <a
          href="https://github.com/coffeelint/coffeelint/compare/v3.1.3...v3.2.0">2020.04.10<a></a></small>
          <p>
              Add prefer_fat_arrows_in_methods rule.
          </p>
          <ul class="changelog_history">
            <li>Fix last line comment trailing semicolon
                <a href="https://github.com/coffeelint/coffeelint/pull/55">#55</a></li>
            <li>Add prefer_fat_arrows_in_methods rule
                <a href="https://github.com/coffeelint/coffeelint/pull/15">#15</a></li>
          </ul>
          </div>

          <div> <h3 class="changelog_header">v3.1.3</h3> <small
          class="changelog_date">- <a
          href="https://github.com/coffeelint/coffeelint/compare/v3.1.2...v3.1.3">2020.04.08<a></a></small>
          <p>
              Fix newlines_after_classes when there are blank lines before last line in class.
          </p>
          <ul class="changelog_history">
            <li>Fix newlines_after_classes
                <a href="https://github.com/coffeelint/coffeelint/pull/52">#52</a></li>
            <li>Remove relics from coffeescript &lt;= v1.10.0
                <a href="https://github.com/coffeelint/coffeelint/pull/53">#53</a></li>
          </ul>
          </div>

          <div> <h3 class="changelog_header">v3.1.2</h3> <small
          class="changelog_date">- <a
          href="https://github.com/coffeelint/coffeelint/compare/v3.1.1...v3.1.2">2020.04.05<a></a></small>
          <p>
              Update coffeescript dependency to v2.5.1.
          </p>
          <ul class="changelog_history">
            <li>Update coffeescript dependency.
                <a href="https://github.com/coffeelint/coffeelint/pull/50">#50</a></li>
          </ul>
          </div>

          <div> <h3 class="changelog_header">v3.1.1</h3> <small
          class="changelog_date">- <a
          href="https://github.com/coffeelint/coffeelint/compare/v3.1.0...v3.1.1">2020.03.22<a></a></small>
          <p>
              Update commandline dependency to maintained dependency.
          </p>
          <ul class="changelog_history">
            <li>Replace optimist with yargs.
                <a href="https://github.com/coffeelint/coffeelint/pull/46">#46</a></li>
          </ul>
          </div>

          <div> <h3 class="changelog_header">v1.16.2</h3> <small
          class="changelog_date">- <a
          href="https://github.com/coffeelint/coffeelint/compare/v1.16.1...v1.16.2">2020.02.06<a></a></small>
          <p>
              First 1.x release under new npm package; to use: `npm install -g @coffeelint/cli@old`
          </p>
          <ul class="changelog_history">
            <li>Don’t unnecessarily print “context:” at the end of some error messages
                <a href="https://github.com/coffeelint/coffeelint/pull/42">#42</a></li>
          </ul>
          </div>

          <div> <h3 class="changelog_header">v3.1.0</h3> <small
          class="changelog_date">- <a
          href="https://github.com/coffeelint/coffeelint/compare/v3.0.2...v3.1.0">2020.02.06<a></a></small>
          <p>
              Added a few rules and rules options. More bug fixes and internal updates to make developing easier.
              We got through the backlog of pull requests. Now on to the issues...
          </p>
          <ul class="changelog_history">
            <li>Add `prefer_logical_operator` rule.
                <a href="https://github.com/coffeelint/coffeelint/pull/13">#13</a></li>
            <li>Add `missing_parseint_radix` rule.
                <a href="https://github.com/coffeelint/coffeelint/pull/17">#17</a></li>
            <li>Add `bracket_spacing` rule.
                <a href="https://github.com/coffeelint/coffeelint/pull/26">#26</a></li>
            <li>`space_operators`: add `default_parameters` option.
                <a href="https://github.com/coffeelint/coffeelint/pull/16">#16</a></li>
            <li>`colon_assignment_spacing`: add `min_left` and `min_right` option.
                <a href="https://github.com/coffeelint/coffeelint/pull/22">#22</a></li>
            <li>`spacing_after_comma`: add `ignore_elision` option.
                <a href="https://github.com/coffeelint/coffeelint/pull/34">#34</a></li>
            <li>`braces_spacing`: add `mono_object_spaces` option.
                <a href="https://github.com/coffeelint/coffeelint/pull/17">#17</a></li>
            <li>Properly double quote fields in `csv` reporter.
                <a href="https://github.com/coffeelint/coffeelint/pull/14">#14</a></li>
            <li>Stop printing empty context in `checkstyle` reporter.
                <a href="https://github.com/coffeelint/coffeelint/pull/12">#12</a></li>
            <li>`no_tabs` rejects tabs at the end of the line.
                <a href="https://github.com/coffeelint/coffeelint/pull/20">#20</a></li>
            <li>Prevent endless loop if lineNumber is negative.
                <a href="https://github.com/coffeelint/coffeelint/pull/10">#10</a></li>
            <li>Update dependency `resolve` to v1.15.1</li>
          </ul>
          </div>

          <div> <h3 class="changelog_header">v3.0.2</h3> <small
          class="changelog_date">- <a
          href="https://github.com/coffeelint/coffeelint/compare/v3.0.1...v3.0.2">2020.01.22<a></a></small>
          <p>
              small fixes
          </p>
          <ul class="changelog_history">
            <li>Bugfix for error message when a config file cannot be found.
                <a href="https://github.com/coffeelint/coffeelint/pull/38">#38</a></li>
            <li>Update dependency `resolve` to v1.15.0</li>
            <li>Update documentation</li>
          </ul>
          </div>

          <div> <h3 class="changelog_header">v3.0.1</h3> <small
          class="changelog_date">- <a
          href="https://github.com/coffeelint/coffeelint/compare/v3.0.0...v3.0.1">2020.01.22<a></a></small>
          <p>
              CoffeeLint has a new webpage at
              <a href="https://coffeelint.github.io">https://coffeelint.github.io</a>
            </p>
          <ul class="changelog_history">
            <li>Update dependencies and clean up documentation</li>
          </ul>
          </div>

          <div> <h3 class="changelog_header">v3.0.0</h3> <small
          class="changelog_date">- <a
          href="https://github.com/coffeelint/coffeelint/compare/v2.1.0...v3.0.0">2020.01.14<a></a></small>
          <p>
              CoffeeLint has a new home at
              <a href="https://github.com/coffeelint/coffeelint">https://github.com/coffeelint/coffeelint</a>
              and a new npm package <a href="https://www.npmjs.com/package/@coffeelint/cli">@coffeelint/cli</a>.
            </p>
          <ul class="changelog_history">
            <li>Bugfix for error message when an unknown level is used.
                <a href="https://github.com/coffeelint/coffeelint/pull/4">#4</a></li>
            <li>Bugfix for error <tt>duplicate_key</tt> when keys are wrapped in quotes.
                <a href="https://github.com/coffeelint/coffeelint/pull/6">#6</a></li>
            <li>Add <tt>no_spaces</tt> rule to disallow spaces for indentation.
                <a href="https://github.com/coffeelint/coffeelint/pull/7">#7</a></li>
            <li>Several enhancements, including CJSX fixes.
                <a href="https://github.com/coffeelint/coffeelint/pull/8">#8</a></li>
            <li>Add rule name to default reporter.
                <a href="https://github.com/coffeelint/coffeelint/pull/11">#11</a></li>
          </ul>
          </div>

          <div> <h3 class="changelog_header">v1.15.0</h3> <small
          class="changelog_date">- <a
          href="https://github.com/coffeelint/coffeelint/compare/v1.14.1...v1.15.0">2015.11.18<a></a></small>
          <p>
              This version updates the enable/disable directives. In addition to
              the existing <tt># coffeelint: disable=rule_name</tt> you can also
              use <tt># coffeelint: disable-line=rule_name</tt>. The rule name is
              still optional in both cases, and you can enable the rules using
              the same syntax.
            </p>
            <p>
                You can also use <tt># noqa</tt> as a shortcut for <tt># coffeelint: disable-line</tt>
            </p>
          <ul class="changelog_history">
            <li>See <a href="https://github.com/clutchski/coffeelint/pull/552">#552</a> for more details.</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v1.14.1</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v1.14.0...v1.14.1">2015.11.18<a></a></small>
            <p>Most of the changes are more for linting the development files of
              coffeelint. The minor version increase is due to the change in
              cyclomatic_complexity, which now ignores nested functions. I foresee
              this change affecting very few people but probably still needs a minor
              version increase.
            </p>
          <ul class="changelog_history">
            <li><tt>cyclomatic_complexity</tt> rule has been changed to ignore nested functions</li>
            <li>1.4.1: inlined rules not previously specified in JSON config now properly return a message</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v1.13.0</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v1.11.0...v1.13.0">2015.10.7<a></a></small>
            <p>The v1.12.x versions are considered buggy and you should upgrade to v1.13.x if you experience problems</p>
            <strong>These releases were largely for bugfixes!</strong>
          <ul class="changelog_history">
            <li>Bugfix for <tt>no_implicit_braces</tt> causing errors in classes and other edge cases</li>
            <li>Bugfix for <tt>ensure_comprehensions</tt> where it failed if a nested loop had an equal sign</li>
            <li>Bugfix for <tt>braces_spacing</tt> failing over generated curly braces</li>
            <li>Several changes to <tt>indentation</tt> See <a href="https://github.com/coffeelint/coffeelint/commit/bffa2532efd8bcca5d9c1b3a9d3b5914e882dd5f">bffa25</a>
              for the full list of changes. However between the release of v1.12.0 and v1.13.0, a regression was caused by fixing one of the indentation requests and
              as a result the change was reverted. The revert will most likely not affect too many users
            <li>Bugfix for <tt>newlines_after_classes</tt>, also fixed regressions caused between v1.12.0 and v1.13.0. If you have v1.12.x and are experiencing problems, please upgrade.
              Also note nested classes are now ignored completely
            </li>
            <li><tt>no_this</tt> is now compatible with <tt>no_stand_alone_at</tt> and will make checks against singular `this`</li>
            <li>Bugfix for <tt>missing_fat_arrows</tt>, declaring a class prototype (via '::' operator) no longer fail if they don't use a fat arrow</li>
            <li>Bugfix for <tt>eol_last</tt>, it now fails if there are multiple newlines at the end of a file (thanks <a href="https://github.com/charlierudolph">charlierudolph</a>)<li>
            <li>Bugfix for <tt>arrow_spacing</tt>, now ignores arrow spacing in empty functions (thanks <a href="https://github.com/sgentle">sgentle</a>)</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v1.11.0</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v1.10.0...v1.11.0">2015.8.19<a></a></small>
          <ul class="changelog_history">
            <li>New config option <tt>{ "extends": "coffeelint-config-myconfig" } based on <a href="http://eslint.org/docs/developer-guide/shareable-configs">eslint's shareable configs</a></tt></li>
            <li>New rule <tt>no_nested_string_interpolation</tt></li>
            <li>New rule <tt>no_private_function_fat_arrows</tt></li>
            <li>New CLI option <tt>--ext</tt> to specify alternate file extensions to check</li>
            <li>Bugfixes including tracking nested string interpolation which eleminates some misleading warnings</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v1.10.0</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v1.9.7...v1.10.0">2015.5.31<a></a></small>
          <ul class="changelog_history">
            <li>New option <tt>--trimconfig</tt>. shows the minimal config to implement your customizations.</li>
            <li>New rule <tt>eol_last</tt></li>
            <li>New rule <tt>no_this</tt> (prefer @ instead)</li>
            <li>New option in <tt>no_debugger</tt> to flag console calls</li>

            <li>Many small bug fixes</li>
          </ul>
          </div>


          <div>
            <h3 class="changelog_header">v1.9.6</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v1.9.4...v1.9.6">2015.5.5<a></a></small>
          <ul class="changelog_history">
              <li>Fix no_interpolation_in_single_quotes to only handle single quotes #400</li>
              <li>Avoid non-standard String.prototype.trimRight #401</li>
              <li>Strip comments from config file before parsing #407</li>
              <li>missing_fat_arrows: fix constructor checking in strict mode #409</li>
              <li>Use configfilter to expand module names</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v1.9.4</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v1.9.3...v1.9.4">2015.4.6<a></a></small>
          <ul class="changelog_history">
              <li>missing_fat_arrows: added strict-mode option, defaults to false</li>
              <li>Add "empty_object_spaces" to braces_spacing</li>
          </ul>
          </div>


          <div>
            <h3 class="changelog_header">v1.9.3</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v1.9.1...v1.9.3">2015.3.29<a></a></small>
          <ul class="changelog_history">
              <li>Add fat arrow to `arrow_spacing`</li>
              <li>Fix an exception when package.json can't be parsed.</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v1.9.1</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v1.9.0...v1.9.1">2015.2.22<a></a></small>
          <ul class="changelog_history">
              <li>Small change to make CoffeeLint compatible with atom.io</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v1.9.0</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v1.8.1...v1.9.0">2015.2.20<a></a></small>
          <ul class="changelog_history">
              <li>Updated to CoffeeScript 1.9.1 thanks to swang</li>
              <li>Fix <tt>no_implicit_braces error</tt> in class declarations</li>
              <li>New rule <tt>braces_padding</tt></li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v1.8.1</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v1.7.1...v1.8.1">2014.12.20<a></a></small>
          <ul class="changelog_history">
              <li>New rule <tt>ensure_comprehensions</tt> (warn by default)</li>
              <li>Added options to
                  <a href="https://github.com/coffeelint/coffeelint/blob/master/doc/user.md#how-do-i-use-jsx-reactjs">
                      transform
                  </a>
                  code before processing it. (JSX support) or to use a different
                  <a href="https://github.com/coffeelint/coffeelint/blob/master/doc/user.md#what-about-different-flavors-of-coffeescript-like-icedcoffeescript">
                      flavor of CoffeeScript
                  </a>
                  .
              </li>
              <li>New rule <tt>transform_messes_up_line_numbers</tt>. This simply tells you if a transform you're using changes the total number of lines in the file.</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v1.7.1</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v1.7.0...v1.7.1">2014.12.15<a></a></small>
          <ul class="changelog_history">
              <li>Fix for <tt>spacing_after_comma</tt> so that newlines count as space after commas</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v1.7.0</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v1.6.0...v1.7.0">2014.12.12<a></a></small>
          <ul class="changelog_history">
              <li>New rule <tt>spacing_after_comma</tt></li>
              <li>Indentation improvements</li>
              <li>Fix Block RegExp triggering in <tt>no_unnecessary_double_quotes</tt></li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v1.6.0</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v1.5.7...v1.6.0">2014.08.30<a></a></small>
          <ul class="changelog_history">
              <li>New rule <tt>prefer_english_operator</tt></li>
              <li>New behavior <tt>.coffeelintignore</tt> works just like a .gitignore</li>
              <li>Exposed <tt>ErrorReporter</tt> to 3rd parties so reporters can be used outside our CLI implementation. See <a href="https://github.com/clutchski/coffeelint/pull/330">#330</a> for details</li>
              <li>Linting from STDIN will look for config files.</li>
              <li><tt>-f</tt> option can specify a package.json that contains <tt>coffeelintConfig</tt></li>
              <li>Depricated <tt>--no-color</tt> in favor of new <tt>--color=<always/never/auto></tt> option</li>
              <li>Fixed an indentation bug when you have a blank line in the middle of a chained call.</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v1.5.5</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v1.5.3...v1.5.5">2014.08.12<a></a></small>
          <ul class="changelog_history">
              <li>#317 Change $HOME search priority to account for non-default windows users.</li>
              <li>#320 Remove support for chaining calls using a dot at the end of a line.</li>
              <li>Removed extra messages that broke XML output.</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v1.5.3</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v1.5.2...v1.5.3">2014.08.08<a></a></small>
          <ul class="changelog_history">
              <li>Indentation improvements for chained calls. See #285</li>
              <li>Fixed some missing cases for <tt>space_operators</tt></li>
              <li>Fix for a last-line edge case in <tt>no_implicit_parens</tt></li>
              <li>Fixed trailing semicolons in multi-line strings with multiple embedded tokens</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v1.5.2</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v1.5.0...v1.5.2">2014.06.07<a></a></small>
          <ul class="changelog_history">
              <li>#280 Fix for fat-arrow false positives. It was producing errors when the class is defined inside a function (AMD style)</li>
              <li>MANY indentation fixes. See #282.</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v1.5.0</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v1.4.1...v1.5.0">2014.05.28<a></a></small>
          <ul class="changelog_history">
              <li>New: --cache and coffeelint.setCache(obj)</li>
              <li>Rule module loading is not limited to running from the commandline.  See #279</li>
              <li>Fix for #173: Empty functions surrounded by parens don't require
              spacing.</li>
              <li>Fix for #271: trailing semicolons multiline strings are ignored</li>
              <li>Fix for #214: <tt>no_unnecessary_fat_arrows</tt> doesn't trigger if the function contains super.</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v1.4.0</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v1.3.0...v1.4.0">2014.05.16<a></a></small>
          <ul class="changelog_history">
            <li>Similar to grunt-cli, the coffeelint command will now load the project-specific version of coffeelint if there is one there.</li>
            <li>3rd party rules don't have to be globally installed any more.</li>
            <li>Added --reporter option that also supports 3rd party reporters. <a href="https://github.com/janraasch/coffeelint-stylish">coffeelint-stylish</a> is the first one available.</li>

            <li>Documentation for <a href="https://github.com/coffeelint/coffeelint/blob/master/doc/user.md">new users</a> and <a href="https://github.com/coffeelint/coffeelint/blob/master/doc/integration.md">3rd party developers</a>.</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v1.3.0</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v1.2.0...v1.3.0">2014.04.17<a></a></small>
          <ul class="changelog_history">
            <li>New rule <tt>no_empty_functions</tt></li>
            <li>Improved documentation on how to contribute in README.md</li>
            <li>Rules using the AST work with a minified version of CoffeeScript</li>
            <li>Fixed line length check to account for windows line endings</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v1.2.0</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v1.1.0...v1.2.0">2014.03.07<a></a></small>
          <ul class="changelog_history">
            <li>New rule <tt>no_debugger</tt></li>
            <li>New rule <tt>no_interpolation_in_single_quotes</tt></li>
            <li>New rule <tt>no_unnecessary_double_quotes</tt></li>
            <li>Strict mode for <tt>no_implicit_parens</tt>. Turning it off allows implicit parens when they span multiple lines.</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v1.1.0</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v1.0.8...v1.1.0">2014.02.22<a></a></small>
          <ul class="changelog_history">
            <li>CoffeeScript 1.7 support</li>
            <li>Dropped support for CoffeeScript 1.6. (Use ~1.0.0 if you still need it)</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v1.0.0</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v0.6.0...v1.0.0">2013.11.21<a></a></small>
          <ul class="changelog_history">

            <li>CoffeeLint will detect config files by default.</li>

            <li>New rule <tt>colon_assignment_spacing</tt></li>
            <li>New rule <tt>no_unnecessary_fat_arrows</tt></li>
            <li>New rule <tt>missing_fat_arrows</tt></li>
            <li>Added an option to <tt>no_trailing_whitespace</tt> to forbid trailing space on empty lines</li>
            <li>Added an option to <tt>no_implicit_braces</tt> to allow unambiguous implicit braces</li>
            <li>Fixed --makeconfig</li>
            <li>New option: --checkstyle</li>

            <li>Fixed invalid XML produced by --jslint</li>
            <li>Removed the need for the -r flag. It remains for backward compatibility but doesn't do anything now</li>

          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v0.6.0</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v0.5.7...v0.6.0">2013.10.10<a></a></small>
          <ul class="changelog_history">
            <li>New internal structure to support custom rules.</li>
            <li>Dropped support for NodeJS 0.6.</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v0.5.7</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v0.5.6...v0.5.7">2013.08.10<a></a></small>
          <ul class="changelog_history">
            <li>CSVReporter now has a column for last line to account for cyclomatic complexity spanning the length of the function</li>
            <li>Added support for literate CoffeeScript</li>
            <li>Dropped support for CoffeeScript 1.4 and 1.5</li>
            <li>Fixed <tt>non_empty_constructor_needs_parens</tt> for namespaced constructors</li>
            <li>Simplified the build process to allow installing direct from the git repo</li>
            <li>More fixes to indentation checking (continued https://github.com/clutchski/coffeelint/issues/107)</li>
            <li>Fixed spacing error when returning negative numbers (https://github.com/clutchski/coffeelint/issues/129)</li>
            <li>Fixed arrow spacing in callback parameters (https://github.com/clutchski/coffeelint/issues/131)</li>
            <li>Added beginning and end line numbers for cyclomatic complexity (https://github.com/clutchski/coffeelint/pull/134)</li>
            <li>Added header to CSVReporter</li>
            <li>Fixes for <tt>space_operators</tt>(https://github.com/clutchski/coffeelint/issues/137)</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">v0.5.6</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v0.5.4...v0.5.6">2013.06.07<a></a></small>
          <ul class="changelog_history">
            <li>Added <tt>no_empty_param_list</tt> rule.</li>
            <li>Added the <tt>--makeconfig</tt> option.</li>
            <li>CoffeeScript 1.5 and 1.6 compatibility</li>
            <li>Fixed indentation of chained functions. (https://github.com/clutchski/coffeelint/issues/107, fixed 1/2 of #4)</li>
            <li>Fixed bug in <tt>no_stand_alone_at</tt> (https://github.com/jashkenas/coffee-script/issues/1601)</li>
            <li>Added <tt>arrow_spacing</tt> rule (require spaces around arrows)</li>
            <li>Added <tt>empty_constructor_needs_parens</tt></li>
            <li>Added <tt>non_empty_constructor_needs_parens</tt></li>
            <li>Added <tt>duplicate_key</tt> (http://jslinterrors.com/duplicate-key-a/)</li>
            <li>Added <tt>no_trailing_whitespace.allowed_in_comments</tt> rule option (Allow trailing space in comments. Created to allow markdown)</li>
            <li>Added <tt>newlines_after_classes</tt> rule</li>
            <li>Line length exception. Lines containing only a link are ignored.</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">0.5.4</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v0.5.3...v0.5.4">2012.11.06<a></a></small>
          <ul class="changelog_history">
            <li>Support for default configuration file using environment variable <tt>COFFEELINT_CONFIG</tt>.</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">0.5.3</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v0.5.2...v0.5.3">2012.11.06<a></a></small>
          <ul class="changelog_history">
            <li>Added <tt>no_stand_alone_at</tt> rule.</li>
            <li>Fixed correctly reporting line numbers of compilation errors after line 10.</li>
            <li>Fixed incomplete results output.</li>
          </ul>
          </div>

          <div>
            <h3 class="changelog_header">0.5.2</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v0.5.1...v0.5.2">2012.09.18</a></small>
          </div>
          <ul class="changelog_history">
            <li>Added <tt>--nocolor</tt> option.</li>
            <li>My main man ruddzw fixed issue #58, in which the <tt>-q</tt> option was
            suppressing information even when it was off.</li>
            <li>Fixed broken <tt>jslint</tt> option.</li>
            <li>The <tt>no_trailing_semicolons</tt> rule now works on Windows
            files.</li>
          </ul>

          <div>
            <h3 class="changelog_header">0.5.1</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v0.5.0...v0.5.1">2012.09.15</a></small>
          </div>
          <ul class="changelog_history">
            <li>Show CoffeeScript syntax errors in the same manner as lint
            errors.</li>
            <li>Brad Dunbar added the <tt>-q</tt> command line option, which
            only prints errors.</li>
          </ul>

          <div>
            <h3 class="changelog_header">0.5.0</h3>
            <small class="changelog_date">- <a
            href="https://github.com/coffeelint/coffeelint/compare/v0.4.0...v0.5.0">2012.09.08</a></small>
          </div>
          <ul class="changelog_history">
            <li>Lint code from stdin with the <tt>--stdin</tt> option, thanks
            to sjz.</li>
            <li>Added the <tt>no_implicit_parens</tt> rule.</li>
            <li>Leandro Ostera added the <tt>--jslint</tt> reporter, to allow
            CoffeeLint to integrate with the Jenkin's violations plugin.</li>
            <li>Implicit braces are always allowed in in class
            defiinitions, thanks to Omar Khan.</li>
            <li>CoffeeLint now requires CoffeeScript 1.3.3</li>
          </ul>

          <div>
            <h3 class="changelog_header">0.4.0</h3>
            <small class="changelog_date">- 2012.04.06</small>
          </div>
          <ul class="changelog_history">
            <li>Added fancy coloured output and proper CSV output.</li>
            <li>Directories can be recursively linted.</li>
            <li>Added the <tt>line endings</tt> rule.</li>
            <li>Rewrote the command line tool in CoffeeScript.</li>
          </ul>

          <div>
            <h3 class="changelog_header">0.3.0</h3>
            <small class="changelog_date">- 2012.03.13</small>
          </div>
          <ul class="changelog_history">
            <li>Added the <tt>no_backticks</tt> rule.</li>
            <li>Colorized the command line output.</li>
            <li>Added validation for the rule names.</li>
            <li>Allowed windows line endings, thanks to <a
              href="https://github.com/szinsli">szinsli</a>.</li>
          </ul>

          <div>
            <h3 class="changelog_header">0.2.0</h3>
            <small class="changelog_date">- 2012.01.26</small>
          </div>
          <ul class="changelog_history">
            <li>Added warnings, which will be reported, but won't fail
            the command line tool.
            </li>
          </ul>

          <div>
            <h3 class="changelog_header">0.1.0</h3>
            <small class="changelog_date">- 2012.01.22</small>
          </div>
          <ul class="changelog_history">
            <li>Initial CoffeeLint release.</li>
          </ul>
