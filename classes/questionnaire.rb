# frozen_string_literal: true

require_relative '../config/requirements'

# class for questions & answers
# @type [Class]
class Questionnaire
  # function for collecting of answers to questions
  # @return [Hash] hash of correct answers
  def self.collect_answers
    answers = { 'y' => 0, 'n' => 0 }
    QUESTIONS.each_key do |question_key|
      puts QUESTIONS[question_key]
      check_valid_answer == 'y' ? answers['y'] += 1 : answers['n'] += 1
    end
    answers
  end

  # function for validation of answers to each question
  # @return one correct form of answers
  def self.check_valid_answer
    loop do
      answer = gets.chomp[0].downcase[0]
      return answer if ANSWER_OPTIONS.include? answer

      puts "Answer with 'Y' or 'N' or 'No' or 'Yes':)"
    end
  end
end
