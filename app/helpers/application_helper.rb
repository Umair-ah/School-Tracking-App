module ApplicationHelper
    def boolean_label(value)
        case value
          when true
            content_tag(:span, value, class: "badge rounded-pill text-bg-primary")
          when false
            content_tag(:span, value, class: "badge rounded-pill text-bg-danger")
        end
    end
end
