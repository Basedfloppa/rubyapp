require 'rails_helper'

RSpec.describe Post, type: :model do
  it "checks duplicates of ratings" do
    random = Random.new
    30.times do
      title = Faker::Hipster.sentence(word_count: 3)
      body = Faker::Lorem.paragraph(sentence_count: 5, random_sentences_to_add: 5)
      Post.create(title: title , body: body, author: random.rand(1..10), parent: 0, anonimity: true, image: nil)
    end
    30.times do
      if random.rand(1..2) == 1
        Post.find_by(id: random.rand(1..29)).upvote(random.rand(1..10))
      else
        Post.find_by(id: random.rand(1..29)).downvote(random.rand(1..10))
      end
    end
    result = Rating.find_by_sql("
                        SELECT *
                        FROM ratings AS r1
                        WHERE EXISTS (
                          SELECT *
                          FROM ratings AS r2
                          WHERE r1.post = r2.post AND r1.author = r2.author AND r1.id <> r2.id
                        );").count
    expect(result).to eq 0
  end
end
