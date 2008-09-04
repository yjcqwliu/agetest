current_time = Time.now

Message.find(:all,:conditions =>[" notified = false "], :order => " updated_at desc ").each do |message|
  begin
    fromuser=User.find(message.from_id)
	if fromuser then
	
    notifications = [
                    "<xn:name uid=\"#{message.user_xid}\" \/>看到了你的心理年龄，奸笑了一声说了句***，<a href=\"http://apps.xiaonei.com/agetest/home/me\">点击查看</a>"
                    ]
    res_note = fromuser.xn_session.invoke_method("xiaonei.notifications.send", 
                                                    :to_ids => message.target_xid, 
                                                    :notification => notifications.rand)
    
   # res_feed = user.xn_session.invoke_method("xiaonei.feed.publishTemplatizedAction", 
    #                                                :title_data => { 
     #                                               }.to_json,
      #                                              :body_data => { 
       #                                               :my_uid => user.xid,
         #                                             :age => user.age,
        #                                            }.to_json,
          #                                          :template_id => 1)
    
    puts "#{current_time}: process message #{message.id}:  #{res_note.inspect}"
    end
    message.notified = true
    message.save
  rescue Exception => exp
    puts "exp: #{exp.inspect}"
  end
end


