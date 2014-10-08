require ['common'], () ->
  require [
      'jquery',
      'underscore',
      'backbone.marionette'
    ], ($, _, Marionette) ->

      app = new Marionette.Application()

      # Initialize the spinner hiding
      app.on 'start', (options) ->
        $('.spinner').hide()

      # Start the app
      app.start()
