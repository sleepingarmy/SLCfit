module ActivitiesHelper
	# Returns a dynamic path based on the provided parameters
	def sti_activity_path(type = "activity", activity = nil, action = nil)
	  send "#{format_sti(action, type, activity)}_path", activity
	end

	def format_sti(action, type, activity)
	  action || activity ?
	  "#{format_action(action)}#{type.underscore}" :
	  "#{type.underscore.pluralize}"
	end

	def format_action(action)
	  action ? "#{action}_" : ""
	end
end
