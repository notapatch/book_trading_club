module ApplicationHelper
  MESSAGES = { notice: ['message message--notice', 'info-circle 2x'],
               alert:  ['message message--alert', 'bell 2x'] }.freeze
  def messages(name, msg)
    message = MESSAGES[name.to_sym]
    content_tag :div, class: 'js-slow-time ' + message[0] do
      content_tag :div, class: 'layout__w-wrapper' do
        content_tag(:span, fa_icon(message[1], text: msg))
      end
    end
  end

  def show_errors(object, field_name)
    return if object.errors.empty? && object.errors.messages[field_name].blank?

    object.errors.messages[field_name].join(', ')
  end
end
