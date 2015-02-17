(ns romanize.core
  (:gen-class))

(def table [[ 0    ""   ]
            [ 1    "I"  ]
            [ 4    "IV" ]
            [ 5    "V"  ]
            [ 9    "IX" ]
            [ 10   "X"  ]
            [ 40   "XL" ]
            [ 50   "L"  ]
            [ 90   "XC" ]
            [ 100  "C"  ]
            [ 400  "CD" ]
            [ 500  "D"  ]
            [ 900  "CM" ]
            [ 1000 "M"  ]])

(defn highest [n]
  (last (filter (fn [[value key]] (>= n value))
                table)))

(defn romanize [n]
  (let [[value key] (highest n)
        next (- n value)]
    (when (> value 0)
      (str key (romanize next)))))

(defn -main
  "Take STDIN number and convert it into roman numerals"
  [& args]
  (doseq [line (line-seq (java.io.BufferedReader. *in*))]
    (println (romanize (read-string line)))))
