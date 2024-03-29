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

hlb_deck = Deck.create!(title: 'How Language Began', user: demo_user)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hlb_deck,
  content: "- Robin Dunbar: the main force driving hominins to develop greater intelligence was increased social complexity.\n	- Individual members of a society, like neurons in the brain, feature exponential growth in edges over linear growth in nodes\n	- The number of social relationships, then, grows exponentially from even modest increases in overall group size\n	- This exponential growth requires more intellectual horsepower\n	- Evidence: cortex size co-varies with group size across several species"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hlb_deck,
  content: "- Paul Grice: the four maxims\n	- Not advice: rather, a description of the conventions underlying communication\n	- Maxim of quality: assume interlocutors will both \n		- speak the truth, and \n		- expect the truth\n	- Maxim of quantity: assume interlocutors will\n		- relay the entirety of information necessary for the current interaction, and\n		- not relay more information than the interaction requires\n	- Maxim of relation: assume interlocutors will provide only information that is relevant to the current interaction\n	- Maxim of manner: assume interlocutors attempt to\n		- avoid obscurity,\n		- avoid ambiguity,\n		- communicate briefly, and\n		- communicate in an orderly manner\n	"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hlb_deck,
  content: "- John Austin\n	- Three 'actions' in a speech-event\n		1. Locutionary acts (what was said)\n		2. Illocutionary acts (what was meant)\n		3. Perlocutionary acts (what happened as a result of what was said and what was meant)\n	- When one attempts to communicate, they are hoping that: \n		- their locutionary act will properly map to \n		- the correct illocutionary act to \n		- produce the desired perlocutionary act."
)

htbl_deck = Deck.create!(title: 'How the Brain Learns', user: demo_user)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: htbl_deck,
  content: "- 'Long-term potentiation' is the process of neighboring neurons wiring together from firing together"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: htbl_deck,
  content: "- Effective practice: \n	- Starts with massed practice (for fast learning), then proceeds to \n	- distributed practice later for retention"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: htbl_deck,
  content: "- Reconsolidation\n	- whenever a previously-consolidated memory is recalled into working memory, \n	- it is vulnerable to alteration by any information already in working memory"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: htbl_deck,
  content: "- Two unrelated, oft-confused 'rates':\n	- Rate of learning: the speed with which information is encoded (from working memory to long-term memory)\n	- Rate of retrieval: an independent, learned skill that can be taught and improved"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: htbl_deck,
  content: "- Chunking\n	- Occurs when working memory perceives a set of data as a single item\n	- Allows us to increase the number of items that working memory can simultaneously handle"
)

hs_deck = Deck.create!(title: 'Hello, Startup', user: demo_user)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hs_deck,
  content: "- Try to become a 'T-shaped person': \n	- To be a generalist, you have to regularly seek out new ideas.\n	- To become an expert, you have to feel almost obsessively curious about a specific topic."
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hs_deck,
  content: "- Some of your assumptions are wrong. The problem is, you don’t know which ones.\n	- The only way to be sure that your efforts are not in vain is to spend some time with users.\n	- Study of >100 startup postmortems: #1 reason for failure, by a large margin: 'no market need'"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hs_deck,
  content: "- Steve Krug: 'The main thing you need to know about instructions is that no one is going to read them.'"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hs_deck,
  content: "- Most common design mistake:\n	- Confusing the following:\n		- a user’s goals (_what they want to accomplish_) with \n		- a user’s tasks (_how they accomplish it_).\n	- Tasks change as technology changes, but goals have the pleasant property of remaining very stable."
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hs_deck,
  content: "- People interact with computers and software much like they would with another human.\n	- Think of your product as a person: what type do you want it to be? Polite? Stern? Forgiving? Strict? Funny? Deadpan? Serious? Loose? \n	- Try to design software that acts like a considerate human being who remembers you."
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hs_deck,
  content: '- Instead of error messages, provide help and guidance: explain how the user’s input differs from what the program needs'
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hs_deck,
  content: '- When you A/B test, you often find that most of your features either hurt your metrics or have no impact.'
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hs_deck,
  content: "- All distributed systems are subject to the CAP theorem: \n- 'It is impossible for a distributed computer system to simultaneously provide all three of the following guarantees: \n	- Consistency: all nodes see the same data at the same time;\n	- Availability: every request receives a response about whether it succeeded or failed;\n	- Partition tolerance: the system continues to operate despite arbitrary message loss, or failure of part of the system'\n- In practice, all distributed systems must choose `P`, so the real question is: maintain consistency or availability? "
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hs_deck,
  content: "- Create an environment that maximizes:\n	- autonomy (_we want to decide: what we work on, when we work on it, how we work on it, and who we work with_)\n	- mastery (_we want to get better at things_), and\n	- purpose (_we want to build something bigger than ourselves, to leave our mark on the world_)"
)

