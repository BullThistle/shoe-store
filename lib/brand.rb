class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores

  validates_presence_of :name
  validates_presence_of :price

  before_save(:upcase_name)

  private
    def upcase_name
      self.name.split(/ |\_/).map(&:capitalize).join(" ")
    end
end
