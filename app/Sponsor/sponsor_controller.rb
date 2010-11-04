require 'rho/rhocontroller'
require 'helpers/browser_helper'

class SponsorController < Rho::RhoController
  include BrowserHelper

  #GET /Sponsor
  def index
    @sponsors = Sponsor.find(:all)
    
    unless @sponsors.size > 0
      Sponsor.seed
      @sponsors = Sponsor.find(:all)
    end
      
    render
  end

  # GET /Sponsor/{1}
  def show
    @sponsor = Sponsor.find(@params['id'])
    if @sponsor
      render :action => :show
    else
      redirect :action => :index
    end
  end
end
