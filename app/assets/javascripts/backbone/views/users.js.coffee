@Dashboard.module "UsersApp.Views", (Views, Dashboard, Backbone, Marionette, $, _) ->
  class Views.UserItemView extends Backbone.Marionette.ItemView
    tagName: 'tr'
    template: JST["backbone/templates/users/user"]
    initialize: -> @model.on 'sync', @render, @

    events:
      'click .destroy': 'destroy'

    destroy: ->
      if confirm 'Delete user?'
        @model.destroy()
        this.remove()
      0

  class Views.UserShowView extends Backbone.Marionette.ItemView
    template: JST["backbone/templates/users/show"]
    initialize: -> @model.on 'sync', @render, @

  class Views.UserEditView extends Backbone.Marionette.ItemView
    template: JST["backbone/templates/users/edit"]
    initialize: -> @model.on 'sync', @render, @
    events:
      "submit #edit-user" : "update"
    update: (e) ->
      e.preventDefault()
      e.stopPropagation()

      @model.set  Backbone.Syphon.serialize @

      @model.save null,
        success : (user) =>
          @model = user
          window.location.hash = "#/users/#{@model.id}"
      
  class Views.UserNewView extends Backbone.Marionette.ItemView
    template: JST["backbone/templates/users/new"]
    events:
      "submit #new-user" : "create"
    create: (e) ->
      e.preventDefault()
      e.stopPropagation()

      @model.set Backbone.Syphon.serialize @

      @model.save null,
        success : (user) =>
          @model = user
          window.location.hash = "#/users/#{@model.id}"

  class Views.NoUsersView extends Backbone.Marionette.ItemView
    template: JST["backbone/templates/users/nousers"]
    tagName: 'tr'

  class Views.UsersView extends Backbone.Marionette.CompositeView
    template: JST["backbone/templates/users/index"]
    itemView: Views.UserItemView
    emptyView: Views.NoUsersView
    itemViewContainer: 'tbody'

  class Views.UsersLayout extends Backbone.Marionette.Layout
    template: JST["backbone/templates/users/layout"]
    regions:
      usersRegion: "#users-region"