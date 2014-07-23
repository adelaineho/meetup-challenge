module.exports = (server, AWS, restify, options) ->

  server.post '/api/entry', (req, res, next) ->

    user = 
      epoch:
        "N": (new Date).getTime().toString()

    if req.params.email
      user.email =
        "S": req.params.email

    if req.params.firstname
      user.firstname = 
        "S": req.params.firstname 

    if req.params.lastname
      user.lastname = 
        "S": req.params.lastname 

    if req.params.twitter
      user.twitter = 
        "S": req.params.twitter 

    db = new AWS.DynamoDB({apiVersion: '2012-08-10'})

    db.putItem({TableName: options.dynamodbTable, Item: user}, (err, data) ->
      if err
        res.json 500,
          status: "error"
      else
        res.json 200,
          status: "success"
    )

    next()


  server.get '/api/winner', (req, res, next) ->
    db = new AWS.DynamoDB({apiVersion: '2012-08-10'})

    params = 
      TableName: options.dynamodbTable

    db.scan(params, (err, data) ->
      if err
         res.json 500, err
      else
         res.json 200, data
    )

    next()


  # Should be a list of backbone routes
  # It serves the root index.html file instead
  server.get /\/(winner)/, restify.serveStatic({
    'directory': '../dist/'
    'default': '../index.html'
  })


  # Serve up all other assets
  server.get /.*/, restify.serveStatic({
    'directory': '../dist/'
    'default': 'index.html'
  })


