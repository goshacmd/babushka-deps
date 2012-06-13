dep 'mongodb.managed' do
  provides 'mongod'
end

dep 'redis.managed' do
  provides 'redis-cli'
end

dep 'dbs' do
  requires 'mongodb.managed',
    'redis.managed'
end
