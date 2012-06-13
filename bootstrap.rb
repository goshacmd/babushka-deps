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

dep 'bootstrap' do
  shell "echo 'export GITHUB_TOKEN=#{ENV['GITHUB_TOKEN']}' > #{ENV['HOME']}/.zshrc.local"
  requires 'system',
    'myfreeweb:ssh key exists',
    'projects',
    'dotfiles'.with('goshakkk'),
    'dbs',
    'ruby-dev',
    'common-dev'
  on :osx do
    requires 'mac-bootstrap'
  end
end
