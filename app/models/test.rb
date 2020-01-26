# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.titles_by_category_title(category_title)
    joins(:category)
      .where('categories.title = ?', category_title)
      .order(title: :desc)
      .pluck(:title)
  end
end
