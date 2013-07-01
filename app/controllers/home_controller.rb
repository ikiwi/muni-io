require 'net/http'
require 'uri'
require 'stringio'

class HomeController < ApplicationController
  def index
  end

  def show
    stdout = StringIO.new
    $stdout = stdout
    @route = 'F'
    @direction = 'F__OBCTRO'
    @stop = '3095'
    @ts = ''

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
    else    
      @predictionNumberForFirstPred = @predictionNumberForFirstPred + 'minute'
      if (@predictionNumberForFirstPred.to_i > 1)
        @predictionNumberForFirstPred = @predictionNumberForFirstPred + 's'
      end
    end

    pred = pred.partition(' </div>').last
    pred = pred.partition('<td class="predictionNumberForOtherPreds">').last
    pred = pred.partition('<div class="right">&nbsp;').last
    @predictionNumberForOtherPred = pred.partition(' </div>').first
    if (@predictionNumberForOtherPred =='')
      @predictionNumberForOtherPred = 'no other predictions'
    else
      @predictionNumberForOtherPred = @predictionNumberForOtherPred + 'minute'
      if (@predictionNumberForOtherPred.to_i > 1)
        @predictionNumberForOtherPred = @predictionNumberForOtherPred + 's'
      end
    end
  end
end
