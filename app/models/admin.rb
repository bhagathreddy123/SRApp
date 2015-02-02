class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :users, :dependent => :destroy
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
 
  has_many :batches, :dependent => :destroy
  has_many :subjects, :dependent => :destroy
  has_many :attendances, :dependent => :destroy
  belongs_to :web_admin
  
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

def self.search(search)
  if search
    where('name LIKE ?', "%#{search}%")
  else
    all
  end
end


  
end

