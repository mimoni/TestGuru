# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  scope :easy_level, -> { where(level: 0..1) }
  scope :normal_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, ->(title) { joins(:category).where(categories: { title: title }) }

  validates :title, presence: true, uniqueness: { case_sensitive: false, scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.titles_by_category_title(title)
    by_category(title).order(title: :desc).pluck(:title)
  end
end
