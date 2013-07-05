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
#    @route = 'F'
#    @direction = 'F__OBCTRO'
#    @stop = '3095'
    @ts = ''
    @route = params[:route]
    @direction = params[:direction]
    @stop = params[:stop]

    # get the data
  	@url = 'http://www.nextbus.com/predictor/fancyNewPredictionLayer.jsp?a=sf-muni&r='\
           + @route + '&d=' + @direction + '&s=' + @stop + '&ts=' + @ts
  	uri = URI(@url)
    @res = Net::HTTP.get_print(uri)

    # redirect stardard output to string
    $stdout = STDOUT
    stdout.rewind

    # parse the string to get the numbers that we need
    pred = stdout.string.partition('<td class="predictionNumberForFirstPred">').last
    pred = pred.partition('<div class="right">&nbsp;').last
    @predictionNumberForFirstPred = pred.partition(' </div>').first
    if (@predictionNumForFirstPred == '')
      @predictionNumberForFirstPred = 'no predictions'  
    end

    pred = pred.partition(' </div>').last
    pred = pred.partition('<td class="predictionNumberForOtherPreds">').last
    pred = pred.partition('<div class="right">&nbsp;').last
    @predictionNumberForOtherPred = pred.partition(' </div>').first
    if (@predictionNumberForOtherPred =='')
      @predictionNumberForOtherPred = 'no other predictions'
    end
  end
end
