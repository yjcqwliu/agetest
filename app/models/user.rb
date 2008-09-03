class User < ActiveRecord::Base
    has_many :messages
 def xn_session
    @xn_session ||= Xiaonei::Session.new("xn_sig_session_key" => session_key, "xn_sig_user" => xid)
  end
end
