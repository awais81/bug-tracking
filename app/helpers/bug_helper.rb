module BugHelper
	def options_bug_status
		 	[['New', 'New'], ['Started', 'Started'],['Rersolved','Resolved']].each do |c|
		    [:option, c.first, value: c.first]
		  end
	end
	def options_feature_status
		 	[['New', 'New'], ['Started', 'Started'],['Completed','Completed']].each do |c|
		    [:option, c.first, value: c.first]
		  end
	end
	def options_bug_type
		 	[['Feature', 'Feature'], ['Bug', 'Bug']].each do |c|
		    [:option, c.first, value: c.first]
		  end
	end
	def options_newbug_status
		[['New', 'New'], ['Started', 'Started'],['','']].each do |c|
		    [:option, c.first, value: c.first]
		  end
	end
end