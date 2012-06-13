dep 'tmux.managed'
dep 'wget.managed'
dep 'tree.managed'
dep 'ctags.managed'
dep 'ack.managed'
dep 'hub.managed'

dep 'common-dev' do
  requires 'tmux.managed',
    'wget.managed',
    'tree.managed',
    'ctags.managed',
    'ack.managed',
    'hub.managed'
end
