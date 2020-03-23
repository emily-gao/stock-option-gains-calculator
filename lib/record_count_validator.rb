class RecordCountValidator
  def self.call(provided:, actual:)
    return if provided == actual

    abort(
      "ABORTED! Provided record count is #{provided_record_count} "\
      "but actual record count is #{actual_record_count}."
    )
  end
end
