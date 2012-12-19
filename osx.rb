dep '1Password.app' do
  source 'https://d13itkw33a7sus.cloudfront.net/dist/1P/mac/1Password-3.8.19.zip'
end

dep 'Transmission.app' do
  source 'http://download.transmissionbt.com/files/Transmission-2.52.dmg'
end

dep 'iTerm.app' do
  source 'http://iterm2.googlecode.com/files/iTerm2-1_0_0_20120726.zip'
end

dep 'Slate.app' do
  source 'http://slate.ninjamonkeysoftware.com/Slate.dmg'
end

dep 'mac-settings' do
  met? { File.exists? ENV['HOME'] / '.CFUserTextEncoding' }
  meet {
    shell 'chflags nohidden ~/Library'
    shell 'defaults write com.apple.finder QLEnableTextSelection -bool true'
    shell "echo '0x08000100:0' > ~/.CFUserTextEncoding"
  }
end

dep 'mac-bootstrap' do
  requires 'mac-settings', '1Password.app', 'Transmission.app', 'iTerm.app', 'Slate.app'
end
