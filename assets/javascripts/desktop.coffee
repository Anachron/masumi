require ['common'], () ->

  require [
      'jquery',
      'underscore',
      'backbone',
      'backbone.marionette',
      'j/desktop/views/item/header'
    ], ($, _, Backbone, Marionette, headerItemView) ->

      app = new Marionette.Application()

      # Initialize the spinner hiding
      app.on 'start', (options) ->
        $('.ui.active.dimmer').remove()

      # Start the app
      app.start()
