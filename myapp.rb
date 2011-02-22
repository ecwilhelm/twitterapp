require 'sinatra'

get '/hello' do
    @title="My First Sinatra App"
    @greeting= "Hello world! The time is now #{Time.now}"
    erb :hello
end

get '/goodbye' do
    @title="Bye!"
    @greeting= "Goodbye"
    erb :goodbye
end

