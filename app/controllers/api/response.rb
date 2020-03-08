module Api::Response
  def response_with_message(status, message)
    { status: status, message: message }
  end

  def response_with_id(status, message, id)
    { status: status, message: message, id: id }
  end

  def error_response(
    message = 'Something is wrong with the parameters or the request itself',
    status = 400,
    error_category = 'Error'
  )
    render json: response_with_message(error_category || 'Error', message), status: status
  end

  def successful_response(message, status = :ok)
    render json: response_with_message('Success', message), status: status
  end

  def successful_post(id, message = 'Record Created Successfully',
                      status = 'Success')
    render json: response_with_id(status, message, id), status: :created
  end

  def successful_delete(message = 'Record Deleted Successfully')
    successful_response(message)
  end

  def unprocessable_entity(
    message = 'There is a problem with the request body you sent'
  )
    render json: response_with_message('Error', message),
           status: :unprocessable_entity
  end

  def not_found(message = 'Record not found')
    render json: response_with_message('Error', message), status: :not_found
  end
end
