class AirstripController < ApplicationController

  before_action :prepare_planes_count, only: :launch_planes

  def index
    @last_events = 
      if params[:later_than]
        AirstripLog.order('created_at DESC').where('id > ?', params[:later_than])
      else
        AirstripLog.order('created_at DESC').limit(10)
      end
    respond_to do |format|
      format.html
      format.js { render 'events' }
    end
  end

  def launch_planes
    params[:planes_count].to_i.times.each do 
      #Airplane.new.delay.launch
      AirstripWorker.perform_async()
    end
    respond_to do |format|
      format.html { redirect_to airstrip_path }
      format.js { render nothing: true }
    end
  end

  private
    def prepare_planes_count

    end

end
