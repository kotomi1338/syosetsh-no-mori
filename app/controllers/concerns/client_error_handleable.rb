# ==============================================================================
# app - controllers - concerns - client error handleable
# ==============================================================================
module ClientErrorHandleable
  extend ActiveSupport::Concern

  def handle_400(error_details: [], link: nil)
    handle_error(
      title: 'Bad Request',
      status: 400,
      error_details: error_details,
      link: link,
    )
  end

  def handle_401(error_details: [], link: nil)
    handle_error(
      title: 'Unauthorized',
      status: 401,
      error_details: error_details,
      link: link,
    )
  end

  def handle_403(error_details: [], link: nil)
    handle_error(
      title: 'Forbidden',
      status: 403,
      error_details: error_details,
      link: link,
    )
  end

  def handle_404(error_details: [], link: nil)
    handle_error(
      title: 'Not Found',
      status: 404,
      error_details: error_details,
      link: link,
    )
  end

  private

  def handle_error(title: '', status: 0, error_details: [], link: nil)
    errors = error_details.map do |error_detail|
      {
        status: status,
        title: title,
        detail: error_detail,
        links: link,
      }
    end

    render json: { errors: errors.flatten }, status: status
  end
end
