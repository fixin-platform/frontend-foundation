# coffee -o /tmp -c public/images/download-apps.coffee && xsel --clipboard < /tmp/download-apps.js
# while read -r url filename tail; do   wget -O "$filename" "$url" || err=1; done < ../download-apps.wget

if not window.saveAs
  script = document.createElement("script")
  script.type = "text/javascript"
  script.src = "https://rawgit.com/eligrey/FileSaver.js/master/FileSaver.min.js"
  document.getElementsByTagName("head")[0].appendChild script

downloads = []
apps = []
excludedNameParts = ["Android", "iOS", "Wink", "WeMo"]
excludedKeys = ["Automatic", "blink1", "Blogger", "IsItChristmas", "SMS", "Space", "PhoneCall", "Feed", "Weather", "TheNewYork", "Yo", "Appnet", "AppZapp", "BestBuy", "Boxcar2", "BoxohPackageTracking", "Bttn", "BuzzFeed", "Chain", "Dailymotion", "Dash", "DateTime", "Digg", "Email", "EmailDigest", "EntertainmentWeekly", "ESPN", "Eyefi", "FacebookGroups", "FacebookPages", "ffffound", "Fitbit", "FollowUpcc", "Foursquare", "Giphy", "Garageio", "GitHub", "Harmony", "Homeboy", "Honeywellevohome", "HoneywellSinglezoneThermostat", "IFTTT", "Instapush", "InStyle", "JetSetMe", "LaunchCenter", "LIFX", "Life360", "Manything", "Misfit", "MixRadio", "Myfox", "NestProtect", "NestThermostat", "NetatmoWeatherStation", "NewsBlur", "Nike", "NowVia", "Numerous", "ORBneXt", "ParrotFlowerPower", "People", "Philipshue", "Printhug", "Pryv", "Pushalot", "Pushbullet", "Pushover", "RachioIro", "Readability", "ReadingPack", "Revolv", "Saga", "ShopYourWay", "SinaWeibo", "Slice", "Smappee", "SmartThings", "Spark", "SportsIllustrated", "Stockimo", "Stocks", "Storify", "SunlightFoundation", "Surfline", "TheNewYorkTimes", "Time", "Ubi", "UPbyJawbone", "Whistle", "Withings", "YahooFantasySports", "QualityTime"]
$(".channel").each (index, channel) ->
  $channel = $(channel)
  data = JSON.parse($channel.find("[data-track-data]").attr("data-track-data"))
  name = $channel.find(".channel_title").text().trim()
  key = name.replace(/[^\w]/ig, "")
  originalSrc = $channel.find(".channel-icon").attr("src")
  for excludedNamePart in excludedNameParts
    if ~name.indexOf(excludedNamePart)
      return
  if key in excludedKeys
    return
  apps.push(
    key: key
    name: name
  )
  downloads.push(originalSrc + " " + key + ".png")

console.log(JSON.stringify(apps))
#console.log(downloads.join("\n") + "\n") # wget requires last newline
