# frozen_string_literal: true

class Test < ApplicationRecord
  def self.titles_by_category(_category_title)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: _category_title })
      .order(title: :desc)
      .pluck(:title)
  end
end
