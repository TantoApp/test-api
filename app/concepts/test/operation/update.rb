#:update
class Test::Update < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(Test, :find_by)
    step Contract::Build( constant: Test::Contract::Update )
  end

  step Nested(Present)
  step Contract::Validate( key: :test )
  step Contract::Persist()
end
#:update end
