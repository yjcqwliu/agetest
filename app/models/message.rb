class Message < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :message
  #def before_save
  #  self.user_xid = @current_user.xid
  #end
end