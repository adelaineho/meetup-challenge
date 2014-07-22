module.exports = (server, restify, options) ->

  # 
  # SERVER PLUGINS
  # - http://mcavage.me/node-restify/#Bundled-Plugins
  # 

  server.use restify.acceptParser(server.acceptable)
  server.use restify.authorizationParser()
  server.use restify.dateParser()
  server.use restify.queryParser()
  server.use restify.jsonp()
  server.use restify.gzipResponse()
  server.use restify.bodyParser()
  server.use restify.conditionalRequest()
