#!/bin/bb

(use '[clojure.java.shell :only [sh]])
(use 'clojure.string)
(require '[babashka.curl :as curl])
(require '[cheshire.core :as json])

(defn get-icon [weather]
  (case weather
  "01d" ""
  "01n" ""
  "02d" ""
  "02n" ""
  "03d" ""
  "03n" ""
  "04d" ""
  "04n" ""
  "09d" ""
  "09n" ""
  "10d" ""
  "10n" ""
  "11d" ""
  "11n" ""
  "13d" ""
  "13n" ""
  "50d" ""
  "50n" ""
  ""))

(def weather-key (slurp "/home/user/.private/weather-key"))
(def units "metric")
(def degree "°")
(def api "https://api.openweathermap.org/data/2.5")

(defn get-location []
  (let [location (-> (curl/get "https://location.services.mozilla.com/v1/geolocate?key=geoclue")
                     :body
                     json/parse-string
                     (get "location"))
        location-lat (get location "lat")
        location-lon (get location "lng")]
    [location-lat location-lon]))

(defn current-url [[location-lat location-lon]]
  (format "%s/weather?appid=%s&lat=%s&lon=%s&units=%s"
          api
          weather-key
          location-lat
          location-lon
          units))

(defn forecast-url [[location-lat location-lon]]
  (format "%s/forecast?appid=%s&lat=%s&lon=%s&units=%s&cnt=2" ;; 6 hour forecast
          api 
          weather-key
          location-lat
          location-lon
          units))

(defn get-duration [date]
  (-> (sh "date" (format "--date=@%s" date) "-u" "+%H:%M") :out))

(defn get-trend [current-temp forecast-temp]
  (cond (> current-temp forecast-temp) ""
        (< current-temp forecast-temp) ""
        :else ""))

(defn get-daytime [current]
  (let [sunrise (get-in current ["sys" "sunrise"])
        sunset (get-in current ["sys" "sunrise"])
        now (-> (sh "date" "+%s") :out trim read-string)]
    (cond (> sunrise now) (format "  %s" (get-duration (- sunrise now)))
          (> sunset now) (format "  %s" (get-duration (- sunset now)))
          :else (format "  %s" (get-duration (- sunrise now))))))

(defn show-weather []
  (let [current (-> (curl/get (current-url (get-location))) :body json/parse-string) 
        forecast (-> (curl/get (forecast-url (get-location))) :body json/parse-string)
        current-temp (get-in current ["main" "temp"])
        current-icon (get-in current ["weather" 0 "icon"])
        forecast-temp (get-in forecast ["list" 0 "main" "temp"])
        forecast-icon  (get-in forecast ["list" 1 "weather" 0 "icon"])
        trend (get-trend current-temp forecast-temp)
        daytime (get-daytime current)]
     (print (format "%s  %s%s %s %s  %s%s  %s"
            (get-icon current-icon)
            current-temp
            degree
            trend
            (get-icon forecast-icon)
            forecast-temp
            degree
            daytime))))

(show-weather)
