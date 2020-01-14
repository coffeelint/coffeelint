fs = require 'fs'
glob = require 'glob'
path = require 'path'
browserify = require 'browserify'
CoffeeScript = require 'coffeescript'
{ exec } = require 'child_process'

coffeeSync = (input, output) ->
    coffee = fs.readFileSync(input).toString()
    fs.writeFileSync output, CoffeeScript.compile(coffee)

task 'compile', 'Compile Coffeelint', ->
    console.log 'Compiling Coffeelint...'
    fs.mkdirSync 'lib' unless fs.existsSync 'lib'
    invoke 'compile:browserify'
    invoke 'compile:commandline'

task 'compile:commandline', 'Compiles commandline.js', ->
    coffeeSync 'src/commandline.coffee', 'lib/commandline.js'
    coffeeSync 'src/configfinder.coffee', 'lib/configfinder.js'
    coffeeSync 'src/cache.coffee', 'lib/cache.js'
    coffeeSync 'src/ruleLoader.coffee', 'lib/ruleLoader.js'
    fs.mkdirSync 'lib/reporters' unless fs.existsSync 'lib/reporters'
    fs.mkdirSync 'lib/rules' unless fs.existsSync 'lib/rules'
    for src in glob.sync('reporters/*.coffee', { cwd: 'src' })
        # Slice the "coffee" extension off the end and replace with js
        dest = src[...-6] + 'js'
        coffeeSync "src/#{src}", "lib/#{dest}"

    for src in glob.sync('rules/*.coffee', { cwd: 'src' })
        # Slice the "coffee" extension off the end and replace with js
        dest = src[...-6] + 'js'
        coffeeSync "src/#{src}", "lib/#{dest}"

task 'compile:browserify', 'Uses browserify to compile coffeelint', ->
    opts =
        standalone: 'coffeelint'
    b = browserify(opts)
    b.add [ './src/coffeelint.coffee' ]
    b.transform require('coffeeify')
    b.bundle().pipe fs.createWriteStream('lib/coffeelint.js')
