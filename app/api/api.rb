require 'grape-swagger'

module API
	class Base < Grape::API
	  format :json

	  # mount your controllers here
	  mount API::V1::Ping	# Just an example controller
	  
	  add_swagger_documentation
	end
end