hwl_deck = Deck.create!(title: 'How We Learn', user: demo_user)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hwl_deck,
  content: "- We work more effectively when we continually alter our study routines \n	- Abandon 'dedicated space' in favor of varied locations, to multiply the number of perceptions connected to a given memory\n	- The brain picks up patterns more efficiently when presented with a mixed bag of (related) tasks, as well"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hwl_deck,
  content: "- Using our memories changes our memories\n	- The brain does not store facts, ideas, and experiences like a computer does (_as a file that is clicked open, always displaying the identical image._) \n	- It embeds them in networks of perceptions, facts, and thoughts.\n	- Slightly different combinations of these bubble up each time. "
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hwl_deck,
  content: "- Old Theory of Disuse: memories evaporate entirely from the brain over time if they’re not used. \n- New Theory of Disuse: \n	- No complex memory comes back exactly the same way twice\n	- The act of forgetting filters some relevant details (_along with many irrelevant ones._)"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hwl_deck,
  content: "- Due to the passive side of forgetting (_the fading of retrieval strength over time_), deeper learning is facilitated once a fact or memory is found again.\n- The harder we have to work to retrieve a memory, the greater the subsequent spike in retrieval strength (_that is, in learning._)"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hwl_deck,
  content: "- Don't work straight from their notes when reviewing.\n	- Instead, create an entirely new outline, thereby forcing you to reorganizing the material.\n	- This in turn forces you to think about the material again, and in a different way."
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hwl_deck,
  content: "- Spacing is primarily a retention technique.\n  - Having more facts on board could very well help with comprehension, too\n  - For now, though, data supports it solely as a memorization strategy"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hwl_deck,
  content: "- The 'fluency illusion': the belief that, \n	- because facts or formulas or arguments are easy to remember right now, \n	- they’ll remain that way tomorrow or the next day. "
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hwl_deck,
  content: "- Arthur Gates' research: whether there's an ideal ratio between reading (memorizing) and reciting (rehearsal/practice)\n	- He concluded the best results are obtained by introducing recitation after devoting about 30 percent of the time to reading\n	- That is, spend the first third of your time memorizing the content, and the remaining two-thirds challenging yourself on it"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hwl_deck,
  content: "- Henry Roediger III and Jeffrey Karpicke's 2006 review of a century of experiments across all types of retention strategies\n	- They showed that the testing effect had been a strong, consistent 'contaminant' all along\n  - To measure any type of learning, after all, you have to administer a test"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hwl_deck,
  content: "- Pretesting: you’d almost certainly fail a first-day test of a course's content\n	- That experience, however, would influence what you subsequently pay attention to and process during the semester\n	- Unsuccessful retrieval attempts aren’t merely random failures; rather, they alter how we think about, and store, the information sought by the questions"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hwl_deck,
  content: "- Kerr and Booth's research: a varied practice schedule may facilitate the initial formation of motor schema (_e.g. hitting tennis balls_)"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hwl_deck,
  content: "- Psychologists who study learning tend to fall into one of two camps: the motor/movement, or the verbal/academic\n- The Molaison studies support this: they indicate that the brain must have at least two biological systems for handling memory\n  - One (_for declarative memories_) is dependent on the hippocampus\n  - The other (_for motor memories_) is based in different brain organs (_no hippocampus is required_)\n	- The two systemsa are likely distinct, too, in how they develop, strengthen, function, and fade"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: hwl_deck,
  content: "- Interleaving: the process of mixing related but distinct material during study\n	- Essentially, preparing the brain for the unexpected\n	- Goode and Magill: whenever researchers scrambled practice sessions (_e.g. location or serving-side of tennis court_) people improved more over time than if their practice was focused and uninterrupted\n	- Kornell and Bjork's painting study (_displaying six each of a dozen painters' works; students who saw the paintings interleaved better identified artists' new paintings than students who'd seen all six of an artist's works at once_) indicates this happens not merely for motor memories, but declarative ones as well"
)

