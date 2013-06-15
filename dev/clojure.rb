dep 'clojure.managed' do
  provides 'clj'
end

dep 'clojure-dev' do
  requires 'clojure.managed'
end
