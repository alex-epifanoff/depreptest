require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'
#require 'debrep'

class ReportingController < Rho::RhoController
  include BrowserHelper
  
  def makeReport
  	Rho::DebRep.prepareReport
  	
    Rho::WebView.navigate( '/app' )
    render :string => 'AZAZA'
  end
  
end
