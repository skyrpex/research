exports.read_file = function(file, url) {
    let fs = require("fs-extra");
    const fileContent = fs.readFileSync(__dirname + "/" + file, "utf8");
    return fileContent.replace("###REPLACE_ME###", "window.wingApi=\"" + url + "\";");
};
  