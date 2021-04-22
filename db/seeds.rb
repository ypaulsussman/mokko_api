# frozen_string_literal: true

# This file can be:
#   - loaded with the `bin/rails db:seed` command, or
#   - created alongside the database with `db:setup`
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

demo_user = User.create!(name: 'young suss', email: 'ysuss@example.com', password: 'foobar')

pgdeck = Deck.create!(title: 'Paul Graham Essays', user: demo_user)

note_one = Note.create!(
  active: true,
  next_occurrence: Date.today,
  current_interval: 1,
  deck: pgdeck,
  content: "- It's not that unprestigious types of work are good, _per se_.\n- But when you find yourself drawn to some kind of work despite its current lack of prestige, it's a sign that:\n  - there's something real to be discovered there, and\n  - you have the right kind of motives.\n    - Impure motives are a big dang>er for the ambitious.\n    - If anything is going to lead you astray, it will be the desire to impress people.\n  - So while working on things that aren't prestigious doesn't guarantee you're on the right track, it at least guarantees you're not on the most common type of wrong one."
)

note_two = Note.create!(
  active: true,
  next_occurrence: Date.today,
  current_interval: 3,
  deck: pgdeck,
  content: "- One of my tricks for writing essays had always been to give talks.\n  - The prospect of having to\n    - stand up in front of a group of people and\n    - tell them something that wouldn't waste their time\n  - was a great spur to the imagination."
)

note_three = Note.create!(
  active: true,
  next_occurrence: Date.today,
  current_interval: 5,
  deck: pgdeck,
  content: "- Customs continue to constrain you long after the restrictions that caused them have disappeared.\n  - Customary VC practice had once, like the customs about publishing essays, been based on real constraints.\n    - Startups had once been much more expensive to start, and proportionally rare.\n    - Now they could be cheap and common, but\n      - the VCs' customs still reflected the old world, just as\n      - customs about writing essays still reflected the constraints of the print era.\n  - Which in turn implies that people who are independent-minded (i.e. less influenced by custom) will have an advantage in fields affected by rapid change (where customs are more likely to be obsolete).\n    - Here's an interesting point, though: you can't always predict which fields will be affected by rapid change.\n    - Obviously software and venture capital will be, but who would have predicted that essay writing would be?"
)

tag_one = Tag.create!(content: '"What I Worked On"')

tag_two = Tag.create!(content: 'essay')

tag_three = Tag.create!(content: 'what to focus on')

tag_four = Tag.create!(content: 'productivity')

[note_one, note_two, note_three].each do |note|
  [tag_one, tag_two].each do |tag|
    NoteTag.create!(tag: tag, note: note)
  end
end

[note_one, note_three].each do |note|
  NoteTag.create!(tag: tag_three, note: note)
end

NoteTag.create!(tag: tag_four, note: note_two)

['What compelled you make this note?', 'What might cause you to deactivate this note?',
 'How could this note be abstracted?', "What's always, sometimes, and never true of this note?",
 "How could this note connect with another work you've consumed?",
 'How could this note connect with an experience in your life?',
 'Who might benefit from you sharing this note with? Who might benefit you?',
 'Where could you apply this note in your current projects?',
 'What are the constituent components of this note?', 'What does this note suggest?',
 'What are some examples of this note?', 'What are the important sub-components of this note?',
 'Is this note a part of some broader category?', 'Why does this note matter?'].each do |prompt|
   Prompt.create!(content: prompt)
 end
