# frozen_string_literal: true

class Answer < ApplicationRecord
  MAX_ANSWERS = 4

  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_answers_count

  private

  def validate_answers_count
    if question && question.answers.size >= MAX_ANSWERS
      errors.add(:count, "Максимальное количество ответов: #{MAX_ANSWERS}")
    end
  end
end
