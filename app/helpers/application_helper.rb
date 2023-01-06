module ApplicationHelper
    def boolean_label(value)
        case value
            when true
                content_tag(:span, value, class: "btn btn-success btn-sm disabled")
            when false
                content_tag(:span, value, class: "btn btn-danger btn-sm disabled")
        end
    end
end
