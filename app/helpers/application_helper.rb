module ApplicationHelper
	def options_user_type
		 [['Manager', 'Manager'], ['Developer', 'Developer'],['QA','QA']].each do |c|
		    [:option, c.first, value: c.first]
		  end
	end
	
	
	
end

