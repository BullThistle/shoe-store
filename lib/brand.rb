class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores

  validates(:name, {:presence => true, :length => {:maximum => 100}})
  validates(:price, {:presence => true})

  before_save(:upcase_name)

  private
    def upcase_name
      self.name.split(/ |\_/).map(&:capitalize).join(" ")
    end
end
