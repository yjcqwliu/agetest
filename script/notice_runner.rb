current_time = Time.now

User.find(:all,:order => " updated_at desc ").each do |user|
  begin
    notifications = [
                    "<a href='http://www.jiyiri.com/adindex.aspx?adid=de8c627e08e09045890a81602a79954c82fd'>还在为记不住恋人、亲人、朋友的生日发愁吗？诚邀您安记忆日，不再忘记亲友生日，免费邮件和短信提醒</a>"
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


