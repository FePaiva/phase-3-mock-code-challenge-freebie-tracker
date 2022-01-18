class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

  def give_freebie(dev:, item_name:, value:)
      Freebie.create(item_name: item_name, value: value, dev_id: dev.id, company_id: self.id)
  
    # to check if give_freebie works: open console, create a dev => dev = Dev.first,
    # then create a company => c = Company.first, 
    # then invoke the method => c.give_freebie(dev: dev, item_name: "Item 5", value: 35)
    #  check if there is a new entry in the freebies table (sqlite tab -> freebies).

  end

  def self.oldest_company
     year = self.minimum(:founding_year)
      self.find_by(founding_year: year)
  end
# to check if oldest_company works: open console, type Company.oldest_company . 
end