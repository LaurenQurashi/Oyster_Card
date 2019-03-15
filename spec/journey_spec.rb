# frozen_string_literal: true

require 'oyster'
require 'journey'
require 'station'

describe Journey do
  # let(:card) { double :card }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  context 'Starting the Journey' do
    it ' responds to the start method when called with one argument' do
      expect(subject).to respond_to(:start).with(1).argument
    end

    it 'returns an array with entry_station after start' do
      subject.start(:entry_station)
      expect(subject.journeys).to eq [{:entry_station => :entry_station, :exit_station => nil}]
    end
  end

  context ' Ending the Journey' do
    it ' responds to finish when called with one argument' do
      expect(subject).to respond_to(:finish).with(1).argument
    end

    it 'returns an array with entry_station and exit_station' do
      subject.start(:entry_station)
      subject.finish(:exit_station)
      expect(subject.journeys).to eq [{:entry_station => :entry_station, :exit_station => :exit_station}]
    end
  end
end
