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

dep '1.9.3-p429.rbenv'

dep '1.9.3-p429 global' do
  requires '1.9.3-p429.rbenv'

  met? { `rbenv global`.include? '1.9.3-p429' }
  meet {
    shell 'rbenv global 1.9.3-p429'
  }
  after { log_shell 'rbenv rehash', 'rbenv rehash' }
end

dep 'bundler.gem' do
  provides 'bundle'
end

dep 'pry.gem'
dep 'powder.gem'

dep 'pow.managed'

dep 'ruby-dev' do
  requires 'rbenv.managed',
    'ruby-build.managed',
    '1.9.3-p429.rbenv',
    '1.9.3-p429 global',
    'bundler.gem',
    'pry.gem',
    'powder.gem'
end
