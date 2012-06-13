dep 'rbenv.managed'
dep 'ruby-build.managed'

meta :rbenv do
  template {
    def version
      name.sub '.rbenv', ''
    end

    requires 'rbenv.managed', 'ruby-build.managed'

    met? { `rbenv versions`.include? version }
    meet {
      shell "rbenv install #{version}"
    }
    after { log_shell 'rbenv rehash', 'rbenv rehash' }
  }
end

dep '1.9.3-p194.rbenv'

dep 'bundler.gem' do
  provides 'bundle'
end

dep 'pry.gem'
dep 'powder.gem'

dep 'heroku.gem' do
  after do
    system 'heroku login'
  end
end

dep 'pow.managed'

dep 'ruby-dev' do
  requires 'rbenv.managed',
    'ruby-build.managed',
    '1.9.3-p194.rbenv',
    'bundler.gem',
    'heroku.gem',
    'pry.gem',
    'powder.gem'
end
