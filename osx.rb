dep '1Password.app' do
  source 'https://d13itkw33a7sus.cloudfront.net/dist/1P/mac/1Password-3.8.19.zip'
end

dep 'Transmission.app' do
  source 'http://download.transmissionbt.com/files/Transmission-2.52.dmg'
end

dep 'MacVim.app' do
  source 'https://github.com/downloads/b4winckler/macvim/MacVim-snapshot-64.tbz'
end

dep 'iTerm.app' do
  source 'http://iterm2.googlecode.com/files/iTerm2-1_0_0_20120726.zip'
end

dep 'mac-bootstrap' do
  requires '1Password.app', 'Transmission.app', 'iTerm.app'
end
