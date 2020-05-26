module AlertHelper
  def alert_tag
    flash.inject(ActiveSupport::SafeBuffer.new) do |s, (k, v)|
      s.concat content_tag(:div, class: "tg-message #{error_class(k)}") {
        concat content_tag :div, v, class: 'tg-message-body'
      }
    end
  end

  private

  def error_class(key)
    # Semantic UI colors
    case key
    when 'alert'
      'yellow'
    when 'notice'
      'blue'
    when 'error'
      'red'
    else
      ''
    end
  end
end
