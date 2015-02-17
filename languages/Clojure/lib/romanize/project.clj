(defproject romanize "0.1.0-SNAPSHOT"
  :description "Convert arabic numbers into roman numerals"
  :url "https://github.com/vigetlabs/romanize"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.6.0"]]
  :main ^:skip-aot romanize.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
