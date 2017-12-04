module UsersHelper
  def getTime(datefilter)
    #datefilter=11%2F20%2F2017+-+11%2F29%2F2017
    timeStr=/(\d+)\/(\d+)\/(\d+) \- (\d+)\/(\d+)\/(\d+)/.match(datefilter)
    if !timeStr==nil?
      timeI = Array.new
      timeI << Date.new(timeStr[3].to_i,timeStr[1].to_i,timeStr[2].to_i).to_time.to_i + 21600
      timeI << Date.new(timeStr[6].to_i,timeStr[4].to_i,timeStr[5].to_i).to_time.to_i + 21600 + 86400
      return timeI
    else
      return nil
    end
  end
end
