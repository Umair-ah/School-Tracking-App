module ApplicationHelper
    def boolean_label(value)
        case value
          when true
            content_tag(:span, value, class: "badge rounded-pill text-bg-primary")
          when false
            content_tag(:span, value, class: "badge rounded-pill text-bg-danger")
        end
    end

    def status_label(status)
      case status
      when "planned"
        content_tag(:span, status.titleize, class: "badge text-bg-warning") 
      when "confirmed"
        content_tag(:span, status.titleize, class: "badge text-bg-success")
      when "cancelled"
        content_tag(:span, status.titleize, class: "badge text-bg-danger")
      when "attended"
        content_tag(:span, status.titleize, class: "badge text-bg-success")
      when "not_attended"
        content_tag(:span, status.titleize, class: "badge text-bg-danger")
      end
    end
end
