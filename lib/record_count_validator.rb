class RecordCountValidator
  def self.call(provided:, actual:)
    return if provided == actual

    abort(
      "ABORTED! Provided record count is #{provided} "\
      "but actual record count is #{actual}."
    )
  end
end
