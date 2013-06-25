@Dashboard.module "UsersApp.Models", (Models, Dashboard, Backbone, Marionette, $, _) ->

  class Models.User extends Backbone.Model
    urlRoot: '/users'
    username: null
    first_name: null
    last_name: null
    age: null
    email: null
   
    url: ->
      baseUrl = @urlRoot
      return baseUrl if @isNew()
      "#{baseUrl}/#{@id}"

@Dashboard.module "UsersApp.Collection", (Collection, Dashboard, Backbone, Marionette, $, _) ->

  class Collection.Users extends Backbone.Collection
    model: Dashboard.UsersApp.Models.User
    url: '/users'
