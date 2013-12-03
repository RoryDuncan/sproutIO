App = window.App

class Breadcrumb

  set: (name) ->
    if $('.app-breadcrumbs ol.breadcrumb li.active').length is 0
      $('.app-breadcrumbs ol.breadcrumb').append "<li class='active'>&nbsp;</li>"
    $('.app-breadcrumbs ol.breadcrumb li.active').html name


  reset: () ->
    $('.app-breadcrumbs ol.breadcrumb').html '<li><a href="#home">App Home</a></li>'



clearBreadcrumb = 

Router = Backbone.Router.extend

  routes:
    ":home"     : "appRoot"
    "m/:model"  : "modelByName"

  breadcrumb: new Breadcrumb()

  appRoot: (action) ->

    ProjectList = App.View.ProjectList # new keyword doesn't allow dot notation
    mainView = new ProjectList
    # show it
    App.core.AppContainer.show mainView

    @breadcrumb.reset()
    return

  modelByName: (uri) ->

    # find based on the uri (which is constructed from the name)
    model = App.projects.findWhere
      "uri" : uri


    ProjectDeveloper = App.View.ProjectDeveloper # new keyword doesn't allow dot notation

    singleModelView = new ProjectDeveloper
      "model": model
    App.core.AppContainer.show singleModelView

    #breadcrumbing
    name = model.get "name"
    console.log @
    @breadcrumb.set name

    return

App.router = new Router()



