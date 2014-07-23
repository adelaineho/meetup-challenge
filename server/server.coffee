###
Name        Meetup Challenge
Author      Chris Iona <chrisiona@hipagesgroup.com.au>
###



# NPM Packages

restify  = require 'restify'
AWS = require 'aws-sdk'
AWS.config.loadFromPath('./config/aws.json');



#
# Include our options for Restify
#

serveroptions = {} #require './config/server-options'
appconfig = require './config/app'



# 
# RESTIFY SERVER
# 

server = restify.createServer serveroptions



#
# APPLICATION MODULES
#

# Configs
require('./config/server-setup')(server, restify)

# Models

# Routes
require('./routes/general')(server, AWS, restify, appconfig)




# 
# START SERVER
#

service = server.listen 3000, ->
  console.log("Listening on port #{server.address().port}")
