class PaymentNotification < ActiveRecord::Base
  belongs_to :basket
  serialize :params
  after_create :mark_basket_as_purchased
  
  private

    def mark_basket_as_purchased
      if status == 'Completed'
        basket.update_attributes(:purchased_at => Time.now)
      end
    end
end
