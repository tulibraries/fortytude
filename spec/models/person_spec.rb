require 'rails_helper' # ~> LoadError: cannot load such file -- rails_helper

RSpec.describe Person, type: :model do
  after(:each) do
    DatabaseCleaner.clean
  end

  let (:building) { FactoryBot.create(:building) }
  let (:space) { s = FactoryBot.build(:space)
                 s.building_id = building.id
                 s.save!
                 s
  }
  let (:person) { FactoryBot.build(:person) }

  context 'Person Class Attributes' do
    subject { Person.new.attributes.keys }

    it { is_expected.to include("first_name") }
    it { is_expected.to include("last_name") }
    it { is_expected.to include("phone_number") }
    it { is_expected.to include("email_address") }
    it { is_expected.to include("chat_handle") }
    it { is_expected.to include("job_title") }
    it { is_expected.to include("identifier") }
    it { is_expected.to include("building_id") }
    it { is_expected.to include("space_id") }
  end

  context 'Required Fields' do

    required_fields = [
      "first_name",
      "last_name",
      "phone_number",
      "chat_handle",
      "email_address",
      "job_title",
    ]
    required_fields.each do |f|
      example "missing #{f} fields" do
				person[f] = ""
        expect { person.save! }.to raise_error(/#{f.humanize(capitalize: true)} can't be blank/)
      end
    end

    required_references = [
      "building_id",
      #"space_id",
    ]
    required_references.each do |f|
      example "missing #{f}" do
				person[f] = [nil]
        expect { person.save! }.to raise_error(/Validation failed:.* #{f.humanize(capitalize: true)} can't be blank/) # => 
      end
    end
  end

  describe "field validators" do
    context "Email validation" do
      example "valid email", focus: true do
        p = FactoryBot.build(:person)
        person.email_address = "chas@example.edu"
        person.building_id = building.id
        person.space_id = space.id
        expect { person.save! }.to_not raise_error
      end
      example "invalid email" do
        person.email_address = "abc"
        person.building_id = building.id
        person.space_id = space.id
        expect { person.save! }.to raise_error(/Email address is not an email/)
      end
      example "invalid email - blank " do
        person.email_address = ""
        person.building_id = building.id
        person.space_id = space.id
        expect { person.save! }.to raise_error(/Email address can't be blank/)
      end
    end
  end
end

# ~> LoadError
# ~> cannot load such file -- rails_helper
# ~>
# ~> /Users/skng/.rbenv/versions/2.5.1/lib/ruby/2.5.0/rubygems/core_ext/kernel_require.rb:59:in `require'
# ~> /Users/skng/.rbenv/versions/2.5.1/lib/ruby/2.5.0/rubygems/core_ext/kernel_require.rb:59:in `require'
# ~> /var/folders/57/jyqj6xp12_76sctf9ndkb26r0000gp/T/seeing_is_believing_temp_dir20180607-25877-mcd5tl/program.rb:1:in `<main>'
