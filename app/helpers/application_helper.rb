module ApplicationHelper
  def errors_for(model, attribute)
    if model.errors[attribute].present?
      content_tag :span, :class => 'error_explanation container-error' do
      model.errors[attribute].join(", ")
      end
    end
  end
end