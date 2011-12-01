# markdowner
A simple `markdown` to HTML server.  Comes with the bin file `mdview`.

## Usage

To use `mdview`, simply point it to the path of the file you are working on:

    $ mdview -f README.md
    Server listening on port 3000

Or, you can use the long format:

    $ mdview --file README.md
    Server listening on port 3000

Now, just open your browser to http://localhost:3000/ to view your markdown
file in HTML. You may also provide the port to view it on:

    $ mdview --file README.md --port 3232
    Server listening on port 3232


That's it!

## License

Released under the MIT license.
