class Post < ActiveRecord::Base
 

  attr_accessible :content, :title, :category_id

  has_many :comments
  has_many :categories
  
  validates :title, :presence => true
  validates :content, :presence => true, :length => { :minimum => 5 }

  attr_accessible :avatar
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }

scope :content_or_title_matches, lambda {|q|  
    where 'content like :q or title like :q', :q => "%#{q}%"  
  } 

end
