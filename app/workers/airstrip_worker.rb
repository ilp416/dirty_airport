class AirstripWorker
  include Sidekiq::Worker

  Sidekiq::Queue['default'].limit = 1

  def perform
    Rails.logger.info "performing"
    Airplane.new.launch
    Rails.logger.info "FINISH"
  end
end
