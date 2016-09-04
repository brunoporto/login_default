module LoginDefaultHelper
  def bootstrap_class_for flash_type
    flash_type = flash_type.to_sym if flash_type.is_a?(String)
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-danger"
      when :alert
        "alert-warning"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end

  def current_provider
    session[:provider_info].present? ? session[:provider_info].symbolize_keys! : {provider: 'sistema'}
  end

  def devise_error_to_flash!
    if resource and resource.errors.full_messages.present?
      flash.now[:error] = resource.errors.full_messages.join("<br>").html_safe
    end
    #     return '' if resource.errors.empty?
    #     messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    #     html = <<-HTML
    # <div class="alert alert-error alert-danger"> <button type="button"
    # class="close" data-dismiss="alert">×</button>
    #   #{messages}
    # </div>
    #     HTML
    #
    #     html.html_safe
  end
end
