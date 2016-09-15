class ApplicationService
  def perform
    _perform
  end

  def errors
    @errors ||= []
  end

  def succes?
    errors.none?
  end

  def failed?
    errors.any?
  end

  protected

  def _perform
    fail 'This is abstract service'
  end
end
