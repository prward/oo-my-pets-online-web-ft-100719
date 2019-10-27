require_relative 'spec_helper.rb'

describe "Associations" do
  before do
    @owner = Owner.new("Timmy")
  end

  after do
    Owner.all.clear
  end

  context 'Owner instance methods' do
    

   
    describe "#walk_dogs" do
      it "walks the dogs which makes the dogs' moods happy" do
        dog = Dog.new("Daisy", @owner)
        @owner.walk_dogs
        expect(dog.mood).to eq("nervous")
      end
    end

    describe "#feed_cats" do
      it "feeds cats which makes the cats' moods happy" do
        cat = Cat.new("Muffin", @owner)
        @owner.feed_cats
        expect(cat.mood).to eq("nervous")
      end
    end

    describe "#sell_pets" do
      it 'can sell all its pets, which makes them nervous' do
        fido = Dog.new("Fido", @owner)
        tabby = Cat.new("Tabby", @owner)

        [fido, tabby].each {|o| o.mood = "happy" }

        @owner.sell_pets

        [fido, tabby].each { |o| expect(o.mood).to eq("happy") }
      end

      it 'can sell all its pets, which leaves them without an owner' do
        fido = Dog.new("Fido", @owner)
        tabby = Cat.new("Tabby", @owner)

        [fido, tabby].each {|o| o.mood = "happy" }

        @owner.sell_pets

        [fido, tabby].each { |o| expect(o.owner).to be(nil) }
        expect(@owner.cats.count).to eq(0)
        expect(@owner.dogs.count).to eq(0)
      end
    end

    describe "#list_pets" do
      it 'can list off its pets' do
        @owner.buy_cat("Crookshanks")
        @owner.buy_cat("Fido")
        @owner.buy_dog("Snuffles")
        @owner.buy_dog("Charley")
        expect(@owner.list_pets).to eq("I have #{@owner.dogs.count} dog(s), and #{@owner.cats.count} cat(s).")
      end
    end
  end
end
