require 'spec_helper'

describe Task do
  describe "associations" do
    it "should belongs to user" do
      should belong_to(:user)
    end
  end

  describe "checking validations" do
    it "should validate presence of" do
      should validate_presence_of :caption
      should validate_presence_of :description
      should validate_presence_of :user
    end
  end
end
