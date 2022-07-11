class Friend < ApplicationRecord
  paginates_per 2
  belongs_to :user

  #delegate :user_id, to: :user, prefix: :user



has_one_attached :image
  require 'csv'
def self.to_csv
 friends = all
 CSV.generate do |csv|
   csv << column_names
   friends.each do |friend|
     csv << friend.attributes.values_at(*column_names)
   end

   def name
     @name ||="#{first_name} #{last_name}"
   end

 end
end
end
