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
      
    filename = File.join(Rho::RhoApplication::get_model_path('app','Sponsor'), 'sponsor.txt')
      
    File.readlines(filename, "--\n").each do |section|
      lines = section.lines.to_a
      # create hash of field\value pairs
      data = {:name => lines[0].chomp, 
              :type => lines[1].chomp, 
              :description => lines[2..-2].join.chomp}
      
      sponsors << data
    end
    
    sponsors
  end
end
