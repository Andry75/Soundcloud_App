module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?
    render partial: '/devise/messages/errors',
           object: resource.errors.full_messages
  end
end
