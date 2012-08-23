#!/usr/bin/env ruby
require 'y2p'

describe Yaml2Properties, 'normal behavor' do
  before do
    @y2p = Yaml2Properties.new()
  end
  it 'create Messages_zh.properties' do
    @y2p.run('test.yml')
    File.exist?('Messages_zh.properties').should be_true
    prop = YAML.load_file('some.yml')
    prop['my.test.message.warn'].should_equal '警告信息'
  end
  it 'create Messages_ja.properties' do
    @y2p.run('test.yml')
    File.exist?('Messages_ja.properties').should be_true 
    prop['my.test.message.warn'].should_equal '警告メッセージ'
  end
  it 'create Messages.properties' do
    @y2p.run('test.yml')
    File.exist?('Messages.properties').should be_true 
    prop['my.test.message.warn'].should_equal 'Warning message'
  end
  after do
    File.delete('Messages_zh.properties', 'Messages_ja.properties', 'Messages.properties')
  end
end