# frozen_string_literal: true

# This file can be:
#   - loaded with the `bin/rails db:seed` command, or
#   - created alongside the database with `db:setup`
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

demo_user = User.create!(name: 'young suss', email: 'ysuss@example.com', password: 'foobar')

prompt_one = Prompt.create!(content: "What's an exception to this?")
prompt_two = Prompt.create!(content: 'Where could you apply this today?')
prompt_three = Prompt.create!(content: 'How could you apply this to an unrelated discipline?')
prompt_four = Prompt.create!(content: 'Why do you think you initially excerpted this into a note?')
prompt_five = Prompt.create!(content: 'What would happen if the inverse were true?')

all_prompts = [prompt_one.id, prompt_two.id, prompt_three.id, prompt_four.id, prompt_five.id]

# first deck

pg_deck = Deck.create!(title: 'Paul Graham Essays', user: demo_user)

pg_note_one = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: pg_deck,
  content: "- It's not that unprestigious types of work are good, _per se_.\n- But when you find yourself drawn to some kind of work despite its current lack of prestige, it's a sign that:\n  - there's something real to be discovered there, and\n  - you have the right kind of motives.\n    - Impure motives are a big danger for the ambitious.\n    - If anything is going to lead you astray, it will be the desire to impress people.\n  - So while working on things that aren't prestigious doesn't guarantee you're on the right track, it at least guarantees you're not on the most common type of wrong one."
)

pg_note_two = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: pg_deck,
  content: "- One of my tricks for writing essays had always been to give talks.\n  - The prospect of having to\n    - stand up in front of a group of people and\n    - tell them something that wouldn't waste their time\n  - was a great spur to the imagination."
)

pg_note_three = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: pg_deck,
  content: "- Customs continue to constrain you long after the restrictions that caused them have disappeared.\n  - Customary VC practice had once, like the customs about publishing essays, been based on real constraints.\n    - Startups had once been much more expensive to start, and proportionally rare.\n    - Now they could be cheap and common, but\n      - the VCs' customs still reflected the old world, just as\n      - customs about writing essays still reflected the constraints of the print era.\n  - Which in turn implies that people who are independent-minded (i.e. less influenced by custom) will have an advantage in fields affected by rapid change (where customs are more likely to be obsolete).\n    - Here's an interesting point, though: you can't always predict which fields will be affected by rapid change.\n    - Obviously software and venture capital will be, but who would have predicted that essay writing would be?"
)

# second deck

ccss_deck = Deck.create!(title: 'Crash Course Study Skills', user: demo_user)

ccss_note_one = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: ccss_deck,
  content: "- Hand-written notes are superior to typed \n	- At least partially because the former forces you to focus more on the semantics (vs pure syntax) of the message you’re hearing \n	- This derives from the need to rephrase, in order to compensate for the slower pace of notetaking."
)

ccss_note_two = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: ccss_deck,
  content: "- Set a countdown timer as you sit down to read a chapter\n	- It’s not important to actually hit this goal; rather, \n	- It’s to help you focus on reading through to the end w/o distraction"
)

ccss_note_three = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: ccss_deck,
  content: '- Highlighting can be dangerous: it often confuses the user as to their actual recall abilities (vs their recognition skill)'
)

ccss_note_four = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: ccss_deck,
  content: "- SQ3R for Active Reading:\n	1. Surveying \n		- prime the brain\n		- skim the overview/headings/conclusion \n	2. Questioning \n		- focus the avenues of exploration\n		- write out some Q’s that come to mind before reading \n	3. Reading \n		- read in order to answer the questions generated by #2\n	4. Reciting \n		- later, retrieve from memory what you read \n		- imagine you were explaining it to a friend \n		- important to use your own words to rephrase the material\n	5. Review \n		- still later, repeat #4\n		- this time, use a deeper, more dialogic method \n		- you should need to return to the passage for citations and details"
)

ccss_note_five = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: ccss_deck,
  content: "- Robert Bjork’s 'desirable difficulty principle'\n	- Memories have two types of ‘strength’\n		1. Storage strength: once a memory is encoded, it can really only get stronger\n		2. Retrieval strength: this does fade with time\n	- The greater the difficulty in recalling a memory (i.e. the weaker the current retrieval strength), the greater the learning impact will be from recalling it."
)

ccss_note_six = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: ccss_deck,
  content: "- When problem-solving: \n	- Write down your failed solution attempts, as \n	- Reviewing them will help you envision new paths, via variations on them"
)

ccss_note_seven = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: ccss_deck,
  content: "- Next time you need to ask a senior dev for help, \n	- Note down and later analyze where you got blocked, then \n	- Think through how you could have gotten around that blocker yourself"
)

