dep 'tmux.managed'
dep 'wget.managed'
dep 'tree.managed'
dep 'ctags.managed'
dep 'ack.managed'
dep 'hub.managed'

dep 'manservant' do
  requires 'pow.managed'

  met? { (ENV['HOME'] / '.pow/man').dir? }
  meet { git "git://github.com/jimeh/manservant.git", :to => ENV['HOME'] / '.pow/man' }
end

dep 'common-dev' do
  requires 'tmux.managed',
    'wget.managed',
    'tree.managed',
    'ctags.managed',
    'ack.managed',
    'hub.managed',
    'manservant'
end
