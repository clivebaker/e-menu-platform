module TablesHelper
  def node_print(level)
    "<div class='row'><div class='col'>#{render "tables/#{level.node_type}", menu: level, level: 1}</div></div>".html_safe
  end

  def render_nested_groups(groups)
    s = content_tag(:ul) do
      groups.map do |group, sub_groups|
        content_tag(:li, (group.title + nested_groups(sub_groups)).html_safe)
      end.join.html_safe
    end
  end
end
