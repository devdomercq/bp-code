class Scoreboard < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates :bpecode, uniqueness: true
  validates :category_id, presence: true
  has_attached_file :scoreboard_img, 
                    :styles => { :scoreboard_index => "480x270>", :scoreboard_show => "576x324>" }, 
                    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :scoreboard_img, :content_type => /\Aimage\/.*\z/
  
 
def self.search(search)
  where("bpecode LIKE ? OR organization LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
end
end


