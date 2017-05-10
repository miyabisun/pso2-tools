require! {
  cheerio
  superagent: request
  \prelude-ls : {map, filter, fold, flatten}
}

module.exports =
  get-html-of: (url, cb)->
    request
      .get url
      .end (err, {text}:res)->
        cb err, text
  parse: (body)->
    body
    |> @items
    |> flatten
  items: (body)->
    $ = cheerio.load body
    $items = $ "dl.item-list-l"
      .map (_, it)->
        name: $ it .find "dt" .text!
        category: $ it
          .find ".detail tr"
          .filter (_, it)-> $ it .find \th .text! is \ジャンル
          .find \td
          .text!

