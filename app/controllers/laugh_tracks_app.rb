class LaughTracksApp < Sinatra::Base
  get '/comedians' do
    age = params[:age]
    if age
      @comedians = Comedian.where(age: age).includes(:specials)
    else
      @comedians = Comedian.all.includes(:specials)
    end
    @average_age = Comedian.average_age
    erb :comedians
  end



end
