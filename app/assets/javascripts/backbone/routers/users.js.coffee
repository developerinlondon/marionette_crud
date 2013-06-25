@Dashboard.module "UsersApp", (UsersApp, Dashboard, Backbone, Marionette, $, _) ->

  class UsersApp.Router extends Marionette.AppRouter
      appRoutes:
        '': 'index'
        'users': 'index'
        'users/new': 'new'
        'users/:id': 'show'
        'users/:id/edit': 'edit'

    Dashboard.addInitializer ->
      window.usersRouter = new UsersApp.Router
        controller: new UsersApp.UsersController