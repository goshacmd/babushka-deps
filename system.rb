dep 'system' do
  requires [
    'admins can sudo',
    'myfreeweb:usr_local belongs to admins',
    'myfreeweb:usr_local is writable by group'
  ]
end
