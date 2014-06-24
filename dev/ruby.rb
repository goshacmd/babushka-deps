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

dep '2.1.0-p0.rbenv'

dep '2.1.0-p0 global' do
  requires '2.1.0-p0.rbenv'

  met? { `rbenv global`.include? '2.1.0-p0' }
  meet {
    shell 'rbenv global 2.1.0-p0'
  }
  after { log_shell 'rbenv rehash', 'rbenv rehash' }
end

dep 'bundler.gem' do
  provides 'bundle'
end

dep 'pry.gem'

dep 'ruby-dev' do
  requires 'rbenv.managed',
    'ruby-build.managed',
    '2.1.0-p0 global',
    'bundler.gem',
    'pry.gem',
    'powder.gem'
end
