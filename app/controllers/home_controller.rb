class HomeController < ApplicationController
def index
  action=params[:act]
  
  if action then
     
    n=params[:n].to_i
	ids=params[:ids]
	if ids.length != 5 then
	xn_redirect_to("home/invite?age=#{n}")
	end 
	
	@current_user.age=n
	@current_user.sent=false
	@current_user.save
	if n >= 0 and n < 18 then 

		m = " 你心理尚处在儿童、少年时期。想取悦别人，总喜欢被人表扬，他人的肯定才能令你肯定自己。渴望从人家那里获得情感上的安慰和支持。情绪起伏大。对新事物有强烈的好奇心。不切实际是你最大的优点和缺点。它让你更能感受快乐，也让你在生活中时常受挫。"

	else
		if n >= 18 and n < 30 then 
	
			m = " 你心理处在青年时期。内心不能平息的矛盾冲突是此时你最明显的特征。你渴望独立自主自由洒脱，但还没有摆脱他人的阴影，那第三只眼随时监控着你，你的一举一动在儿童时期是为具体的他人满意，现在是为让这第三只眼满意，本能与人为，现实与理想，自我与超我，这种种矛盾的痛苦是推动人格发展的动力。"
	
		else
			if n >= 30 and n < 50 then 
		
				m = " 你的心理处在成年时期。你成熟、稳健、老练、实际，能够合情合理地处理现实人生、理想的种种矛盾，比较理智地看待完美与缺陷，获得与丧失。清楚地认识自己，能清明地分辨可能与不能，可为与不可为。但这种状态稍有偏失，你就会走进保守与停滞，也容易导致的将是创造性和人生乐趣的丧失。"
		
			else
				if n >= 50 and n < 70 then 
			
					m = " 你的心理处在老年时期。你已经经历过很多是是非非，凡事都已经看得开了。岁月的洗礼，让你知道生命的宝贵，情感的珍贵，你不会再有太多的冲动，只想心平气和的享受生活，享受生命赐予你的欢乐。"
			
				else
			
					m = " 要么你是个很奇怪的人，建议你你重新认真答一遍题。"
			
				end 
			end 
		end
	end 
	@notice="<center><h3>你的心里年龄是:#{n}</h3></center><br>#{m}<br><a href=\"http://fend.cn\" target=\"_blank\">恭喜你，获取校内模板一份</a>"
  end 
end 
def invite
	
	
	@age=params[:age].to_i || 2
	params.each do |key, value|
		tmp_arr = key.split("_")
		
		if tmp_arr[0] == "itemids" then
		    @age += value.to_i
		end
	end 

	if @age < 12 then 
		@age += 6
	end 
	
end 
def friends
    @friends=User.find(:all,
	                   :conditions =>[ " xid in (?) " , @current_user.friend_ids ],
					   :order => " updated_at desc "
					  )
end

def me
    @friends=[@current_user]
	render :action => "friends"
end 

def add_message
    Message.create(params[:message].merge(:user => current_user))
    xn_redirect_to("home/friends")

  end
end
