class Alternative < ApplicationRecord
  belongs_to :summary, counter_cache: true
end
