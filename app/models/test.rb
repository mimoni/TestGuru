# frozen_string_literal: true

class Test < ApplicationRecord
  def self.titles_by_category_title(category_title)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where('categories.title = ?', category_title)
      .order(title: :desc)
      .pluck(:title)
  end
end
