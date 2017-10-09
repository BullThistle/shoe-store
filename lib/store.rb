class Store < ActiveRecord::Base
  has_and_belongs_to_many :brands

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 100 }

  before_save :upcase_name

  private
    def upcase_name
      self.name = self.name.split(/ |\_/).map(&:capitalize).join(" ")
    end
end
