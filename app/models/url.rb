class Url < ApplicationRecord
  validates :long_url, uniqueness: true
  validates :long_url, format: {with: (URI::regexp(['http','https'])),
  message: "url entered is invalid, please enter a url with 'https://'"}
end
