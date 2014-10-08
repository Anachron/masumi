requirejs.config
  urlArgs: "b=" + ((new Date()).getTime())

  shim:
    'handlebars':
      init: () ->
        #https://github.com/wycats/handlebars.js/issues/333
        window.Handlebars = Handlebars
      exports: 'Handlebars'

  paths:
    # Libs
    'backbone':                         'vendor/backbone/backbone'
    'backbone.babysitter':              'vendor/backbone.babysitter/backbone.babysitter'
    'backbone.epoxy':                   'vendor/backbone.epoxy/backbone.epoxy'
    'backbone.localstorage':            'vendor/backbone.localstorage/backbone.localStorage'
    'backbone.marionette':              'vendor/backbone.marionette/backbone.marionette'
    'backbone.wreqr':                   'vendor/backbone.wreqr/backbone.wreqr'
    'cocktail':                         'vendor/cocktail/Cocktail'
    'css':                              'vendor/require-css/css'
    'handlebars':                       'vendor/handlebars.js/index'
    'hbs':                              'vendor/require-hbs/hbs'
    'jquery':                           'vendor/jquery/jquery'
    'require':                          'vendor/requirejs/require'
    'semantic':                         'vendor/semantic/semantic'
    'text':                             'vendor/require-text/text'
    'underscore':                       'vendor/underscore/underscore'
    # Folders
    'j':                                '../javascripts'
    'c':                                '../stylesheets'
    't':                                '../templates/'
