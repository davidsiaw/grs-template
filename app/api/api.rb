require 'grape-swagger'

class API < Grape::API
  prefix 'api'
  format :json
  mount Acme::Ping
  add_swagger_documentation
end