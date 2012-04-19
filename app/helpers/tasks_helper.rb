# -*- coding: utf-8 -*-
module TasksHelper
	def navigation_links
		items = []
		items << link_or_text('未完了タスク', :tasks)
		items << link_or_text('完了したタスク', [:done, :tasks])
		content_tag(:ul, :class => 'navigation') {items.join.html_safe}
	end
	
	private
	def link_or_text(text, resource)
		html_class = current_page?(resources) ? 'selected' :nil
		content_tag(:li, :class => html_class) do
			link_to_unless_corrent(text, resource)
		end
	end
end
