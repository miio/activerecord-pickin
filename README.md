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

FromClass.relation.pickin(IntoClass, {select_override_column: value or column}, [ignore])

Example:

### for over version 0.9.0

  Map.where(stage_id: 1).pickin(GameMap, {game_stage_id: 24}, [:id])
  
    INSERT INTO 'game_maps' ("id", "game_stage_id", "type", "x", "y", "created_at", "updated_at") SELECT NULL, '24', "type", "x", "y", "created_at", "updated_at" FROM "maps" WHERE "maps"."stage_id" = 1

  Map.where(stage_id: 1).select([:type]).pickin(GameMap, {game_stage_id: 24}, [:id])
  
    INSERT INTO 'game_maps' ("type") SELECT "type" FROM "maps"  WHERE "maps"."stage_id" = 1

### for only version 0.0.1

  Map.where(stage_id: 1).pickin(GameMap, {game_stage_id: 24, type: :type, x: :x, y: :y, created_at: :created_at, updated_at: :updated_at})
  
  	INSERT INTO 'game_maps' ("game_stage_id", "type", "x", "y", "created_at", "updated_at") SELECT 24, type, x, y, created_at, updated_at FROM "maps" WHERE "maps"."stage_id" = 1

## Change log

### version 0.9.1

* fixes mysql not run bugs.

### version 0.9.0

* Release beta
* Specification was changed. The specified column was targeted. but now used to override the value of a column in the SELECT for.

### version 0.0.1

* Release alpha

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
