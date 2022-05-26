# frozen_string_literal: true

require 'pstore' # https://github.com/ruby/pstore
require_relative '../config/requirements'

# class for storage of pstore
# @type [Class]
class Storage
  @@data = PStore.new(STORE_NAME)
  attr_accessor :answers

  def initialize(answers)
    @answers = answers
  end

  # function for saving data in pstore
  def save_data
    @@data.transaction do
      @@data[:data_index] ||= { 'y' => 0, 'n' => 0 }
      @@data[:data_index]['y'] += @answers['y']
      @@data[:data_index]['n'] += @answers['n']
      @@data.commit
    end
    do_session_rating
  end

  # calculating rating of answers after each session
  # @return [String]
  def do_session_rating
    p "Rating of current session: #{100 * @answers['y'] / @answers.values.sum}"
  end

  # calculating all-time rating of answers
  def self.do_average_rating
    @@data.transaction(true) do
      p "The total rating is: #{100 * @@data[:data_index]['y'] / @@data[:data_index].values.sum}"
    end
  end

  # Used to remove all data from storage
  # @return nil
  def self.store_purge
    @@data.transaction(false) do
      @@data.delete(:data_index)
    end
  end
end
