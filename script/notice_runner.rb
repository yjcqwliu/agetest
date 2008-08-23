current_time = Time.now

User.find(:all,:order => " updated_at desc ").each do |user|
  begin
    notifications = [
                    "<a href='http://apps.xiaonei.com/beautypk/homes/show'>诚邀您安装美容达人PK赛，这里有你不知道的美容问题，并且有大牌的实物化妆品赠送！</a>"
                    ]
    res_note = user.xn_session.invoke_method("xiaonei.notifications.send", 
                                                    :to_ids => [user.xid].join(","), 
                                                    :notification => notifications.rand)
    
   # res_feed = user.xn_session.invoke_method("xiaonei.feed.publishTemplatizedAction", 
    #                                                :title_data => { 
     #                                               }.to_json,
      #                                              :body_data => { 
       #                                               :my_uid => user.xid,
         #                                             :age => user.age,
        #                                            }.to_json,
          #                                          :template_id => 1)
    
    puts "#{current_time}: process user #{user.id}:  #{res_note.inspect}"
    
    user.sent = true
    user.save
  rescue Exception => exp
    puts "exp: #{exp.inspect}"
  end
end


