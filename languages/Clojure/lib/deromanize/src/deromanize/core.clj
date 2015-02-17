(ns deromanize.core
  (:require [clojure.string :as str])
  (:gen-class))

(def table { "I" 1
             "V" 5
             "X" 10
             "L" 50
             "C" 100
             "D" 500
             "M" 1000 })

(defn convert
  [char]
  (get table char))

(defn digitize
  ([] 0)
  ([n] (convert n))
  ([head & tail] (let [a (convert head)
                       b (convert (first tail))]
                   (+ (if (< a b) (- a) a)
                      (apply digitize tail)))))

(defn -main
  "Take STDIN roman numerals and convert them to a decimal value"
  [& args]
  (doseq [line (line-seq (java.io.BufferedReader. *in*))]
    (println (apply digitize (str/split line #"")))))
