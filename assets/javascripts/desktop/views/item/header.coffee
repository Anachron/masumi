define [
  'backbone',
  'backbone.marionette',
  'hbs!t/desktop/views/item/header'
], (
  Backbone,
  Marionette,
  headerViewTemplate
) ->

  headerItemView = Marionette.ItemView.extend (
    template: headerViewTemplate
  )
