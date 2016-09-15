module DeleteWithAttachments
  def destroy
    %i(artwork data_set avatar).each do |attr|
      respond_to?("#{attr}=") && send("#{attr}=", nil)
    end
    super
  end
end
