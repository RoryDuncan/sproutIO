var App, Breadcrumb, Router, clearBreadcrumb;

App = window.App;

Breadcrumb = (function() {

  function Breadcrumb() {}

  Breadcrumb.prototype.set = function(name) {
    if ($('.app-breadcrumbs ol.breadcrumb li.active').length === 0) {
      $('.app-breadcrumbs ol.breadcrumb').append("<li class='active'>&nbsp;</li>");
    }
    return $('.app-breadcrumbs ol.breadcrumb li.active').html(name);
  };

  Breadcrumb.prototype.reset = function() {
    return $('.app-breadcrumbs ol.breadcrumb').html('<li><a href="#home">App Home</a></li>');
  };

  return Breadcrumb;

})();

clearBreadcrumb = Router = Backbone.Router.extend({
  routes: {
    ":home": "appRoot",
    "m/:model": "modelByName"
  },
  breadcrumb: new Breadcrumb(),
  appRoot: function(action) {
    var ProjectList, mainView;
    ProjectList = App.View.ProjectList;
    mainView = new ProjectList;
    App.core.AppContainer.show(mainView);
    this.breadcrumb.reset();
  },
  modelByName: function(uri) {
    var ProjectDeveloper, model, name, singleModelView;
    model = App.projects.findWhere({
      "uri": uri
    });
    ProjectDeveloper = App.View.ProjectDeveloper;
    singleModelView = new ProjectDeveloper({
      "model": model
    });
    App.core.AppContainer.show(singleModelView);
    name = model.get("name");
    console.log(this);
    this.breadcrumb.set(name);
  }
});

App.router = new Router();

// Generated by CoffeeScript 1.5.0-pre
