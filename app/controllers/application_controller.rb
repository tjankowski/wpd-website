# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  require File.join(Rails.root, 'lib', 'authenticated_system.rb')
  include AuthenticatedSystem
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :global_vars

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def global_vars
    @title = 'Wytwarzanie Pomocy Dydaktycznych: Pomoce dydaktyczne, szkolne i naukowe dla przedszkoli szkoł'
    @desription = ''
    @keywords = 'pomoce dydaktyczne, pomoce szkolne, pomoce naukowe, pomoce dydaktyczne dla szkół, pomoce dydaktyczne dla przedszkoli, radosna szkoła, Wytwarzanie Pomocy Dydaktycznych, wpd, wpd.pl'
  end
end