ccss_note_eight = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: ccss_deck,
  content: "- When researching:\n	- Prewrite first, to arm yourself with questions and potential lines of argument which will then help you focus your exploration;\n	- Prevent ‘research recursion syndrom’ by asking, after every few hours, whether you have:\n		- At least 2 sources for each main argument, and\n		- At least one source for each non-crucial point (and, if both are true, then stopping the research process in order to begin writing.)"
)

# third deck

p2020_meetup_deck = Deck.create!(title: 'EdTech Meetups', user: demo_user)

p2020_meetup_note_one = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: p2020_meetup_deck,
  content: "- Be careful of the trap of referencing user data that you already have.\n	- It's easy to use, and should be used: because it's already there.\n	- Don't take for granted, though, that it includes all the information you need (it almost certainly does not.) \n	- Be sure to ask yourself: what data do we *wish* we had?"
)

p2020_meetup_note_two = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: p2020_meetup_deck,
  content: "- Job to Be Done: what does the user want to achieve?\n	- Functional aspects\n		- e.g. cost, timing, duration, location\n		- Start with these, to quickly narrow down and focus your options\n	- Emotional aspects \n	  - e.g. personal (how the user feels) or social (how the user thinks society sees it)\n	  - Subjective requirements, so harder to reason about quantitatively\n	  - Ultimately, higher ROI for persuasion\n	- Good phrasing to start from: '_I need ${x} so that ${y}._'"
)

p2020_meetup_note_three = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: p2020_meetup_deck,
  content: "- Do your project/product for fun, then when it becomes overwhelming set up a company.\n  - 'Place small bets' \n    - first on your own, in your class; then \n    - Using gSites for a few friends; then \n    - trial with [4.0 Schools](https://4pt0.org/)\n    - Each time, test a progressively more important hypothesis\n  - Remember, a startup is inherently temporary\n    - It's a search for a model, not an institution.\n    - Steve Blank: '_a startup is just a discovery process for a business: once you have a sustainable, scalable model? Then it's a business._'"
)

# fourth deck

educause_deck = Deck.create!(title: "Educause's 7 Things You Should Know", user: demo_user)

educause_note_one = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: educause_deck,
  content: "- Adaptive Learning: several variants, along gradient of “time cost to develop” vs “later flexibility”:\n  - ‘Closed’ system: premade adaptive logic and course content;\n  - ‘Open’ system: requires user to configure course content and adaptive logic;\n  - ‘Hybrid’ system: provides logic; user adds content (currently fastest-growing)"
)

educause_note_two = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: educause_deck,
  content: "- Adaptive Learning: eliminates need to ‘teach to the middle’ in larger courses\n  - Works better with factual, procedural knowledge than with higher-order/strategic knowledge \n  - As such, more appropriate to entry-level courses"
)

educause_note_three = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: educause_deck,
  content: "- Intelligent Tutoring Systems: differ from other computer-training systems in two ways\n  - Can interpret complex student responses\n    - Not merely from worked examples, but\n    - Also from the details of requests (for assistance)\n  - Can learn as they operate\n    - First, build a profile for each student (from that student’s work and requests), then \n    - Estimate each student's level of mastery (in order to select future assignments)"
)

educause_note_four = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: educause_deck,
  content: "- One early discovery in research on Intelligent Tutoring Systems: struggling students should explain what they *do* understand to the tutor\n  - The tutor then can provide just enough hints for the student to work out the solution on their own \n  - Better than the traditional model (i.e. the tutor reexplaining the process via a different analogy, medium, level of detail, etc.)"
)

educause_note_five = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: educause_deck,
  content: "- Intelligent Tutoring Systems often currently interact with complex student behavior ('more than just the answer') by \n  - breaking complex tasks down into sequences (or trees) of process-based steps, each of which\n  - requires the student to provide some form of “work” (e.g. a diagram/equation/summary/etc.)"
)

# fifth deck

meditation_deck = Deck.create!(title: 'Practicing Mindfulness (Great Courses)', user: demo_user)

meditation_note_one = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: meditation_deck,
  content: "- _Bhavana_, or 'cultivation,' is closer to mindfulness practice than the term 'meditation' (it's not about ruminating deeply)"
)

meditation_note_two = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: meditation_deck,
  content: "- Mindfulness: \n  - A moment-by-moment awareness\n  - The process of attentively observing your experience as it unfolds, without judgment or comparisons\n  - The recognition of each thought as a momentary event that passes through the mind"
)

meditation_note_three = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: meditation_deck,
  content: "- _ekgrata,_ or 'one-pointedness' \n  - The ultimate/eventual goal of mindfulness: learning to concentrate\n  - First step is mere awareness of when one fails to concentrate\n  - Possible be distracted by thoughts, or by sensations\n		- For the former, simply observe 'thinking'; the latter, 'feeling.'\n		- After, return attention to movement/cycle of the breath"
)

