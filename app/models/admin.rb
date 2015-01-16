class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :users, :dependent => :destroy
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :users, :dependent => :destroy
  has_many :batches, :dependent => :destroy
  has_many :subjects, :dependent => :destroy
  has_many :attendances, :dependent => :destroy
  belongs_to :web_admin
  
  

def self.search(search)
  if search
    where('name LIKE ?', "%#{search}%")
  else
    all
  end
end


  
end
