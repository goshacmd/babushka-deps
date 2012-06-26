dep 'clojure.managed' do
  provides 'clj'
end

dep 'cljr' do
  met? { which 'cljr' }
  meet { shell 'wget http://incanter.org/downloads/cljr-installer.jar && java -jar cljr-installer.jar' }
end

dep 'clojure-dev' do
  requires 'clojure.managed',
    'cljr'
end
