class ContentModerationService
  attr_reader :reasons

  def initialize(input)
    @input = input.downcase
    @flagged = false
    @reasons = []
  end

  def call
    audit

    self
  end

  def flagged?
    @flagged
  end

  private

  def audit
    BANNED_WORDS.each do |flagged_word|
      # TODO: check for strict equality
      if @input.include? flagged_word
        @flagged = true
        @reasons << "contains prohibited word: #{flagged_word}"
      end
    end
  end
end
