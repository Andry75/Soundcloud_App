module ApplicationHelper
  def status_flash
    {}.tap do |messages|
      flash.each { |key, value| messages.update(message(key, value)) }
    end
  end

  def message(key, value)
    {}.tap do |content|
      content[message_key(key)] = value
    end
  end

  def message_key(key)
    case key
    when 'notice'
      :info
    when 'alert'
      :danger
    else
      key.to_sym
    end
  end
end
