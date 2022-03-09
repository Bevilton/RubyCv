"use strict";
exports.__esModule = true;
var node_csfd_api_1 = require("node-csfd-api");
var name = process.argv[2]
node_csfd_api_1.csfd.search(name).then(function (search) { return console.log(search); });
