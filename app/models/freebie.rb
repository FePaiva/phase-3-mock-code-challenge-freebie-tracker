class Freebie < ActiveRecord::Base
  belongs_to :dev
  belongs_to :company

  def print_details
    puts "#{self.dev.name} owns a #{self.item_name} from #{self.company.name}"
  end
# to check if received_one? works: open console, create a freebie => f = Freebie.first
  # then check the formula => f.print_details

end
