module ApplicationHelper
  def yield_or_default(section, default = '')
    tag_text = content_for(section)
    # if content_for() not set, use "lazy" lookup to check locale file for controller/action entry
    if tag_text.blank?
      tag_text = get_header_text(element: section, page_name: "#{controller_name}.#{action_name}", no_msg: true)
      tag_text = default if tag_text.blank? # use optional default as last resort
    end
    tag_text
  end
end
