class Socmed < ActiveRecord::Base
  enum type: %w(facebook twitter)
end
