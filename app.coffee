commander = require 'commander'
markdown  = require 'markdown'
http      = require 'http'
fs        = require 'fs'

package = JSON.parse fs.readFileSync __dirname+'/package.json'
css = fs.readFileSync __dirname+'/styles.css'

head = """
<!DOCTYPE html>
<html>
  <head>
  <style type="text/css">
  #{css}
  </style>
  </head>
  <body>
  <div id="contents">
"""

footer = """
  </div>
  </body>
</html>
"""

commander.version(package.version)
  .option('-p, --port <port>', 'specify the port [3000]', Number, 3000)
  .option('-f, --file <file>', 'File name')
  .parse(process.argv)

if not commander.file
  console.log "You must provide a file path to render"
  process.exit 1

path = [process.cwd(), commander.file].join '/'
server = http.createServer (req, res)->
  fs.readFile path, (err, data)->
    if err
      console.log "File #{path} does not exist!"
      process.exit 1
    res.end [head, markdown.markdown.toHTML(data.toString()), footer].join "\n"

server.port = commander.port
module.exports = server
