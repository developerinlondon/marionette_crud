@Dashboard.module 'UsersApp', (UsersApp, Dashboard, Backbone, Marionette, $, _) ->
  class UsersApp.UsersController extends Marionette.Controller
    index: ->
      users = new Dashboard.UsersApp.Collection.Users
      users.fetch()
      @layout = @getLayoutView()
      @layout.on 'show', =>
        @showUsers users
      Dashboard.contentRegion.show @layout

    show: (userId) ->
      user = new Dashboard.UsersApp.Models.User {id: parseInt(userId)}
      user.fetch()
      @layout = @getLayoutView()
      @layout.on 'show', =>
        @showUser user
      Dashboard.contentRegion.show @layout

    edit: (userId) ->
      user = new Dashboard.UsersApp.Models.User {id: parseInt(userId)}
      user.fetch()
      @layout = @getLayoutView()
      @layout.on 'show', =>
        @showEditUser user
      Dashboard.contentRegion.show @layout

    new: ->
      user = new Dashboard.UsersApp.Models.User
      @layout = @getLayoutView()
      @layout.on 'show', =>
        @showNewUser user
      Dashboard.contentRegion.show @layout

    getLayoutView: ->
      new Dashboard.UsersApp.Views.UsersLayout

    showNewUser: (user) ->
      userNewView = @getNewUserView user
      @layout.usersRegion.show userNewView

    getNewUserView: (user) ->
      new Dashboard.UsersApp.Views.UserNewView
        model: user

    showUser: (user) ->
      usersView = @getUserView user
      @layout.usersRegion.show usersView
    getUserView: (user) ->
      new Dashboard.UsersApp.Views.UserShowView
        model: user

    showEditUser: (user) ->
      usersView = @getUserEditView user
      @layout.usersRegion.show usersView
      
    getUserEditView: (user) ->
      new Dashboard.UsersApp.Views.UserEditView
        model: user

    showUsers: (users) ->
      usersView = @getUsersView users
      @layout.usersRegion.show usersView
    getUsersView: (users) ->
      new Dashboard.UsersApp.Views.UsersView
        collection: users

