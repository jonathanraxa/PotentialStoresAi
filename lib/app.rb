require "cipher_box/cipher.rb"

class CipherApp < Sinatra::Base
    configure :development do 
        register Sinatra::Reloader 
    end
    set :root, 'lib/app'
    enable :sessions
    
    get '/' do 
        session[:data] ||= {}
        erb :index, locals: {results: session} 
    end

    get '/shift' do 
        cipher = Cipher.new(params['text']).shift(params['factor'].to_i)
        session[:data] = {name: params[:text], shift: params[:factor], shifted: cipher}
        redirect '/'
    end
end