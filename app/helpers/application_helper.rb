module ApplicationHelper

  # General messages errors
  def error_messages(obj)
    return "" if obj.errors.empty?

    messages = obj.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
      :count => obj.errors.count,
      :resource => obj.class.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-warning alert-dismissible" role="alert">
      <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <strong>#{sentence}</strong>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  def app_error_messages(obj)
    obj.errors.empty? ? false : true
  end
  # -- messages erros end

  # Admins icons
  def container_brand(model)
    case model
    when 'batman'
      icon('batman fa-lg')
    end
  end

  
end