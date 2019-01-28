#:delete
class Test::Delete < Trailblazer::Operation
  step Model(Test, :find_by)
  step :delete_with_dependents!

  def delete_with_dependents!(options, model:, **)
    ActiveRecord::Base.transaction do
      # insert something like
      test_line_client = ::Tantoapp::Test::Line::V1::Client.new("http://127.0.0.1:3004")
      test_line_client.test_lines.get(test_id: model.id).each do |tl|
        test_line_client.test_lines.delete_by_id(tl.id)
      end
      # Ideally, we won't do this for direct relations,
      # but only for relations outside the bounded context
      # Or let the frontend's light backend orchestrator do the talking.
      model.destroy
    end
  end
end
#:delete end
