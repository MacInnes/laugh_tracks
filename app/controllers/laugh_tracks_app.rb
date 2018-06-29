class LaughTracksApp < Sinatra::Base
  get '/comedians' do
    age = params[:age]
    if age
      @comedians = Comedian.where(age: age)
    else
      @comedians = Comedian.all
    end
    @average_age = Comedian.average("age").to_i
    erb :comedians
  end



end
