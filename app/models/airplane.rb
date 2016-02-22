class Airplane

  def launch
    Rails.logger.info "Start launching"
    AirstripLog.create(state: "Start launching #{self.object_id}")
    sleep 10
    Rails.logger.info "Launched!"
    AirstripLog.create(state: "Launched! #{self.object_id}")
    self
  end

end
