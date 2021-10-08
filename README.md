# Mokko -- Backend

## What is this?

I took the initial idea from [this post:](https://notes.andymatuschak.org/Spaced_repetition_systems_can_be_used_to_program_attention) I found the possibility of gently, recurringly directing myself to ruminate on certain concepts compelling.

Here's my original spec:

```
- spaced interaction: follows simplified leitner-box sequencing
	- notes aren't flashcards, however: doesn't ask you to answer a question
	- each note is not a fact, but an e.g. claim, or observation, or mental model
	- rather than increasing retrieval strength of note's content, aims to exercise contemplation/investigation of note's content
- in addition to note's content, each interaction provides user with a single question
	- only presents you with one prompt per interaction, but lets you swipe to choose a different prompt if desired
	- user fills out one prompt (via a textbox) to 'complete' the interaction
- next time the note comes up
	- it's got the initial text, but also 
	- the commentar(y/ies) you've added prior (hidden accordion-style?)
```

While working toward an MVP, I replaced:
- the Leitner-box system sequencing with a simple `<select>` that included a ~Fibonacci sequence of days, for greater flexibility; and
- the "_each interaction provides user with a single question_" model with a randomly-selected "prompt-note" to pair with, complement, qualify, contradict, or otherwise Hegel-dialecticify the note-under-contemplation's content.

After working through such options as (_in decreasing order of repugnance_) "ZettelCast", "Reflectric", "Myslennya", and "[Forster](https://www.goodreads.com/quotes/656524-only-connect-that-was-the-whole-of-her-sermon-only)-[Wallace](https://fs.blog/2012/04/david-foster-wallace-this-is-water/) Collider", I settled on the provisional name of "[Mokko](https://en.wiktionary.org/wiki/%E9%BB%99%E8%80%83)", a nice two-syllable Japanese abstract noun to pair with my personal usage of [Anki](https://en.wiktionary.org/wiki/%E6%9A%97%E8%A8%98#Japanese).

And this repo is the backend for that app!

## How's it work?

Let me begin not with an excuse, or apology, but defiant explanation: I had a vision of a tool, and _I. Wanted. It. Now._ The two frameworks I've worked with the most are React and Rails, and so that's what I decided to use for getting a working prototype out the door.

I adapted the JWT from [this tutorial](https://www.pluralsight.com/guides/token-based-authentication-with-ruby-on-rails-5-api); I felt like `devise` was overkill for this project and liked that it didn't unnecessarily incorporate that gem.

Early on, I committed the cardinal sin of touching migration files (_it was late on a Thursday! I was tired and had stuff to do!_); that should explain any remaining discrepancies inside `db/migrate/*`.

Beyond that, the majority of the non-CRUD functionality is in (_ayyy look! More antipatterns!_) the `NotesController`, particularly `NotesController#review`.

## How do I set it up?

For a local version, you'll... 
- pull down the repo;
- run `bundle install`;
- run `rails db:prepare`; and
- run `rails s -p 5000` (_assuming you want to use it with the complementary frontend code._)

This'll return JSON from e.g. Postman, but I'd recommend pulling and running a local version of the [app's UI](https://github.com/ypaulsussman/mokko-web), as well, for readability/discoverability.

For setting up a remote version, I'll leave the steps to [the professionals](https://devcenter.heroku.com/articles/getting-started-with-rails6#deploy-your-application-to-heroku).

## What's next?

Not much, at least for a while. 

I dropped the app on Netlify/Heroku and used it for six weeks, to 
1. confirm that it engaged recurring focus on ideas that interested me, perhaps even actuating new thoughts or interpretations of those ideas (_success!_); and 
2. surface frictions, deficiencies, bugs, etc that arose during daily usage (_...alas, also success!_)

My initial extrinsic motivation for creating/using this tool, however, was to first populate, then winnow down, topics on which I might conduct PhD research. And that's not on the horizon for severrrrrral years.

(_Moreover, it's something I'd like to eventually share with non/quasi-technical peers for review, and the best way to do that is likely as a native app with eventual cloud-backup. And that means either learning QT or diving back into Electron... both of which are probably even further down the horizon._) 😹
