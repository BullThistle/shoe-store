class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 100 }
  validates :price, presence: true

  before_save :upcase_name, :currency_format

  private
    def upcase_name
      self.name = self.name.split(/ |\_/).map(&:capitalize).join(" ")
    end
    def currency_format
      self.price = '$%.2f' % self.price
    end
end
