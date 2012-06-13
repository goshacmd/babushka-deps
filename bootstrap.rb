dep 'projects' do
  met? { (ENV['HOME'] / 'Projects').dir? }
  meet { log_shell 'Make ~/Projects', 'mkdir ~/Projects' }
end

dep 'dotfiles', :user do
  requires 'benhoskings:zsh', 'tsommer:oh-my-zsh'
  dpath = ENV['HOME'] / 'Projects/dotfiles'
  met? { File.exists? dpath }
  meet {
    git "git@github.com:#{user}/dotfiles.git", :to => dpath
    cd(dpath) {
      shell 'git submodule update --init --recursive'
      shell 'zsh install.sh'
    }
  }
end

dep 'zsh.managed'

dep 'oh-my-zsh' do
  requires 'zsh.managed'
  met? { (ENV['HOME'] / '.oh-my-zsh').dir? }
  meet {
    shell 'curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh'
  }
end

dep 'janus' do
  met? { (ENV['HOME'] / '.vim/janus').dir? }
  meet { shell 'curl -Lo- https://bit.ly/janus-bootstrap | bash' }
end

dep 'bootstrap' do
  shell "echo 'export GITHUB_TOKEN=#{ENV['GITHUB_TOKEN']}' > #{ENV['HOME']}/.zshrc.local"
  requires 'system',
    'myfreeweb:ssh key exists',
    'projects',
    'dotfiles'.with('goshakkk'),
    'zsh.managed',
    'oh-my-zsh',
    'dbs',
    'ruby-dev',
    'common-dev',
    'janus'
  on :osx do
    requires 'mac-bootstrap'
  end
end
