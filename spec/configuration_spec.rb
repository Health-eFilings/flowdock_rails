require 'spec_helper'

describe FlowdockRails::Configuration do
  describe 'retive configuration' do
    before(:all) do
      sources = { test1: '123', test2: '456' }
      @config = FlowdockRails::Configuration.new(sources)
    end

    it 'should return flow token by source' do
      expect(@config.test1).to eq('123')
    end

    it 'should return nil if source does not exist' do
      expect(@config.test3).to be_nil
    end

    it 'should be invalid for development env' do
      expect(@config.valid_env?).to be false
    end

    it 'should invalid for development env' do
      config = FlowdockRails::Configuration.new
      config.environments = %w(test development)
      expect(config.valid_env?).to be true
    end
  end
end
