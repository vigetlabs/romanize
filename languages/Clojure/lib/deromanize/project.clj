(defproject deromanize "0.1.0-SNAPSHOT"
  :description "Convert roman numerals into arabic numbers"
  :url "https://github.com/vigetlabs/romanize"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.6.0"]]
  :main ^:skip-aot deromanize.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
