require "shoulda/matchers"

RSpec.describe Article, type: :model do
  describe "database" do
    it { should have_db_column(:slug).of_type(:string) }
    it { should have_db_column(:title).of_type(:string).with_options(null: false) }
    it { should have_db_column(:advertising).of_type(:boolean).with_options(default: true, null: false) }
    it { should have_db_column(:description).of_type(:string) }
    it { should have_db_column(:keywords).of_type(:string) }
    it { should have_db_column(:content).of_type(:text) }
    it { should have_db_column(:created_on).of_type(:date).with_options(null: false) }
  end
end
