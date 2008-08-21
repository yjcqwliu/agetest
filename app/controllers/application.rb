# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  #protect_from_forgery # :secret => '5665551b9be34fc5fab08ba8d1f3ba16'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
   acts_as_xiaonei_controller
  before_filter :set_current_user

  def set_current_user
    if @current_user.nil?
      @current_user = User.find_or_create_by_xid(xiaonei_session.user.to_i)
      if @current_user.session_key != xiaonei_session.session_key
        @current_user.session_key = xiaonei_session.session_key
        @current_user.save
      end
    end

  end
  
  def current_user
    @current_user
  end
  
  def xn_redirect_to(path)
    render :text => "<xn:redirect url=\"#{path}\"/>"
  end

  def showmessage(feilds,to_url)
        path = "#{to_url}?"
        feilds.each do |key,value|
	     path += "#{key}=#{URI.escape(value)}&"
        end
	render :text => "<xn:redirect url=\"#{path}\"/>"
	return;
  end
end
