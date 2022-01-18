class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one?(item_name)
  #     if self.freebies.find_by(item_name: item_name) == nil
  #       false
  #     else 
  #       true
  #     end
  # end

  self.freebies.find_by(item_name: item_name) == nil ? false : true
  end
  # to check if received_one? works: open console, create a dev => dev = Dev.first, 
  # then check the formula => dev.received_one?("Item 1") . 

  def give_away(dev:, freebie:)
      freebie.dev_id = dev.id
      freebie.save
  end
# to check if give_away works: open console, get a dev => dev = Dev.find(4),
# then get a freebie => f = Freebie.first , 
# then check the formula dev.give_away(dev: dev, freebie: f).
# if u check the freebies table, the dev_id 1 changed to dev_id 4.

end  

