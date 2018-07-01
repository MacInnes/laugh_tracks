RSpec.describe Comedian do
  describe 'Features' do
    context 'when visiting /comedians' do
      it 'user sees a list of comedians with name and age' do
        comedian = Comedian.create(name: "Bill Hicks", age: 45)
        visit '/comedians'

        within('#comedian-1') do
          expect(page).to have_content("Name: #{comedian.name}")
          expect(page).to have_content("Age: #{comedian.age}")
        end
      end
      it 'user sees a list of specials for each comedian' do
        comedian = Comedian.create(name: "Bill Hicks", age: 45)
        comedian.specials.create(name: "some special")
        visit '/comedians'

        within('#comedian-1') do
          expect(page).to have_content(comedian.specials.first.name)
        end
      end
      it 'user sees average age of all comedians' do
        comedian_1 = Comedian.create(name: "Bill Hicks", age: 45)
        comedian_2 = Comedian.create(name: "blah blah", age: 35)
        visit '/comedians'

        expect(page).to have_content("Average comedian age: 40")
      end
      it 'user can filter comedians by age with a query parameter' do
        comedian_1 = Comedian.create(name: "Bill Hicks", age: 45)
        comedian_2 = Comedian.create(name: "blah blah", age: 35)
        visit '/comedians?age=35'


        expect(page).to have_content("Name: #{comedian_2.name}")
        expect(page).not_to have_content("Name: #{comedian_1.name}")
      end
      it 'user can see the count of specials for each comedian' do
        comedian = Comedian.create(name: "Bill Hicks", age: 45)
        comedian.specials.create(name: "some special")
        comedian.specials.create(name: "another special")

        visit '/comedians'

        expect(page).to have_content("Specials (2):")
      end
    end
  end
end
