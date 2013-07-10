require 'net/http'
require 'uri'
require 'stringio'

class HomeController < ApplicationController
  def index
    @routes = Route.order(:r_id)
    @stops = Stop.order(:s_id)
    @ib_lines = LineItem.order(:route_id)
    @ob_lines = ObLineItem.order(:route_id)
  end

  def get_stop_desc(stop_id)
    Stop.find_by_s_id(stop_id)
  end

  def show
    stdout = StringIO.new
    $stdout = stdout
    @ts = ''
    @route = params[:route]
    @direction = params[:direction]
    @stop = params[:stop]

    @route = @route.sub("_OWL", "+OWL")
    # get the data
  	@url = 'http://www.nextbus.com/predictor/fancyNewPredictionLayer.jsp?a=sf-muni&r='\
           + @route + '&d=' + @direction + '&s=' + @stop + '&ts=' + @ts
  	uri = URI(@url)
    @res = Net::HTTP.get_print(uri)

    # redirect stardard output to string
    $stdout = STDOUT
    stdout.rewind

    # parse the string to get the numbers that we need
    pred = stdout.string.partition('class="predictionNumberForFirstPred">').last
    if (pred == '')
      @predictionNumberForFirstPred = 'no predictions'
    elsif (pred == 'Arriving')
      @predictionNumberForFirstPred = 'Arriving'
    else
      pred = pred.partition('<div class="right">&nbsp;').last
      @predictionNumberForFirstPred = pred.partition(' </div>').first
    end

    pred = pred.partition(' </div>').last
    pred = pred.partition('class="predictionNumberForOtherPreds">').last
    if (pred == '')
      @predictionNumberForOtherPred = 'no other predictions'
    elsif (pred == 'Arriving')
      @predictionNumberForOtherPred = 'Arriving'
    else
      pred = pred.partition('<div class="right">&nbsp;').last
      @predictionNumberForOtherPred = pred.partition(' </div>').first
    end
  end
end
