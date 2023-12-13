class Log < ApplicationRecord
    validates :action, presence: true
    validates :post, presence: true
    validates :author, presence: true
end
