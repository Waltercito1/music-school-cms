ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

def reload
    load_all 'app'
end
# desc: "Rake console"
task :console do
    reload
    Pry.start
end