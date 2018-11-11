require_relative 'test_helper'

describe CheckDate do
  before do
    I18n.default_locale = :pl
    @today = CheckDate.new
  end

  describe "new" do
    it "instance of" do
      @today.must_be_instance_of CheckDate
    end

    it "has @date"
    it "has @full_date"
    it "has @reason nil"
  end

  describe "are shops closed today?" do
    describe "holiday" do
      it "returns true and has a holiday reason"
      it "returns true and has a holiday reason even if today is also nonshop sunday"
    end
    describe "sunday" do
      it "returns true for sunday from list and has reason"
      it "returns false if sunday not on list and doesn't have a reason"
    end
    describe "regular day" do
      it "returns false and has no reason"
    end
  end

  describe "next sunday" do
    it "next_sunday returns next sunday date"
    it "next_sunday_formatted returns date without year"
  end

  describe "next sunday closed?" do
    it "returns true if is on the list of nonshop sundays"
    it "returns true if is a holiday"
    it "returns false if shops are open"
  end

  it "date_as_string returns a string"
end
