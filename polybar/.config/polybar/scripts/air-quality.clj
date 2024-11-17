#!/bin/bb

(use '[clojure.java.shell :only [sh]])
(use 'clojure.string)
(require '[babashka.curl :as curl])
(require '[cheshire.core :as json])

(def token (trim (slurp "/home/user/.private/pollution-key")))
(def api "https://api.waqi.info/feed")

(defn get-location []
  (let [location (-> (curl/get "http://ipwho.is/")
                     :body
                     json/parse-string)
        location-lat (get location "latitude")
        location-lon (get location "longitude")]
    [location-lat location-lon]))

(defn air-url [[location-lat location-lon]]
  (format "%s/geo:%s;%s/?token=%s"
          api
          location-lat
          location-lon
          token))

(defn get-air-string [aqi]
  (cond (= aqi "-") "%{F#ffffff}󰌪%{F-}"
        (< aqi 50) (str "%{F#009966}󰌪%{F-} " aqi)
        (< aqi 100) (str "%{F#ffde33}󰌪%{F-} " aqi)
        (< aqi 150) (str "%{F#ff9933}󰌪%{F-} " aqi)
        (< aqi 200) (str "%{F#cc0033}󰌪%{F-} " aqi)
        (< aqi 300) (str "%{F#660099}󰌪%{F-} " aqi)
        :else (str "%{F#7e0023}󰌪%{F-} " aqi)))

(defn show-air-quality []
  (let [air (-> (curl/get (air-url (get-location))) :body json/parse-string)]
    (if (= (get air "status") "ok")
      (print (get-air-string (get-in air ["data" "aqi"])))
      (print (get air "data")))))

(show-air-quality)
