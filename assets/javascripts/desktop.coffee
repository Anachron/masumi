require ['common'], () ->
  require [
      'backbone.marionette',
      'jquery',
    ], (Marionette, $) ->

      app = new Marionette.Application()

      # Initialize the spinner hiding
      app.on 'start', (options) ->
        $('.spinner').hide()

      # Start the app
      app.start()
