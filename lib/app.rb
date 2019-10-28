require "cipher_box/cipher.rb"

class CipherApp < Sinatra::Base
    configure :development do 
        register Sinatra::Reloader 
    end
    set :root, 'lib/app'
    
    get '/' do 
        erb :index, locals: {text: nil, shift_f: nil, ciphered: nil}
    end

    get '/shift' do 
        @text = params['text']
        @shift_f = params['factor']
        ciphered = Cipher.new(@text).shift(@shift_f.to_i)
        erb :index, locals: {text: @text, shift_f: @shift_f, ciphered: ciphered}
    end
end