# This file is used by Rack-based servers to start the application.
require ::File.expand_path('../config/environment', __FILE__)

require 'rack/cors'
use Rack::Cors do

	if Rails.env == "development" or Rails.env == "test"
		allow do
			origins '*'
			resource '*', 
				:headers => :any, 
				:methods => [:get, :post, :delete, :put, :options]
		end
	else
		allow do
			origins 'cdn.frontend.example.com', 'cdn2.example.com'	# Change this to your frontend addresses
			resource '*', 
				:headers => :any, 
				:methods => [:get, :post, :delete, :put, :options]
		end
	end
end

run Rails.application
