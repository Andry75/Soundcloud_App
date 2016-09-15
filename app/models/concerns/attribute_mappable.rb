module AttributeMappable
  extend ActiveSupport::Concern

  def initialize(attrs = {})
    attrs.each do |key, value|
      respond_to?("#{key}=") && send("#{key}=", value)
    end
  end

  def attributes
    @attributes ||= {}
  end
end
