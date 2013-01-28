# Activerecord::Pickin

INSERT SELECT Query For Active Record

## Installation

Add this line to your application's Gemfile:

    gem 'activerecord-pickin'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-pickin

## Usage

FromClass.relation.pickin(IntoClass, {column: value or column})

Example:

Map.where(stage_id: id).pickin(GameMap, {game_stage_id: @res.id, type: :type, x: :x, y: :y, created_at: :created_at, updated_at: :updated_at})

INSERT INTO 'game_maps' ("game_stage_id", "type", "x", "y", "created_at", "updated_at") SELECT 24, type, x, y, created_at, updated_at FROM "maps" WHERE "maps"."stage_id" = 1

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
