60.times do
    title = Faker::Hipster.sentence(word_count: 3)
    body = Faker::Lorem.paragraph(sentence_count: 5, random_sentences_to_add: 5)
    Post.create(title: title , body: body, author: 0, parent: 0, anonimity: true, image: nil)
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?