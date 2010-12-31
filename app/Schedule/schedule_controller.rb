require 'rho/rhocontroller'
require 'helpers/browser_helper'

class ScheduleController < Rho::RhoController
  include BrowserHelper

  #GET /Schedule
  def index
    render
  end

  # GET /Schedule/{1}
  def show
    @type = @params['id'].gsub("{","").split("-")[0]
    @item = @params['id'].gsub("}","").split("-")[1]
    
    if @type and @item
      contents = File.open(File.join(Rho::RhoApplication::get_model_path('app','Schedule'), "#{@type}.txt")).read
      
      @info = contents.scan(/--#{@item}--(.+)--END #{@item}--/im)[0][0]
      
      render :action => :show
    else
      redirect :action => :index
    end
  end
  
  def submenu
    @type = @params['id'].gsub("{","").gsub("}","")
    
    @items = case @type
      when "General" then ["Friday", "Saturday_Evening", "Sunday_Evening"]
      when "Cases" then ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"]
      when "Debate" then ["Saturday", "Sunday"]
      when "Sport" then ["Water_Basketball_Rounds", "Water_Basketball_Playoffs", "Ultimate_Frisbee_Rounds", "Ultimate_Frisbee_Playoffs"]
    end
  end

end
