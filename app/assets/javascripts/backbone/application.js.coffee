#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require underscore
#= require backbone
#= require underscore.inflections
#= require_tree ./templates
#= require backbone.marionette
#= require backbone.syphon
#= require_self
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers
#= require_tree ./controllers

@Dashboard = do (Backbone, Marionette) ->

  Dashboard = new Marionette.Application

  Dashboard.addRegions
    contentRegion: '#marionettecrud_content'
    sidebarRegion: '#main-nav'

  Dashboard.on "initialize:after", (options) ->
    if Backbone.history
      Backbone.history.start()

  Dashboard


$ ->
  Dashboard.start()






