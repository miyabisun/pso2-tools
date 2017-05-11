require! {
  fs
  chai: {expect}
  \prelude-ls : {each, find, at, flip}
  \../../functions/get-ac-scratch-items.ls : main
}

filename = __filename.replace(/^.*(test)/, \test)
describe filename, ->
  describe \parse ->
    data = fs.read-file-sync "#__dirname/../data/ac-20170405.txt"
    specify \is_array, ->
      data |> main.parse |> expect >> (.to.be.an \array)
    specify \has_require_keys, ->
      data |> main.parse |> each expect >> (.to.have.contain.keys <[name category]>)
    specify.skip \console.log, ->
      data |> main.parse |> each ->
        console.log "#{it.category}\t#{it.name}"

