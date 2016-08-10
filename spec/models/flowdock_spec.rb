require 'spec_helper'

describe FlowdockRails::Flowdock do
  before(:each) do
    sources = { test1: '123' }
    configuration = FlowdockRails::Configuration.new(sources)
    configuration.environments = %w(development test)
    allow(FlowdockRails).to receive(:configuration).and_return(configuration)
  end

  it 'is initialized with a source' do
    instance = FlowdockRails::Flowdock.new(:test1)
    expect(instance.source).to eq(:test1)
  end

  it 'should not be ready if source is invalid' do
    instance = FlowdockRails::Flowdock.new(:test2)
    expect(instance.ready?).to be false
  end

  it 'should be ready if source is valid' do
    instance = FlowdockRails::Flowdock.new(:test1)
    expect(instance.ready?).to be true
  end

  it 'should format params' do
    attributes = { thread_id: '456', text: 'Ok', tags: %w(a b) }
    message = FlowdockRails::Message.new(attributes)
    instance = FlowdockRails::Flowdock.new(:test1)
    params = instance.send(:format_params, message)
    expected = { thread_id: '456', content: 'Ok', tags: '#a,#b',
                 flow_token: '123', event: 'message' }
    expect(params).to eq(expected)
  end

  it 'should raise error if is not ready' do
    instance = FlowdockRails::Flowdock.new(:ok)
    expected = 'Instance is not ready'
    expect { instance.post_message(1) }.to raise_error(expected)
  end

  it 'should update message' do
    json_response = { thread_id: 'aaazzz' }
    stub_request(:any, /.*flowdock.*/)
      .to_return(body: json_response.to_json, status: 200)
    attributes = { text: 'Ok', tags: %w(a b) }
    message = FlowdockRails::Message.new(attributes)
    instance = FlowdockRails::Flowdock.new(:test1)
    new_message = instance.post_message(message)

    expect(new_message.thread_id).to eq('aaazzz')
    expect(new_message.sent?).to be true
  end

  it 'should return nil if environments is not allowed' do
    sources = { test1: '123' }
    configuration = FlowdockRails::Configuration.new(sources)
    configuration.environments = %w(production)
    allow(FlowdockRails).to receive(:configuration).and_return(configuration)
    instance = FlowdockRails::Flowdock.new(:test1)

    expect(instance.post_message(1)).to be_nil
  end
end
