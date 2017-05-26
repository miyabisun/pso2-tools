require("livescript");
var Ac = require("../functions/get-ac-scratch-items.ls");

var url = process.argv[2];
if (!url) {
  console.error("url is requie!");
  process.exit(1);
}

Ac.getHtmlOf(url, function(err, body){
  if (err) console.error(err);
  Ac.parse(body).forEach(function(it){
    console.info(it.category + "\t" + it.name + "\t\t\t\t\t\t" + it.probability + "\t1");
  });
})

