require ['common'], () ->
  require [
      'jquery',
      'underscore',
      'backbone',
      'backbone.marionette'
    ], ($, _, Backbone, Marionette) ->

      app = new Marionette.Application()

      # Initialize the spinner hiding
      app.on 'start', (options) ->
        $('.spinner').hide()

      # Start the app
      app.start()
