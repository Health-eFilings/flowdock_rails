require 'spec_helper'

describe FlowdockRails::Message do
  before(:all) do
    attributes = { thread_id: '123', text: 'Ok', tags: %w(a b) }
    @instance = FlowdockRails::Message.new(attributes)
  end

  it 'should initialize attributes' do
    expect(@instance.thread_id).to eq('123')
    expect(@instance.text).to eq('Ok')
    expect(@instance.tags).to eq(%w(a b))
  end

  it 'should format tags' do
    expected_tags = '#a,#b'
    expect(@instance.format_tags).to eq(expected_tags)
  end

  it 'should check if message is from a thread' do
    expect(@instance.thread?).to be true
  end

  it 'should have sent flag false' do
    expect(@instance.sent?).to be false
  end

  it 'should have sent flag true' do
    instance = FlowdockRails::Message.new
    instance.sent
    expect(instance.sent?).to be true
  end

  it 'should create bullet message' do
    lines = ['**Title**', 'bullet 1', 'time: today']
    instance = FlowdockRails::Message.new(lines: lines)
    expected = "**Title**\nbullet 1\ntime: today"
    expect(instance.text).to eq(expected)
  end
end
