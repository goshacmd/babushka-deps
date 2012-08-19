dep 'tmux.managed'
dep 'nmap.managed'
dep 'iftop.managed'
dep 'siege.managed'
dep 'wget.managed'
dep 'tree.managed'
dep 'ctags.managed'
dep 'ack.managed'
dep 'hub.managed'
dep 'lunchy.gem'
dep 'terminal-notifier.gem'
dep 'cowsay.managed'
dep 'lolcat.gem'

dep 'terminal-notifier.app' do
  source 'https://github.com/downloads/alloy/terminal-notifier/terminal-notifier_1.4.2.zip'
end

dep 'htop-osx.managed' do
  provides 'htop'
end

dep 'manservant' do
  requires 'pow.managed'

  met? { (ENV['HOME'] / '.pow/man').dir? }
  meet { git "git://github.com/jimeh/manservant.git", :to => ENV['HOME'] / '.pow/man' }
end

dep 'common-dev' do
  requires 'tmux.managed',
    'nmap.managed',
    'iftop.managed',
    'siege.managed',
    'wget.managed',
    'tree.managed',
    'ctags.managed',
    'ack.managed',
    'htop-osx.managed',
    'hub.managed',
    'lunchy.gem',
    'terminal-notifier.gem',
    'terminal-notifier.app',
    'manservant',
    'cowsay.managed',
    'lolcat.gem'
end
