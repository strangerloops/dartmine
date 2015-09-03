require 'rubygems'
require 'sinatra/base'
require_relative 'fns'

class DartmineApp < Sinatra::Base

	set :run, true
	set :port, 9494
	set :server, 'webrick'

	get '/' do
		@c_b_hash = key_pattern_hash
		erb :index
	end

	get '/howto' do
		erb :howto
	end

	get '/about' do
		erb :about
	end

	get '/produce_csv' do
		p params
		get_csv_from params
	end

	run! if app_file == $0
end