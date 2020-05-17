# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: 'Test', foreign_key: 'user_id'

  validates :email, presence: true

  def tests_by_level(level)
    tests.where(level: level)
  end
end
