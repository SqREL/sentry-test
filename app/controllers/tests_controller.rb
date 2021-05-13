class TestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def asdf
    %w[Request-ID Sentry-Hook-Resource Sentry-Hook-Timestamp Sentry-Hook-Signature]
  end

  def create
    info = <<~BEGIN
      #{"="*100}
      
      Headers:
      #{ asdf.map { |x| "\t #{x} => #{request.headers[x.to_s]}" }.join("\n") }


      #{"-"*100}


      Logging request:
      \t #{request.raw_post}
      #{"="*100}
    BEGIN
    Rails.logger.info(info)
  end

  CustomErrorFour = Class.new(StandardError)

  def show
    "sending exception"
    raise CustomErrorFour, "error new 1"
  end
end
