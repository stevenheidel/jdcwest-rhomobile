require 'rho/rhocontroller'
require 'helpers/browser_helper'

class SponsorController < Rho::RhoController
  include BrowserHelper

  #GET /Sponsor
  def index
    @sponsors = read_sponsors
    
    render
  end

  # GET /Sponsor/{1}
  def show
    @sponsors = read_sponsors
    
    @sponsors.each do |sponsor|
      if "{" + sponsor[:name] + "}" == @params['id']
        @sponsor = sponsor
      end
    end
    
    if @sponsor
      render :action => :show
    else
      redirect :action => :index
    end
  end
  
  def read_sponsors
    sponsors = []
      
    contents = File.open(File.join(Rho::RhoApplication::get_model_path('app','Sponsor'), 'sponsor.txt')).read
    
    contents.split("--").each do |section|
      lines = section.strip.split(",")
      # create hash of field\value pairs
      data = {:name => lines[0].strip.gsub(" ", "_"), 
              :type => lines[1].strip, 
              :description => lines[2].strip}
      
      sponsors << data
    end
    
    sponsors
  end
end
