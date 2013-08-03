dep 'heroku-toolbelt.managed' do
  provides 'heroku'
end

dep 'tmux.managed'
dep 'nmap.managed'
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
dep 'reattach-to-user-namespace.managed'
dep 'lunchy.gem'
dep 'fortune.managed'
dep 'cowsay.managed'
dep 'lolcat.gem'
dep 'gist.managed'
dep 'spark.managed'
dep 'bcat.gem'
dep 'ronn.gem'

dep 'vagrant.installer' do
  source 'http://files.vagrantup.com/packages/7ec0ee1d00a916f80b109a298bab08e391945243/Vagrant-1.2.7.dmg'
  provides 'vagrant'
end

dep 'htop-osx.managed' do
  provides 'htop'
end

dep 'moreutils.managed' do
  provides 'chronic', 'combine', 'ifne', 'isutf8', 'lckdo', 'mispipe',
    'parallel', 'pee', 'sponge', 'ts', 'vidir', 'vipe', 'zrun'
end

dep 'common-dev' do
  requires 'heroku-toolbelt.managed',
    'vagrant.installer',
    'tmux.managed',
    'nmap.managed',
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
    'reattach-to-user-namespace.managed',
    'htop-osx.managed',
    'moreutils.managed',
    'hub.managed',
    'lunchy.gem',
    'fortune.managed',
    'cowsay.managed',
    'lolcat.gem',
    'gist.managed',
    'spark.managed',
    'bcat.gem',
    'ronn.gem'
end
