# frozen_string_literal: true

require 'spec_helper'
require_relative '../helpers/storage'

describe Storage do
  before do
    @answers = { 'y' => 3, 'n' => 2 }
    @storage = Storage.new(@answers)
  end

  describe '#do_session_rating' do
    context 'when was given hash answers = { y => 3, x => 2 }' do
      it 'returns rating of current session' do
        expect(@storage.do_session_rating).to(
          eq "Rating of current session: #{100 * @answers['y'] / @answers.values.sum}"
        )
      end
    end
  end

  describe '#store_purge' do
    context 'when we need to delete stored hash' do
      it 'removes all data from storage of pstore' do
        expect(p(Storage.store_purge)).to eq nil
      end
    end
  end
end