ttlg_deck = Deck.create!(title: 'Through the Language Glass', user: demo_user)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: ttlg_deck,
  content: "- Sapir-Whorf hypothesis: languages differ in what they _permit_ their speakers to convey. \n- Boas-Jakobson principle: languages differ in what they _require_ their speakers to convey."
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: ttlg_deck,
  content: "- The real effects of a mother tongue are the habits that develop through the frequent use of certain ways of expression:\n    - the concepts we are trained to treat as distinct, \n    - the information our mother tongue continuously forces us to specify, \n    - the details it requires us to be attentive to, and \n    - the repeated associations it imposes on us."
)

ptp_deck = Deck.create!(title: 'Prototype to Product', user: demo_user)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: ptp_deck,
  content: '- The fundamental principle of product development: surprises only get more expensive if discovered later. '
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: ptp_deck,
  content: "- Two deadly sins of assumption: \n	- Assuming that you know what users want \n	- Assuming that users know what they want \n- People are generally much better at describing past behavior than in predicting future behavior"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: ptp_deck,
  content: "- Three deadly sins of fuzziness: \n	- Not having detailed requirements \n	- Not having a detailed project plan \n	- Not knowing who’s responsible for accomplishing what"
)

war_deck = Deck.create!(title: 'Words and Rules', user: demo_user)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: war_deck,
  content: '- Seeing the world in a grain of sand is often the way of science: geneticists agreed to study the lowly fruit fly so that their findings might cumulate into a deep understanding.'
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: war_deck,
  content: "- Why has no language used combinatorial grammar to abandon the onerous laundry list called vocabulary? \n	- It would force users to perform a chain of computations in their heads every time they wanted to refer to even quotidian objects.\n	- Words would be packed tight with information, lacking the safety of redundancy (_thus the slightest slip of the tongue or pen would guarantee misunderstanding._)"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: war_deck,
  content: "- Proto-Indo-European appears to have used internal-vowel shifts (ablauts) for past tenses.\n	- High-front vowels come first in \n		- expressions such as _pitter-patter_ and _dribs and drabs_\n		- pairs such as _this and that_, _here and there_, and _me and you_\n	- This is true not only in English, but in many families of languages:\n		- The higher and farther-to-the-front vowels are found in the word that means 'self' or 'near the self' \n		- The lower and farther-to-the-back word means 'other' or 'far from the self' \n	- Perhaps as Indo-European was developing, speakers vaguely felt that:\n		- lower and farther back vowels fit better with the concept of an event separated in time from the present, and\n		- higher and farther front vowels fit better with an event in the here and now\n	- This contrast, between a higher front vowel and a lower back vowel, survives in the majority of modern English irregular verbs (via e.g. the _ing—ang—ung_ class.)"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: war_deck,
  content: "- A neural network tries to accomplish intelligence using:\n	- Hume’s law of contiguity (_if A appears with B, associate them_) and \n	- Hume's law of resemblance (_if C looks like A, let it share A’s associations._)"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: war_deck,
  content: "- An example neural network: Rumelhart & McClelland (1986), for irregular past-tenses\n	- 460 input units connected to 460 output units = 211,600 microrules total\n	- The network’s final knowledge of a particular e.g. [word, irregular family, rule, etc] cannot be demarcated\n		- One cannot point to a circumscribed part of the network that implements a given rule\n		- Its understanding of the various verbs and their past-tense forms is smeared across the 211,600 connection strengths\n		- The model 'merely' associates the phonological features of one word with the phonological features of another word"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: war_deck,
  content: "- A problem with using neural-networks as a model for the human brain: \n	- The e.g. Rumelhart & McClelland (1986) pattern-associator only produces past-tense forms\n	- You cannot 'turn the arrows around,' getting the model to run backward and recognize past-tense forms\n	- Obviously, people's brains do both"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: war_deck,
  content: "- A problem with using neural-networks as a model for the human brain:\n	- Multiple dimensions of influence may not be encoded.\n	- For example, the Rumelhart & McClelland (1986) pattern-associator cannot tell the difference between two words that have the same sound. \n	- The model has no knowledge of of lexical entries; it relies entirely on a word’s sound\n	- That won’t work, though, for verbs like _ring—rang_/_wring—wrung_, _break—broke_/_brake—braked_, or _meet—met_/_mete—meted_"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: war_deck,
  content: "- The 'blocking principle' of irregular verbs:\n	- When you produce an irregular form, you have to: \n		- not only dredge it out of memory, but also\n		- repress the '_add -ed_' rule (so you don’t say e.g. _breaked_ or _broked_)\n  - Words and rules are accessed in parallel\n		- As we plan to utter a verb in the past tense, we simultaneously \n			- look up the word in memory and \n			- activate the rule\n		- An inhibitory link runs from the memory-module to the rule-module\n		- The memory-module can then gradually slow down the rule-module, as evidence for a match is found\n		- It may eventually turns the rule-module off for that retrieval"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: war_deck,
  content: "- Wittgenstein: a category can be extended to embrace new cases '_as in spinning a thread we twist fibre on fibre. And the strength of the thread does not reside in the fact that some one fibre runs through its whole length, but in the overlapping of many fibres._' \n	- Members of such categories are not created equal; they often have a best member or 'prototype' which sums up the category in people’s minds (_e.g. the sparrow for 'bird', or wrench for 'tool'_)\n	- Such categories often have fuzzy borders (_people aren’t quite sure whether garlic, parsley, or seaweed should count as vegetables_)\n	- Such categories' members often display 'crisscrossing features' (_many vegetables are green, but carrots aren’t; or crunchy when raw, but spinach isn’t._)\n	- Such categories often have stereotyped features, that everyone associates with the category, even if they have nothing to do with the criteria for membership (_e.g. thinking of 'gray hair and chicken soup,' not of 'node in a genealogical tree', for grandmothers_)"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: war_deck,
  content: '- The human mind is likely a hybrid system: one that learns fuzzy associations and crisp rules in different subsystems. '
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: war_deck,
  content: '- People form categories that give them an advantage in reasoning about the world, by allowing them to make predictions about things they have not directly experienced'
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: war_deck,
  content: "- We often have no choice but to use Wittgenstein's family-resemblance categories\n	- Many things we find around us could not be deduced by any body of laws, because they are shaped by myriad events of history no longer visible to us\n	- Not all such categories start off in lockstep and then diversify, but probably all are governed by:\n		- hidden laws that make them similar, and \n		- historical contingencies that make them different"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: war_deck,
  content: "- Much of the public sphere of life comes from tensions between:\n	- family resemblance categories built from experience\n		- these resonate with common sense, but \n		- leave us groping when faced with something that is neither fish nor fowl \n	- classical categories defined by science, law, or custom\n		- these offer neat divisions, but \n		- are bound to seem legalistic, pedantic, or abstruse"
)

zto_deck = Deck.create!(title: 'Zero to One', user: demo_user)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: zto_deck,
  content: '- Successful people find value in unexpected places, by thinking about topics from first principles instead of formulas'
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: zto_deck,
  content: '- If you can identify a delusional popular belief, you can find what lies behind it: the contrarian truth'
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: zto_deck,
  content: '- The first step thinking clearly is to question what we think we know about the past'
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: zto_deck,
  content: "- War is costly business: rivalry causes us to \n	- overemphasize old opportunities and \n	- slavishly copy what has worked in the past"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: zto_deck,
  content: "- When thinking about what to focus on, there are two distinct questions to ask:\n	- What secrets is nature not telling you?\n	- What secrets are people not telling you? (_Secrets about people are relatively underappreciated._)"
)

Note.create!(
  prompts_remaining: all_prompts.shuffle,
  deck: zto_deck,
  content: "- The best place to look for secrets is where no one else is looking: what fields\n	- matter, but \n	- haven’t been standardized and institutionalized?"
)
