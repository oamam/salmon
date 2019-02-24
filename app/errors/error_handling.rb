module ErrorHandling
  # This method is called after a module is included into other modules or classes by include method.
  def self.included(klass)
    # This method executes a block as if it are codes in class defines and module defines.
    klass.class_eval do
      rescue_from ActiveRecord::RecordNotFound do |e|
        respond(404, e.to_s)
      end
      rescue_from ActiveRecord::ActiveRecordError do |e|
        respond(422, e.to_s)
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        respond(501, 'ngngngng')
      end
    end
  end

  private 

  def respond(status, message)
    render json: {
      status: status,
      message: message
    }
  end
end