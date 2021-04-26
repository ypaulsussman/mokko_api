# mokko API (v1)

I'm working through a little experiment on how to adapt a spaced-repetition system to practice [observing, contemplating, interrogating] [claims, ideas, concepts]. (_As opposed to their traditional use, improving retrieval strength of facts._)

I'd also like to get more in-depth familiarity with React Hooks and (_time permitting_) TypeScript, so I'm planning to build this tool through a fairly heavy client.

Most of my server-side experience is in Railsland, so I've spun up this codebase to provide authwalled (_via JWT_) access (_via HTTP_) to persistent data (_via PostgreSQL._)

That's all there is, really! You can see the schema (_and_ `db/seeds.rb`) for how I currently envision the data model.

## Usage

- Pull postgresql (v12) from `apt`/`brew`/etc
- Set up `rbenv`; add Ruby 3.0.1
- Clone/download this repo
- `bundle install` from inside the dir
- `rails db:prepare`
- `foreman start` (or, really, `rails s`)
