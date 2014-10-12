exports.setup = (app, viewVars) ->
  # Home
  app.get '/', (req, res, next) ->
    viewVars.page = 'index'
    next()
