#:contract
require "reform"
require "reform/form/dry"

module Test::Contract
  class Create < Reform::Form
    include Dry

    def self.statuses
      {"0" => "untested", "1" => "passed", "2" => "failed"}
    end

    #:property
    property :description
    property :status
    property :active
    property :test_case_id
    #:property end

    #:validation
    validation do
      required(:description).filled
      required(:test_case_id).filled
      required(:status).filled.included_in?(Test::Contract::Create.statuses.keys)
    end
    #:validation end
  end
end
#:contract end
