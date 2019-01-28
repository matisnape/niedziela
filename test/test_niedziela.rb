require_relative 'test_helper'

describe CheckDate do

  before do
    I18n.default_locale = :pl
  end

  describe "new" do
    it "instance of" do
      @today = CheckDate.new
      @today.must_be_instance_of CheckDate
    end
  end

  describe "today" do

    describe "holiday" do
      before do
        Timecop.travel(Time.local(2019, 1, 1))
        @today = CheckDate.new
      end

      it "has status closed and has a holiday reason" do
        @today.today_status.must_equal :closed
        @today.reason.must_equal I18n.t('app.reason.holiday')
      end
    end

    describe "holiday and non-shop sunday" do
      before do
        Timecop.travel(Time.local(2019, 1, 6))
        @today = CheckDate.new
      end

      it "has status closed and has a holiday reason even if today is also nonshop sunday" do
        @today.today_status.must_equal :closed
        @today.reason.must_equal I18n.t('app.reason.holiday')
      end
    end

    describe "non-shop sunday" do
      before do
        Timecop.travel(Time.local(2019, 1, 13))
        @today = CheckDate.new
      end

      it "has status closed and has a non-shop sunday reason" do
        @today.today_status.must_equal :closed
        @today.reason.must_equal I18n.t('app.reason.niehandlowa')
      end
    end

    describe "last sunday of the month is a shop sunday" do
      before do
        Timecop.travel(Time.local(2019, 1, 27))
        @today = CheckDate.new
      end

      it "has status open and no reason" do
        @today.today_status.must_equal :open
        assert_nil @today.reason
      end
    end

    describe "regular day" do
      before do
        Timecop.travel(Time.local(2019, 1, 26))
        @today = CheckDate.new
      end

      it "has status open and no reason" do
        @today.today_status.must_equal :open
        assert_nil @today.reason
      end
    end
  end

  describe "next sunday" do
    describe "is a shop sunday" do
      before do
        Timecop.travel(Time.local(2019, 1, 26))
        @today = CheckDate.new
      end

      it "has status open" do
        @today.next_sunday_status.must_equal :open
      end

      it "next_sunday_formatted returns date without year" do
        @today.next_sunday_formatted.must_equal "27.01"
      end
    end

    describe "is a non-shop sunday" do
      before do
        Timecop.travel(Time.local(2019, 1, 19))
        @today = CheckDate.new
      end

      it "has status closed" do
        @today.next_sunday_status.must_equal :closed
      end
    end

    describe "is a holiday" do
      before do
        Timecop.travel(Time.local(2019, 1, 5))
        @today = CheckDate.new
      end

      it "has status closed" do
        @today.next_sunday_status.must_equal :closed
      end
    end
  end
end
