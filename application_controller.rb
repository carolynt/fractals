require 'bundler'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
  get '/create' do
    erb :create
  end
 get '/whats_a_fractal' do
   erb :whats_a_fractal
  end
  get '/square_fractal' do
    erb :square_fractal
  end
  get '/examples' do
    erb :examples
  end
  get '/fractal_tree' do
    erb :fractal_tree
  end
  get '/dragon_curve' do
    erb :dragon_curve
  end
end