dep 'Google Chrome.app' do
  source 'https://dl.google.com/chrome/mac/stable/GoogleChrome.dmg'
end

dep 'Dropbox.app' do
  source 'https://d1ilhw0800yew8.cloudfront.net/client/Dropbox%202.0.5.dmg'
end

dep '1Password.app' do
  source 'https://d13itkw33a7sus.cloudfront.net/dist/1P/mac/1Password-3.8.20.zip'
end

dep 'VirtualBox.app' do
  source 'http://download.virtualbox.org/virtualbox/4.2.12/VirtualBox-4.2.12-84980-OSX.dmg'
end

dep 'Skype.app' do
  source 'http://download.skype.com/macosx/Skype_6.3.59.582.dmg'
end

dep 'VLC.app' do
  source 'http://sourceforge.net/projects/vlc/files/2.0.6/macosx/vlc-2.0.6.dmg'
end

dep 'HandBrake.app' do
  source 'http://sourceforge.net/projects/handbrake/files/0.9.8/HandBrake-0.9.8-MacOSX.6_GUI_x86_64.dmg'
end

dep 'Minecraft.app' do
  source 'http://s3.amazonaws.com/MinecraftDownload/launcher/Minecraft.zip'
end

dep 'Slate.app' do
  source 'http://slate.ninjamonkeysoftware.com/Slate.dmg'
end

dep 'Transmission.app' do
  source 'http://download.transmissionbt.com/files/Transmission-2.77.dmg'
end

dep 'TextExpander.app' do
  source 'http://cdn.smilesoftware.com/TextExpander_4.0.5.zip'
end

dep 'GitHub.app' do
  source 'https://github-central.s3.amazonaws.com/mac/812e9f1a-81f9-11e2-842a-d627744bf6bd.zip'
end

dep 'Alfred.app' do
  source 'http://cachefly.alfredapp.com/beta/Alfred%202%20b137.zip'
end

dep 'Bartender.app' do
  source 'http://www.macbartender.com/Demo/Bartender.zip'
end

dep 'Kaleidoscope.app' do
  source 'http://cdn.kaleidoscopeapp.com/releases/Kaleidoscope-2.0.0-107.zip'
end

dep 'iTerm.app' do
  source 'http://iterm2.googlecode.com/files/iTerm2-1_0_0_20130319.zip'
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
  requires 'mac-settings',
    'Google Chrome.app',
    'Dropbox.app',
    '1Password.app',
    'VirtualBox.app',
    'Skype.app',
    'VLC.app',
    'HandBrake.app',
    'Minecraft.app',
    'Slate.app',
    'TextExpander.app',
    'GitHub.app',
    'Alfred.app',
    'Bartender.app',
    'Kaleidoscope.app',
    'Transmission.app',
    'iTerm.app'
end
