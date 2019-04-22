require_relative 'config/environment'

class App < Sinatra::Base
  get '/reversename/:name' do
    @name = params[:name]
    @name.reverse
  end

  get '/square/:number' do
    @num = params[:number].to_i
    (@num * @num).to_s
  end

  get '/say/:number/:phrase' do
    @number = params[:number].to_i
    @phrase = params[:phrase]
    @output = ""
    @number.times do
      @output += @phrase
    end
    @output
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    params[:word1] + " " + params[:word2] + " " + \
      params[:word3] + " " + params[:word4] + " " + params[:word5] + "."
  end

  get '/:operation/:number1/:number2' do
    @operation = params[:operation]
    @number1 = params[:number1].to_i
    @number2 = params[:number2].to_i
    case @operation
    when 'add'
      (@number1+@number2).to_s
    when 'subtract'
      (@number1-@number2).to_s
    when 'multiply'
      (@number1*@number2).to_s
    when 'divide'
      if @number2 != 0
        (@number1/@number2).to_s
      else
        "0"
      end
    end
  end

end