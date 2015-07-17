var description = {
  summary: "Frontend Foundation",
  version: "1.0.0",
  name: "frontend-foundation"
};
Package.describe(description);

var path = Npm.require("path");
var fs = Npm.require("fs");
eval(fs.readFileSync("./packages/autopackage.js").toString());
Package.onUse(function(api) {
  addFiles(api, description.name, getDefaultProfiles());
  api.use(["meteor-platform", "coffeescript", "stylus", "mquandalle:jade@0.4.1", "underscore", "jquery"]);
  api.imply(["meteor-platform", "coffeescript", "stylus", "mquandalle:jade", "underscore", "jquery"]);
  api.export([
    "Foreach",
    "Models",
    "Collections",
    "Transformations",
    "Bindings",
    "MixpanelInitializer"
  ]);
  api.export([
    "cl",
    "ct",
    "cte",
    "cd"
  ]);
  api.export([
    "secure",
    "encapsulate",
    "grab"
  ], ["client"]);
  api.export([
    "secure",
    "admin",
    "editor",
    "isAdmin",
    "isEditor",
    "introspect"
  ], ["server"]);
});
