class Test::Index < Trailblazer::Operation
  step :model!

  def model!(options, *)
    options["model"] =
      if tc_id = options["params"][:test_case_id] # probably do a better query
        ::Test.where(test_case_id: tc_id)
      else
        ::Test.all
      end
  end
end
