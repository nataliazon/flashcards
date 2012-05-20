class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
before_filter :set_locale
 
def set_locale
  I18n.locale = I18n.default_locale
  
end
end
