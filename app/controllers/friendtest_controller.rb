class FriendtestController < ApplicationController
def index
     act=params[:act]
	 if act=="post" then
	       target_xid=params[:ids]
		   target_name=params[:diyid]
	       @notice="你 和 "
		   if target_xid then
		        @notice+="<xn\:name uid=\"#{target_xid}\"\/>"
				target_name=target_xid
		   else
		        @notice+=target_name
		   end
		   resualt=cp(current_user.xid,target_name)
		   @notice+=" 命中注定为：#{resualt}"
		   
		   friendtest=Friendtest.new
			   friendtest.user_id=current_user.id
			   if target_xid then
					friendtest.target_xid=target_xid
					friendtest.target_name="<xn\:name uid=\"#{target_xid}\"\/>"
			   else
					friendtest.target_name=target_name
			   end
			   friendtest.resualt=resualt
			   friendtest.notified=false
			   friendtest.sent=false
		   friendtest.save
	 end
end
private
  WISH = [ "水火不相容",
           "永远和你在一起",
           "亲密无间",
           "知心朋友",
           "心上人",
           "帮你做事的人",
           "帮你的人",
           "面和心不合",
           "男女关系不正常",
           "情投意合",
           "关系马马虎虎",
           "尊敬你的人",
           "爱你的人",
           "适合你的",
           "说你坏话的人",
           "克星",
           "救星",
           "忠心的人",
           "缘定三生",
           "单相思",
           "山盟海誓",
           "情敌",
		   "服从你的人",
		   "永远在一起",
		   "伴终生",
		   "恨你又爱你"
		    ]
   
  
def cp(u1,u2)
    code1=0
	code2=0
	u1.to_s.each_byte{|c| code1+=c}
	u2.to_s.each_byte{|c| code2+=c}
	v=(code1-code2).abs % WISH.length
	resualt=WISH[v]
end
end
