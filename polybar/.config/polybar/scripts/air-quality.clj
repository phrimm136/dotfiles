#!/bin/bb

(use '[clojure.java.shell :only [sh]])
(require '[babashka.curl :as curl])
(require '[cheshire.core :as json])

(def token (slurp "/home/user/.private/pollution-key"))
(def api "https://api.waqi.info/feed")

(defn get-location []
  (let [location (-> (curl/get "https://location.services.mozilla.com/v1/geolocate?key=geoclue")
                     :body
                     json/parse-string
                     (get "location"))
        location-lat (get location "lat")
        location-lon (get location "lng")]
    [location-lat location-lon]))

(defn air-url [[location-lat location-lon]]
  (format "%s/geo:%s;%s/?token=%s"
          api
          location-lat
          location-lon
          token))

(defn get-air-string [aqi]
  (cond (= aqi "-") "%{F#ffffff}%{F-}"
        (< aqi 50) (str "%{F#009966}%{F-} " aqi)
        (< aqi 100) (str "%{F#ffde33}%{F-} " aqi)
        (< aqi 150) (str "%{F#ff9933}%{F-} " aqi)
        (< aqi 200) (str "%{F#cc0033}%{F-} " aqi)
        (< aqi 300) (str "%{F#660099}%{F-} " aqi)
        :else (str "%{F#7e0023}%{F-} " aqi)))

(defn show-air-quality []
  (let [air (-> (curl/get (air-url (get-location))) :body json/parse-string)]
    (if (= (get air "status") "ok")
      (print (get-air-string (get-in air ["data" "aqi"])))
      (print (get air "data")))))

(show-air-quality)
