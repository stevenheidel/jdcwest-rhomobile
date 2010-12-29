require 'rho/rhocontroller'
require 'helpers/browser_helper'

class MoreController < Rho::RhoController
  include BrowserHelper

  #GET /More
  def index
    render
  end
  
  def contact
    render
  end
  
  def about
    render
  end

end