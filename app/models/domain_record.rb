class DomainRecord < ActiveRecord::Base
	has_one :domain
  after_destroy :update_serial
  before_save :update_serial

  private
    def update_serial
      domain = Domain.find(domain_id)
      domain.touch
    end
end
