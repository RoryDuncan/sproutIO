
App.View = {}

App.View.Item = Backbone.Marionette.ItemView.extend
  model: App.Model
  template: _.template $("#app-item-template").html()
  tagName: 'li'
  className: ''


App.View.ProjectList = Backbone.Marionette.CompositeView.extend
  tagName: "div"
  id: "app-main"
  className: " "
  template: "#ProjectList-template" 
  itemView: App.View.Item
  itemViewContainer: ".app-projects-list"
  collection: App.projects
  collectionEvents:
    "add": ->
      console.log "Model added to collection"


