class Test::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(Test, :new)
    step Contract::Build( constant: Test::Contract::Create )
  end

  step Nested( Present )
  step Contract::Validate( key: :test )
  failure :failed!

  step Contract::Persist( )
  step :notify!

  def notify!(options, model:, **)
    options["result.notify"] = Rails.logger.info("New Test #{model.description}.")
  end

  def failed!(options, model:, **)
    Rails.logger.error "Validation Failed" if options["result.contract.default"].try(:errors)
  end
end
