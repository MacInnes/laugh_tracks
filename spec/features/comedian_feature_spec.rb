RSpec.describe Comedian do
  describe 'Features' do
    context 'when visiting /comedians' do
      it 'user sees a list of comedians with name and age' do
        comedian = Comedian.new(name: "Bill Hicks", age: 45)
        visit '/comedians'

        within('#comedian-1') do
          expect(page).to have_content("Name: Bill Hicks")
        end

      end
    end
  end
end
