class Test::Show < Trailblazer::Operation
  step Model(Test, :find_by)
end