meditation_note_four = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: meditation_deck,
  content: "- The mindfulness tradition holds that boredom is not caused by our circumstances\n	- Rather, it's the product of inattention\n	- That is, it's the result of withdrawing our full attention from what's happening at the moment"
)

meditation_note_five = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: meditation_deck,
  content: "- The belief that 'pain shouldn't happen to us' is a common cause of suffering\n  - This is literally delusional: it's inconsistent with the nature of the world\n	- When you experience pain (during e.g. meditation): \n		- First, simply attempt to deliberately, mindfully eliminate it (looser clothes, different cushion)\n		- Second, simply observe: draw your attention to the pain, and investigate it\n		- Become a bystander; notice its qualities, and impermanence"
)

meditation_note_six = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: meditation_deck,
  content: "- When you notice yourself thinking, consider whether it's:\n  - rooted in selfishness/desires,\n  - rooted in hatred/aversion, and/or\n  - rooted in unrealistic beliefs about the world."
)

meditation_note_seven = Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: meditation_deck,
  content: "- To disarm a harmful thought:\n  - Replacement (with a helpful corrolary thought) \n    - For desire, thoughts of the object-of-desire's impermanence; \n    - For animosity, thoughts of compassion for the object-of-dislike; \n    - For delusion, thoughts based in reality.\n  - Reflecting on Results (contemplate the consequences of the harmful thought: even if it's simply 'being a person whose mind frequently harbors and conjures such thoughts')\n  - Reconstructing (examine the antecedents of the thought)\n  - Redirecting (acknowledging that thoughts, like all else, pass away: then returning focus to e.g. the breath, or the elements of the body)"
)
# tags

tag_one = Tag.create!(content: '"What I Worked On"')
tag_two = Tag.create!(content: 'from an essay')
tag_three = Tag.create!(content: 'what to focus on')
tag_four = Tag.create!(content: 'productivity')
tag_five = Tag.create!(content: 'notetaking')
tag_six = Tag.create!(content: 'researching')
tag_seven = Tag.create!(content: 'memory')
tag_eight = Tag.create!(content: 'problem-solving')
tag_nine = Tag.create!(content: 'product')
tag_ten = Tag.create!(content: 'from a lecture')
tag_eleven = Tag.create!(content: 'pedagogy')
tag_twelve = Tag.create!(content: 'meditation')

[pg_note_one, pg_note_two, pg_note_three].each do |note|
  NoteTag.create!(tag: tag_one, note: note)
end

[pg_note_one, pg_note_two, pg_note_three, educause_note_one, educause_note_two,
 educause_note_three, educause_note_four, educause_note_five].each do |note|
  NoteTag.create!(tag: tag_two, note: note)
end

[pg_note_one, pg_note_three].each do |note|
  NoteTag.create!(tag: tag_three, note: note)
end

NoteTag.create!(tag: tag_four, note: pg_note_two)

[ccss_note_one, ccss_note_three].each do |note|
  NoteTag.create!(tag: tag_five, note: note)
end

[ccss_note_one, ccss_note_three, ccss_note_two, ccss_note_four, ccss_note_eight].each do |note|
  NoteTag.create!(tag: tag_six, note: note)
end

NoteTag.create!(tag: tag_seven, note: ccss_note_five)

[ccss_note_six, ccss_note_seven].each do |note|
  NoteTag.create!(tag: tag_eight, note: note)
end

[p2020_meetup_note_one, p2020_meetup_note_two, p2020_meetup_note_three, educause_note_one,
 educause_note_two, educause_note_three, educause_note_four, educause_note_five].each do |note|
  NoteTag.create!(tag: tag_nine, note: note)
end

[ccss_note_one, ccss_note_two, ccss_note_three, ccss_note_four, ccss_note_five, ccss_note_six,
 ccss_note_seven, ccss_note_eight, p2020_meetup_note_one, p2020_meetup_note_two,
 p2020_meetup_note_three, meditation_note_one, meditation_note_two, meditation_note_three,
 meditation_note_four, meditation_note_five, meditation_note_six,
 meditation_note_seven].each do |note|
  NoteTag.create!(tag: tag_ten, note: note)
end

[educause_note_one, educause_note_two, educause_note_three, educause_note_four,
 educause_note_five].each do |note|
  NoteTag.create!(tag: tag_eleven, note: note)
end

[meditation_note_one, meditation_note_two, meditation_note_three, meditation_note_four,
 meditation_note_five, meditation_note_six, meditation_note_seven].each do |note|
  NoteTag.create!(tag: tag_twelve, note: note)
end
