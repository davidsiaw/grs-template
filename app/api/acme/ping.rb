module Acme
	class Ping < Grape::API
		desc 'Returns pong.'
		params do
			optional :pong, type: String, desc: "some text", documentation: { example: 'hello' }
		end
		get :ping do
			{ ping: params[:pong] || 'pong' }
		end

	end
end