class Message < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :message
  #def before_save
   # self.from_id = @current_user.id
  #end
end
