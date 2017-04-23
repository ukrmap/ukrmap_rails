require "shoulda/matchers"

RSpec.describe Term, type: :model do
  describe "database" do
    it { should have_db_column(:name).of_type(:string).with_options(null: false) }
    it { should have_db_column(:entries_count).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:popularity).of_type(:integer).with_options(default: 1, null: false) }

    it { should have_db_index(:name).unique(true) }
  end
end
