dep 'tmux.managed'
dep 'nmap.managed'
dep 'iftop.managed'
dep 'siege.managed'
dep 'httperf.managed'
dep 'wget.managed'
dep 'tree.managed'
dep 'multitail.managed'
dep 'rlwrap.managed'
dep 'pv.managed'
dep 'ctags.managed'
dep 'ack.managed'
dep 'hub.managed'
dep 'markdown.managed'
dep 'cloc.managed'
dep 'lunchy.gem'
dep 'terminal-notifier.gem'
dep 'cowsay.managed'
dep 'lolcat.gem'
dep 'gist.managed'
dep 'spark.managed'
dep 'bcat.gem'
dep 'ronn.gem'

dep 'terminal-notifier.app' do
  source 'https://github.com/downloads/alloy/terminal-notifier/terminal-notifier_1.4.2.zip'
end

dep 'htop-osx.managed' do
  provides 'htop'
end

dep 'moreutils.managed' do
  provides 'chronic', 'combine', 'ifne', 'isutf8', 'lckdo', 'mispipe',
    'parallel', 'pee', 'sponge', 'ts', 'vidir', 'vipe', 'zrun'
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
    'httperf.managed',
    'wget.managed',
    'tree.managed',
    'multitail.managed',
    'rlwrap.managed',
    'pv.managed',
    'ctags.managed',
    'ack.managed',
    'markdown.managed',
    'cloc.managed',
    'htop-osx.managed',
    'moreutils.managed',
    'hub.managed',
    'lunchy.gem',
    'terminal-notifier.gem',
    'terminal-notifier.app',
    'manservant',
    'cowsay.managed',
    'lolcat.gem',
    'gist.managed',
    'spark.managed',
    'bcat.gem',
    'ronn.gem'
end
