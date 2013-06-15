dep 'projects' do
  met? { (ENV['HOME'] / 'Projects').dir? }
  meet { log_shell 'Make ~/Projects', 'mkdir ~/Projects' }
end

dep 'zsh_default', :username do
  requires 'zsh.managed'

  username.default!(shell('whoami'))

  met? { shell("sudo su - '#{username}' -c 'echo $SHELL'")[which('zsh')] }
  meet { sudo("chsh -s '#{which('zsh')}' #{username}") }
end

dep 'dotfiles', :user do
  requires 'zsh_default'

  path = ENV['HOME'] / 'Projects/dotfiles'

  met? { File.exists? path }
  meet {
    git "git@github.com:#{user}/dotfiles.git", :to => path

    cd(path) {
      shell 'git submodule update --init --recursive'
      shell 'sh install.sh'
    }
  }
end

dep 'zsh.managed'

dep 'prezto' do
  requires 'zsh.managed'

  path = ENV['HOME'] / '.zprezto'

  met? { File.exists? path }
  meet { git "git@github.com:sorin-ionescu/prezto.git", :to => path }
end

dep 'janus' do
  path = ENV['HOME'] / '.vim'

  met? { File.exists? path }
  meet {
    git "git@github.com:carlhuda/janus.git", :to => path
    cd(path) { shell 'rake' }
  }
end

dep 'bootstrap' do
  requires 'system',
    'projects',
    'dotfiles'.with('goshakkk'),
    'zsh.managed',
    'prezto',
    'dbs',
    'ruby-dev',
    'common-dev',
    'clojure-dev',
    'janus'
  on :osx do
    requires 'mac-bootstrap'
  end
end
