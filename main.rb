# frozen_string_literal: true

require './helpers/storage'
require './classes/questionnaire'

Storage.new(Questionnaire.collect_answers).save_data
Storage.do_average_rating
