class Scoreboard < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    
   
  has_attached_file :scoreboard_img, 
                    :styles => { :scoreboard_index => "480x270>", :scoreboard_show => "480x270>" }, 
                    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :scoreboard_img, :content_type => /\Aimage\/.*\z/

end

