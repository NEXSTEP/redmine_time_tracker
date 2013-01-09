class TtDateShifterController < ApplicationController
  before_filter :authorize_global
  accept_api_auth :get_prev_time_span, :get_next_time_span, :get_time_span

  def get_prev_time_span
    get_time_span(1)
  end

  def get_next_time_span
    get_time_span(2)
  end

  private

  def get_time_span (type)
    ds = TtDateShifter.new(:start_date => params[:date1], :stop_date => params[:date2], :op => params[:op])
    if type == 1 # prev
      ds.get_prev_time_span
    elsif type == 2 # next
      ds.get_next_time_span
    end
    respond_to do |format|
      format.json { render :json => ds }
    end
  end
end
