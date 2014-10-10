define [
  'backbone',
  'backbone.marionette'
], (
  Backbone,
  Marionette
) ->

  defaultLayoutView = Marionette.LayoutView.extend (
    template: layoutTemplate
    regions:
      header:   '#header'
      main:     '#main'
      footer:   '#footer'
  )
