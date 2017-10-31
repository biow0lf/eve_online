# EveOnline API (XML and ESI). With SDE.

[![Gem Version](https://badge.fury.io/rb/eve_online.svg)](https://badge.fury.io/rb/eve_online)
[![Gem Downloads](https://img.shields.io/gem/dt/eve_online.svg)](https://rubygems.org/gems/eve_online)
[![Code Climate](https://codeclimate.com/github/biow0lf/eve_online/badges/gpa.svg)](https://codeclimate.com/github/biow0lf/eve_online)
[![Test Coverage](https://codeclimate.com/github/biow0lf/eve_online/badges/coverage.svg)](https://codeclimate.com/github/biow0lf/eve_online/coverage)
[![Build Status](https://travis-ci.org/biow0lf/eve_online.svg?branch=master)](https://travis-ci.org/biow0lf/eve_online)
[![Dependency Status](https://gemnasium.com/biow0lf/eve_online.svg)](https://gemnasium.com/biow0lf/eve_online)
[![security](https://hakiri.io/github/biow0lf/eve_online/master.svg)](https://hakiri.io/github/biow0lf/eve_online/master)

This gem implement Ruby API for EveOnline MMORPG. XML and ESI API. With SDE.

This gem was extracted from [EveMonk](http://evemonk.com). Source code of evemonk backend published [here](https://github.com/biow0lf/evemonk).

You will need to add xml parser to your Gemfile to use this gem. E.g. `nokogiri`. Or any other xml parser which are supported by nori.

EveOnline XML API deprecated. And will be removed in near future. From this library and by [CCP developers](https://community.eveonline.com/news/dev-blogs/introducing-esi/).

## TOC

* [Installation](#installation)
* [Supported ruby versions](#supported-ruby-versions)
* [Usage](#usage)
* [Useful links](#useful-links)
* [Development](#development)
* [Contributing](#contributing)
* [Implementation check list](#implementation-check-list)
* [TODO](#todo)
* [Author](#author)
* [Contributors. Thank you everyone!](#contributors-thank-you-everyone)
* [License](#license)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eve_online'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eve_online

## Supported ruby versions

 * MRI 2.2
 * MRI 2.3
 * MRI 2.4
 * MRI 2.5 (head)
 * JRuby 9.1.8.0
 * JRuby (head)

## Supported rails versions

 * 4.2
 * 5.0
 * 5.1
 * Edge

## Usage

### XML API

#### Account status

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'

account_status = EveOnline::XML::AccountStatus.new(key_id, v_code)

account_status.as_json
# => {:paid_until=>Mon, 28 Dec 2015 18:12:56 UTC +00:00, :create_date=>Fri, 15 Jan 2010 15:11:00 UTC +00:00, :logon_count=>388, :logon_minutes=>15598}

account_status.paid_until # => Mon, 28 Dec 2015 18:12:56 UTC +00:00
account_status.create_date # => Fri, 15 Jan 2010 15:11:00 UTC +00:00
account_status.logon_count # => 388
account_status.logon_minutes # => 15598

account_status.current_time # => Mon, 23 Nov 2015 18:53:46 UTC +00:00
account_status.cached_until # => Mon, 23 Nov 2015 19:28:38 UTC +00:00
account_status.version # => 2

# TODO: add multi character training support
```

#### Api Key Info

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'

api_key_info = EveOnline::XML::ApiKeyInfo.new(key_id, v_code)

api_key_info.as_json
# => {:access_mask=>1073741823, :api_key_type=>:character, :expires=>Fri, 02 Dec 2016 18:13:59 UTC +00:00}

api_key_info.access_mask # => 1073741823
api_key_info.api_key_type # => :character
api_key_info.expires # => Fri, 02 Dec 2016 18:13:59 UTC +00:00

api_key_info.current_time # => Mon, 30 Nov 2015 23:00:38 UTC +00:00
api_key_info.cached_until # => Mon, 30 Nov 2015 23:05:38 UTC +00:00
api_key_info.version # => 2

api_key_info.characters.size # => 2

character = api_key_info.characters.first

character.as_json
# => {:character_id=>90729314, :character_name=>"Green Black", :corporation_id=>1000168, :corporation_name=>"Federal Navy Academy", :alliance_id=>0, :alliance_name=>"", :faction_id=>0, :faction_name=>""}

character.character_id # => 90729314
character.character_name # => "Green Black"
character.corporation_id # => 1000168
character.corporation_name # => "Federal Navy Academy"
character.alliance_id # => 0
character.alliance_name # => ""
character.faction_id # => 0
character.faction_name # => ""
```

#### Characters

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'

characters = EveOnline::XML::AccountCharacters.new(key_id, v_code)
characters.version # => 2
characters.current_time # => Mon, 30 Nov 2015 23:31:31 UTC +00:00
characters.cached_until # => Tue, 01 Dec 2015 00:28:31 UTC +00:00

characters.characters.size # => 2

character = characters.characters.first

character.as_json
# => {:character_id=>90729314, :character_name=>"Green Black", :corporation_id=>1000168, :corporation_name=>"Federal Navy Academy", :alliance_id=>0, :alliance_name=>"", :faction_id=>0, :faction_name=>""}

character.character_id # => 90729314
character.character_name # => "Green Black"
character.corporation_id # => 1000168
character.corporation_name # => "Federal Navy Academy"
character.alliance_id # => 0
character.alliance_name # => ""
character.faction_id # => 0
character.faction_name # => ""
```

#### Character Account Balance

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
options = { character_id: 90729314 }

account_balance = EveOnline::XML::CharacterAccountBalance.new(key_id, v_code, options)

account_balance.as_json
# => {:account_id=>42763123, :account_key=>1000, :balance=>5000.0, :current_time=>Wed, 02 Dec 2015 20:29:32 UTC +00:00, :cached_until=>Wed, 02 Dec 2015 20:40:42 UTC +00:00}

account_balance.account_id # => 42763123
account_balance.account_key # => 1000
account_balance.balance # => 5000.0
account_balance.current_time # => Wed, 02 Dec 2015 20:29:32 UTC +00:00
account_balance.cached_until # => Wed, 02 Dec 2015 20:40:42 UTC +00:00
account_balance.version # => 2
```

#### Character Asset List

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
options = { character_id: 90729314 }

asset_list = EveOnline::XML::CharacterAssetList.new(key_id, v_code, options)

asset_list.current_time # => Mon, 29 Feb 2016 21:51:38 UTC +00:00
asset_list.cached_until # => Tue, 01 Mar 2016 03:48:38 UTC +00:00
asset_list.version # => 2

asset_list.assets.size # => 642

asset = asset_list.assets.first

asset.as_json
# => {:item_id=>408887580, :location_id=>60000634, :type_id=>588, :quantity=>1, :flag=>4, :singleton=>1, :raw_quantity=>-1}

asset.item_id # => 408887580
asset.location_id # => 60000634
asset.type_id # => 588
asset.quantity # => 1
asset.flag # => 4
asset.singleton # => 1
asset.raw_quantity # => -1
```

#### Character Blueprints

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
options = { character_id: 90729314 }

blueprints = EveOnline::XML::CharacterBlueprints.new(key_id, v_code, options)

blueprints.current_time # => Sun, 03 Jan 2016 14:36:37 UTC +00:00
blueprints.cached_until # => Mon, 04 Jan 2016 02:06:37 UTC +00:00
blueprints.version # => 2

blueprints.blueprints.size # => 4

blueprint = blueprints.blueprints.first

blueprint.as_json
# => {:item_id=>716338097, :location_id=>61000032, :type_id=>1010, :type_name=>"Small Shield Extender I Blueprint", :flag_id=>4, :quantity=>-2, :time_efficiency=>0, :material_efficiency=>10, :runs=>300}

blueprint.item_id # => 716338097
blueprint.location_id # => 61000032
blueprint.type_id # => 1010
blueprint.type_name # => "Small Shield Extender I Blueprint"
blueprint.flag_id # => 4
blueprint.quantity # => -2
blueprint.time_efficiency # => 0
blueprint.material_efficiency # => 10
blueprint.runs # => 300
```

#### Characters Bookmarks

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
options = { character_id: 90729314 }

bookmarks = EveOnline::XML::CharacterBookmarks.new(key_id, v_code, options)

bookmarks.current_time # => Sun, 03 Jan 2016 14:53:44 UTC +00:00
bookmarks.cached_until # => Sun, 03 Jan 2016 15:50:44 UTC +00:00
bookmarks.version # => 2

bookmarks.bookmark_folders.size # => 4

bookmark_folder = bookmarks.bookmark_folders.first # => #<EveOnline::BookmarkFolder:0x007fda7521a4b0 ....

bookmark_folder.as_json # => {:folder_id=>0, :folder_name=>""}

bookmark_folder.folder_id # => 0
bookmark_folder.folder_name # => ""

bookmark_folder.bookmarks.size # => 87

bookmark = bookmark_folder.bookmarks.first # => #<EveOnline::Bookmark:0x007fc8b49f3880 @options={"@bookmarkID"=>"459411933", "@creatorID"=>"0", "@created"=>"2009-03-28 07:51:00", "@itemID"=>"0", "@typeID"=>"5", "@locationID"=>"30002656", "@x"=>"-267396330161", "@y"=>"-376627274", "@z"=>"-556366331388", "@memo"=>"1", "@note"=>""}>

bookmark.as_json # => {:bookmark_id=>459411933, :creator_id=>0, :created=>Sat, 28 Mar 2009 07:51:00 UTC +00:00, :item_id=>0, :type_id=>5, :location_id=>30002656, :x=>-267396330161.0, :y=>-376627274.0, :z=>-556366331388.0, :memo=>"1", :note=>""}

bookmark.bookmark_id # => 459411933
bookmark.creator_id # => 0
bookmark.created # => Sat, 28 Mar 2009 07:51:00 UTC +00:00
bookmark.item_id # => 0
bookmark.type_id # => 5
bookmark.location_id # => 30002656
bookmark.x # => -267396330161.0
bookmark.y # => -376627274.0
bookmark.z # => -556366331388.0
bookmark.memo # => "1"
bookmark.note # => ""
```

#### Character Calendar Event Attendees

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314
event_id = 1234567

cea = EveOnline::XML::CharacterCalendarEventAttendees.new(key_id, v_code, character_id, event_id)

cea.current_time # => Mon, 21 Dec 2015 18:36:33 UTC +00:00
cea.cached_until # => Mon, 21 Dec 2015 18:36:33 UTC +00:00
cea.version # => 2

# TODO: finish this

````

#### Character Sheet

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
options = { character_id: 90729314 }

character_sheet = EveOnline::XML::CharacterSheet.new(key_id, v_code, options)

character_sheet.current_time # => Sun, 17 Jul 2016 12:27:11 UTC +00:00
character_sheet.cached_until # => Sun, 17 Jul 2016 13:24:11 UTC +00:00
character_sheet.version # => 2

character_sheet.as_json
# => {:id=>90729314, :name=>"Green Black", :home_station_id=>61000032, :dob=>Fri, 15 Jan 2010 15:26:00 UTC +00:00, :race=>"Minmatar", :blood_line_id=>4, :blood_line=>"Brutor", :ancestry_id=>24, :ancestry=>"Slave Child", :gender=>:male, :corporation_name=>"MyLittleDragon", :corporation_id=>98134807, :alliance_name=>"Kids With Guns Alliance", :alliance_id=>99005443, :faction_name=>nil, :faction_id=>0, :clone_type_id=>164, :clone_name=>"Clone Grade Alpha", :clone_skill_points=>0, :free_skill_points=>400000, :free_respecs=>2, :clone_jump_date=>Fri, 27 Jul 2012 14:50:11 UTC +00:00, :last_respec_date=>Sat, 07 May 2011 12:58:06 UTC +00:00, :last_timed_respec=>Sat, 07 May 2011 12:58:06 UTC +00:00, :remote_station_date=>Tue, 30 Jun 2015 21:51:13 UTC +00:00}

character_sheet.id # => 90729314
character_sheet.name # => "Green Black"
character_sheet.home_station_id # => 61000032
character_sheet.dob # => Fri, 15 Jan 2010 15:26:00 UTC +00:00
character_sheet.race # => "Minmatar"
character_sheet.blood_line_id # => 4
character_sheet.blood_line # => "Brutor"
character_sheet.ancestry_id # => 24
character_sheet.ancestry # => "Slave Child"
character_sheet.gender # => :male
character_sheet.corporation_name # => "MyLittleDragon"
character_sheet.corporation_id # => 98134807
character_sheet.alliance_name # => "Kids With Guns Alliance"
character_sheet.alliance_id # => 99005443
character_sheet.faction_name # => nil
character_sheet.faction_id # => 0
character_sheet.clone_type_id # => 164
character_sheet.clone_name # => "Clone Grade Alpha"
character_sheet.clone_skill_points # => 0
character_sheet.free_skill_points # => 400000
character_sheet.free_respecs # => 2
character_sheet.clone_jump_date # => Fri, 27 Jul 2012 14:50:11 UTC +00:00
character_sheet.last_respec_date # => Sat, 07 May 2011 12:58:06 UTC +00:00
character_sheet.last_timed_respec # => Sat, 07 May 2011 12:58:06 UTC +00:00
character_sheet.remote_station_date # => Tue, 30 Jun 2015 21:51:13 UTC +00:00
character_sheet.jump_activation # => Mon, 01 Jan 0001 00:00:00 UTC +00:00
character_sheet.jump_fatigue # => Mon, 01 Jan 0001 00:00:00 UTC +00:00
character_sheet.jump_last_update # => Mon, 01 Jan 0001 00:00:00 UTC +00:00
character_sheet.balance # => 5000.0
character_sheet.intelligence # => 21
character_sheet.memory # => 21
character_sheet.charisma # => 17
character_sheet.perception # => 20
character_sheet.willpower # => 20

character_sheet.implants.size # => 5

implant = character_sheet.implants.first # => #<EveOnline::Implant:0x007fdd34c88110 @options={"@typeID"=>"9899", "@typeName"=>"Ocular Filter - Basic"}>

implant.as_json # => {:type_id=>9899, :type_name=>"Ocular Filter - Basic"}

implant.type_id # => 9899
implant.type_name # => "Ocular Filter - Basic"

character_sheet.skills.size # => 180

skill = character_sheet.skills.first # => #<EveOnline::Skill:0x007fc1951e1b18 @options={"@typeID"=>"2495", "@skillpoints"=>"1000", "@level"=>"1", "@published"=>"1"}>

skill.as_json # => {:type_id=>2495, :skillpoints=>1000, :level=>1, :published=>true}

skill.type_id # => 2495
skill.skillpoints # => 1000
skill.level # => 1
skill.published # => true

character_sheet.jump_clones.size # => 2

jump_clone = character_sheet.jump_clones.first # => #<EveOnline::JumpClone:0x007fa2341cdb48 @options={"@jumpCloneID"=>"22357400", "@typeID"=>"164", "@locationID"=>"61000032", "@cloneName"=>""}, @jump_clone_id=22357400, @type_id=164, @location_id=61000032, @clone_name="">

jump_clone.as_json # => {:jump_clone_id=>22357400, :type_id=>164, :location_id=>61000032, :clone_name=>""}

jump_clone.jump_clone_id # => 22357400
jump_clone.type_id # => 164
jump_clone.location_id # => 61000032
jump_clone.clone_name # => ""

character_sheet.jump_clone_implants.size # => 15

jump_clone_implant = character_sheet.jump_clone_implants.first # => #<EveOnline::JumpCloneImplant:0x007fae9a929b40 @options={"@jumpCloneID"=>"22703029", "@typeID"=>"10209", "@typeName"=>"Memory Augmentation - Improved"}>

jump_clone_implant.as_json # => {:jump_clone_id=>22703029, :type_id=>10209, :type_name=>"Memory Augmentation - Improved"}

jump_clone_implant.jump_clone_id # => 22703029
jump_clone_implant.type_id # => 10209
jump_clone_implant.type_name # => "Memory Augmentation - Improved"

# TODO: finish this

```

#### Character chat channels

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
options = { character_id: 90729314 }

character_chat_channels = EveOnline::XML::CharacterChatChannels.new(key_id, v_code, options)

character_chat_channels.current_time # => Fri, 19 Aug 2016 11:05:43 UTC +00:00
character_chat_channels.cached_until # => Fri, 19 Aug 2016 11:19:44 UTC +00:00
character_chat_channels.version # => 2

# TODO: finish this

```

#### Character contact list

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
options = { character_id: 90729314 }

contact_list = EveOnline::XML::CharacterContactList.new(key_id, v_code, options)

contact_list.current_time # => Fri, 19 Aug 2016 11:08:06 UTC +00:00
contact_list.cached_until # => Fri, 19 Aug 2016 11:22:07 UTC +00:00
contact_list.version # => 2

# TODO: finish this

```

#### Character contact notifications

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

contact_notifications = EveOnline::XML::CharacterContactNotifications.new(key_id, v_code, character_id)

contact_notifications.current_time # => Fri, 19 Aug 2016 11:10:23 UTC +00:00
contact_notifications.cached_until # => Fri, 19 Aug 2016 11:37:23 UTC +00:00
contact_notifications.version # => 2

contact_notifications.contact_notifications.size # => 3

contact_notification = contact_notifications.contact_notifications.first # => #<EveOnline::ContactNotification:0x007fe00413d4e0 @options={"@notificationID"=>"308734131", "@senderID"=>"797400947", "@senderName"=>"CCP Garthagk", "@sentDate"=>"2016-03-19 12:13:00", "@messageData"=>"level: 5\nmessage: ''\n"}>

contact_notification.as_json # => {:notification_id=>308734131, :sender_id=>797400947, :sender_name=>"CCP Garthagk", :sent_date=>Sat, 19 Mar 2016 12:13:00 UTC +00:00, :message_data=>"level: 5\nmessage: ''\n"}

contact_notification.notification_id # => 308734131
contact_notification.sender_id # => 797400947
contact_notification.sender_name # => "CCP Garthagk"
contact_notification.sent_date # => Sat, 19 Mar 2016 12:13:00 UTC +00:00
contact_notification.message_data # => "level: 5\nmessage: ''\n"
```

#### Character contract bids

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

contract_bids = EveOnline::XML::CharacterContractBids.new(key_id, v_code, character_id)

contract_bids.current_time # => Fri, 19 Aug 2016 12:11:52 UTC +00:00
contract_bids.cached_until # => Fri, 19 Aug 2016 12:25:52 UTC +00:00
contract_bids.version # => 2

# TODO: finish this

```

#### Character contract items

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314
contract_id = 1234 # TODO: recheck

contract_items = EveOnline::XML::CharacterContractItems.new(key_id, v_code, character_id, contract_id)

# TODO: finish this

```

#### Character contacts

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

contracts = EveOnline::XML::CharacterContracts.new(key_id, v_code, character_id)

contracts.current_time # => Fri, 19 Aug 2016 10:57:38 UTC +00:00
contracts.cached_until # => Fri, 19 Aug 2016 11:11:38 UTC +00:00
contracts.version # => 2

# TODO: finish this

```

#### Character factional warfare stats

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

fac_war_stats = EveOnline::XML::CharacterFacWarStats.new(key_id, v_code, character_id)

# TODO: finish this

```

#### Character industry jobs

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

industry_jobs = EveOnline::XML::CharacterIndustryJobs.new(key_id, v_code, character_id)

industry_jobs.current_time # => Mon, 22 Aug 2016 14:10:13 UTC +00:00
industry_jobs.cached_until # => Mon, 22 Aug 2016 14:24:13 UTC +00:00
industry_jobs.version # => 2

# TODO: finish this

```

#### Character industry jobs history

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

industry_jobs_history = EveOnline::XML::CharacterIndustryJobsHistory.new(key_id, v_code, character_id)

industry_jobs_history.current_time # => Mon, 22 Aug 2016 14:53:37 UTC +00:00
industry_jobs_history.cached_until # => Mon, 22 Aug 2016 20:29:37 UTC +00:00
industry_jobs_history.version # => 2

# TODO: finish this

```

#### Character kill mails

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

kill_mails = EveOnline::XML::CharacterKillMails.new(key_id, v_code, character_id)

kill_mails.current_time # => Fri, 26 Aug 2016 10:27:38 UTC +00:00
kill_mails.cached_until # => Fri, 26 Aug 2016 10:54:38 UTC +00:00
kill_mails.version # => 2

# TODO: finish this

```

#### Character locations

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314
ids = [123456]

locations = EveOnline::XML::CharacterLocations.new(key_id, v_code, character_id, ids)

locations.current_time # => Fri, 26 Aug 2016 11:01:53 UTC +00:00
locations.cached_until # => Fri, 26 Aug 2016 12:01:53 UTC +00:00
locations.version # => 2

# TODO: finish this

```

#### Character mail bodies

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314
ids = [123456]

mail_bodies = EveOnline::XML::CharacterMailBodies.new(key_id, v_code, character_id, ids)

mail_bodies.current_time # => Fri, 26 Aug 2016 11:13:55 UTC +00:00
mail_bodies.cached_until # => Mon, 24 Aug 2026 11:13:55 UTC +00:00
mail_bodies.version # => 2

# TODO: finish this

```

#### Character mailing lists

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

mailing_lists = EveOnline::XML::CharacterMailingLists.new(key_id, v_code, character_id)

mailing_lists.current_time # => Fri, 26 Aug 2016 12:38:48 UTC +00:00
mailing_lists.cached_until # => Fri, 26 Aug 2016 18:35:48 UTC +00:00
mailing_lists.version # => 2

# TODO: finish this

```

#### Character mail messages headers

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

mail_messages = EveOnline::XML::CharacterMailMessages.new(key_id, v_code, character_id)

mail_messages.current_time # => Fri, 26 Aug 2016 12:49:38 UTC +00:00
mail_messages.cached_until # => Fri, 26 Aug 2016 13:03:38 UTC +00:00
mail_messages.version # => 2

# TODO: finish this

```

#### Character market orders

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
options = { character_id: 90729314 }

market_orders = EveOnline::XML::CharacterMarketOrders.new(key_id, v_code, options)

market_orders.current_time # => Fri, 26 Aug 2016 13:56:17 UTC +00:00
market_orders.cached_until # => Fri, 26 Aug 2016 14:53:17 UTC +00:00
market_orders.version # => 2

market_orders.orders.size # => 1

marker_order = market_orders.orders.first

marker_order.as_json # => {:order_id=>4053334100, :char_id=>1801683792, :station_id=>60005686, :vol_entered=>340000, :vol_remaining=>245705, :min_volume=>1, :order_state=>0, :type_id=>24488, :range=>32767, :account_key=>1000, :duration=>90, :escrow=>0.0, :price=>92.0, :bid=>false, :issued=>Thu, 01 Sep 2016 20:01:57 UTC +00:00}

marker_order.order_id # => 4053334100
marker_order.char_id # => 1801683792
marker_order.station_id # => 60005686
marker_order.vol_entered # => 340000
marker_order.vol_remaining # => 245705
marker_order.min_volume # => 1
marker_order.order_state # => 0
marker_order.type_id # => 24488
marker_order.range # => 32767
marker_order.account_key # => 1000
marker_order.duration # => 90
marker_order.escrow # => 0.0
marker_order.price # => 92.0
marker_order.bid # => false
marker_order.issued # => Thu, 01 Sep 2016 20:01:57 UTC +00:00
```

#### Character medals

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

character_medals = EveOnline::XML::CharacterMedals.new(key_id, v_code, character_id)

character_medals.current_time # => Fri, 01 Jul 2016 14:22:43 UTC +00:00
character_medals.cached_until # => Fri, 01 Jul 2016 20:13:49 UTC +00:00
character_medals.version # => 2

# TODO: finish this

```

#### Character notification headers

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

notifications = EveOnline::XML::CharacterNotifications.new(key_id, v_code, character_id)

notifications.current_time # => Fri, 26 Aug 2016 14:02:06 UTC +00:00
notifications.cached_until # => Fri, 26 Aug 2016 14:29:06 UTC +00:00
notifications.version # => 2

# TODO: finish this

```

#### Character notification texts

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314
ids = [123_456]

notification_texts = EveOnline::XML::CharacterNotificationTexts.new(key_id, v_code, character_id, ids)

notification_texts.current_time # => Sat, 27 Aug 2016 18:12:52 UTC +00:00
notification_texts.cached_until # => Tue, 25 Aug 2026 18:12:52 UTC +00:00
notification_texts.version # => 2

# TODO: finish this

```

#### Retrieve planetary colonies owned by character

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

planetary_colonies = EveOnline::XML::CharacterPlanetaryColonies.new(key_id, v_code, character_id)

planetary_colonies.current_time # => Sat, 27 Aug 2016 18:29:02 UTC +00:00
planetary_colonies.cached_until # => Sat, 27 Aug 2016 19:29:02 UTC +00:00
planetary_colonies.version # => 2

# TODO: finish this

```

#### Retrieve planetary links for colonies owned by character

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314
planet_id = 123_456

planetary_links = EveOnline::XML::CharacterPlanetaryLinks.new(key_id, v_code, character_id, planet_id)

planetary_links.current_time # => Sat, 27 Aug 2016 18:40:23 UTC +00:00
planetary_links.cached_until # => Sat, 27 Aug 2016 19:40:23 UTC +00:00
planetary_links.version # => 2

# TODO: finish this

```

#### Retrieve planetary pins for colonies owned by character

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314
planet_id = 123_456

planetary_pins = EveOnline::XML::CharacterPlanetaryPins.new(key_id, v_code, character_id, planet_id)

planetary_pins.current_time # => Sat, 27 Aug 2016 18:48:36 UTC +00:00
planetary_pins.cached_until # => Sat, 27 Aug 2016 19:48:36 UTC +00:00
planetary_pins.version # => 2

# TODO: finish this

```

#### Retrieve planetary routes for colonies owned by character

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314
planet_id = 123_456

planetary_routes = EveOnline::XML::CharacterPlanetaryRoutes.new(key_id, v_code, character_id, planet_id)

planetary_routes.current_time # => Sat, 27 Aug 2016 20:38:42 UTC +00:00
planetary_routes.cached_until # => Sat, 27 Aug 2016 21:38:42 UTC +00:00
planetary_routes.version # => 2

# TODO: finish this

```

#### Retrieve character research

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

research = EveOnline::XML::CharacterResearch.new(key_id, v_code, character_id)

research.current_time # => Sat, 27 Aug 2016 20:47:32 UTC +00:00
research.cached_until # => Sat, 27 Aug 2016 21:01:32 UTC +00:00
research.version # => 2

# TODO: finish this

```

#### Retrieve character skill queue

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

character_skill_queue = EveOnline::XML::CharacterSkillQueue.new(key_id, v_code, character_id)

character_skill_queue.current_time # => Sat, 27 Aug 2016 21:06:27 UTC +00:00
character_skill_queue.cached_until # => Sat, 27 Aug 2016 21:07:58 UTC +00:00
character_skill_queue.version # => 2

character_skill_queue.skills.size # => 11

skill_queue_entry = character_skill_queue.skills.first

skill_queue_entry.as_json
# => {:queue_position=>0, :type_id=>3420, :level=>5, :start_sp=>181020, :end_sp=>1024000, :start_time=>Mon, 15 Aug 2016 17:25:30 UTC +00:00, :end_time=>Wed, 31 Aug 2016 23:41:36 UTC +00:00}

skill_queue_entry.queue_position # => 0
skill_queue_entry.type_id # => 3420
skill_queue_entry.level # => 5
skill_queue_entry.start_sp # => 181020
skill_queue_entry.end_sp # => 1024000
skill_queue_entry.start_time # => Mon, 15 Aug 2016 17:25:30 UTC +00:00
skill_queue_entry.end_time # => Wed, 31 Aug 2016 23:41:36 UTC +00:00
```

#### Character skill in training

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

skill_in_training = EveOnline::XML::CharacterSkillInTraining.new(key_id, v_code, character_id)

skill_in_training.current_time # => Sun, 03 Jan 2016 16:09:15 UTC +00:00
skill_in_training.cached_until # => Sun, 03 Jan 2016 16:51:29 UTC +00:00
skill_in_training.version # => 2

skill_in_training.as_json
# => {:current_tq_time=>Sun, 03 Jan 2016 16:09:15 UTC +00:00, :training_end_time=>Wed, 13 Jan 2016 16:38:31 UTC +00:00, :training_start_time=>Wed, 23 Dec 2015 11:35:45 UTC +00:00, :training_type_id=>30651, :training_start_sp=>226275, :training_destination_sp=>1280000, :training_to_level=>5, :skill_in_training=>1}

skill_in_training.current_tq_time # => Sun, 03 Jan 2016 16:09:15 UTC +00:00
skill_in_training.training_end_time # => Wed, 13 Jan 2016 16:38:31 UTC +00:00
skill_in_training.training_start_time # => Wed, 23 Dec 2015 11:35:45 UTC +00:00
skill_in_training.training_type_id # => 30651
skill_in_training.training_start_sp # => 226275
skill_in_training.training_destination_sp # => 1280000
skill_in_training.training_to_level # => 5
skill_in_training.skill_in_training # => 1
```

#### Character standings

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

standings = EveOnline::XML::CharacterStandings.new(key_id, v_code, character_id)

standings.current_time # => Thu, 18 Aug 2016 14:50:50 UTC +00:00
standings.cached_until # => Thu, 18 Aug 2016 17:47:50 UTC +00:00
standings.version # => 2

standings.agents.size # => 15

agent = standings.agents.first # => #<EveOnline::Standing:0x007f90f33df4d8 @options={"@fromID"=>"3008771", "@fromName"=>"Nehrnah Gorouyar", "@standing"=>"0.12"}>

agent.as_json # => {:from_id=>3008771, :from_name=>"Nehrnah Gorouyar", :standing=>0.12}

agent.from_id # => 3008771
agent.from_name # => "Nehrnah Gorouyar"
agent.standing # => 0.12

standings.npc_corporations.size # => 6

npc_corporation = standings.npc_corporations.first # => #<EveOnline::Standing:0x007f90f33af9e0 @options={"@fromID"=>"1000035", "@fromName"=>"Caldari Navy", "@standing"=>"0.72"}>

npc_corporation.as_json # => {:from_id=>1000035, :from_name=>"Caldari Navy", :standing=>0.72}

npc_corporation.from_id # => 1000035
npc_corporation.from_name # => "Caldari Navy"
npc_corporation.standing # => 0.72

standings.factions.size # => 16

faction = standings.factions.first # => #<EveOnline::Standing:0x007f90f3395a90 @options={"@fromID"=>"500001", "@fromName"=>"Caldari State", "@standing"=>"0.33"}>

faction.as_json # => {:from_id=>500001, :from_name=>"Caldari State", :standing=>0.33}

faction.from_id # => 500001
faction.from_name # => "Caldari State"
faction.standing # => 0.33
```

#### Character upcoming calender events

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

upcoming_events = EveOnline::XML::CharacterUpcomingCalendarEvents.new(key_id, v_code, character_id)

upcoming_events.current_time # => Thu, 17 Dec 2015 20:43:46 UTC +00:00
upcoming_events.cached_until # => Thu, 17 Dec 2015 21:40:46 UTC +00:00
upcoming_events.version # => 2

upcoming_events.events.size # => 2

event = upcoming_events.events.first

event.as_json
# => {:event_id=>1234567, :owner_id=>98765432, :owner_name=>"MyCorp", :event_date=>Sat, 26 Dec 2015 19:47:29 UTC +00:00, :event_title=>"Control tower in 99-999", :duration=>60, :importance=>false, :response=>:undecided, :event_text=>"<b>Minmatar Control Tower</b> will run out of fuel and go offline...", :owner_type_id=>2}

event.event_id # => 1234567
event.owner_id # => 98765432
event.owner_name # => "MyCorp"
event.event_date # => Sat, 26 Dec 2015 19:47:29 UTC +00:00
event.event_title # => "Control tower in 99-999"
event.duration # => 60
event.importance # => false
event.response # => :undecided
event.event_text # => "<b>Minmatar Control Tower</b> will run out of fuel and go offline..."
event.owner_type_id # => 2
```

#### Retrieve character wallet journal

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

wallet_journal = EveOnline::XML::CharacterWalletJournal.new(key_id, v_code, character_id)

wallet_journal.current_time # => Sat, 27 Aug 2016 21:14:20 UTC +00:00
wallet_journal.cached_until # => Sat, 27 Aug 2016 21:41:20 UTC +00:00
wallet_journal.version # => 2

wallet_journal.wallet_journal_entries.size # => 3

wallet_journal_entry = wallet_journal.wallet_journal_entries.first

wallet_journal_entry.as_json # => {:date=>Thu, 01 Sep 2016 20:01:57 UTC +00:00, :ref_id=>6709813912, :ref_type_id=>15, :owner_name1=>"reygar burnt", :owner_id1=>1801683792, :owner_name2=>"Wiyrkomi Corporation", :owner_id2=>1000011, :arg_name1=>"EVE System", :arg_id1=>1, :amount=>-9250.00, :balance=>385574791.30, :reason=>"", :tax_receiver_id=>"", :tax_amount=>"", :owner1_type_id=>1380, :owner2_type_id=>2}

wallet_journal_entry.date # => Thu, 01 Sep 2016 20:01:57 UTC +00:00
wallet_journal_entry.ref_id # => 6709813912
wallet_journal_entry.ref_type_id # => 15
wallet_journal_entry.owner_name1 # => "reygar burnt"
wallet_journal_entry.owner_id1 # => 1801683792
wallet_journal_entry.owner_name2 # => "Wiyrkomi Corporation"
wallet_journal_entry.owner_id2 # => 1000011
wallet_journal_entry.arg_name1 # => "EVE System"
wallet_journal_entry.arg_id1 # => 1
wallet_journal_entry.amount # => -9250.00
wallet_journal_entry.balance # => 385574791.30
wallet_journal_entry.reason # => ""
wallet_journal_entry.tax_receiver_id # => ""
wallet_journal_entry.tax_amount # => ""
wallet_journal_entry.owner1_type_id # => 1380
wallet_journal_entry.owner2_type_id # => 2
```

#### Retrieve character wallet transactions

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

wallet_transactions = EveOnline::XML::CharacterWalletTransactions.new(key_id, v_code, character_id)

wallet_transactions.current_time # => Sat, 27 Aug 2016 21:23:53 UTC +00:00
wallet_transactions.cached_until # => Sat, 27 Aug 2016 21:50:53 UTC +00:00
wallet_transactions.version # => 2

# TODO: finish this

```

#### Corporation market orders

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
options = { character_id: 90729314 }

corporation_market_orders = EveOnline::XML::CorporationMarketOrders.new(key_id, v_code, options)

# TODO: finish this

```

Character Names to IDs:
```ruby
input = ['Johnn Dillinger'] # => ["Johnn Dillinger"]

characters_ids = EveOnline::Eve::CharacterID.new(input)

characters_ids.current_time # => Mon, 11 Apr 2016 18:51:01 UTC +00:00
characters_ids.cached_until # => Wed, 11 May 2016 18:51:01 UTC +00:00
characters_ids.version # => 2

characters_ids.response # => {"eveapi"=>{"currentTime"=>"2016-04-11 18:51:01", "result"=>{"rowset"=>{"row"=>{"@name"=>"Johnn Dillinger", "@characterID"=>"1337512245"}, "@name"=>"characters", "@key"=>"characterID", "@columns"=>"name,characterID"}}, "cachedUntil"=>"2016-05-11 18:51:01", "@version"=>"2"}}
```

#### Server status

```ruby
status = EveOnline::XML::ServerStatus.new

status.as_json
# => {:current_time=>Mon, 23 Nov 2015 18:18:29 UTC +00:00, :cached_until=>Mon, 23 Nov 2015 18:19:44 UTC +00:00, :server_open=>true, :online_players=>25611}

status.current_time # => Mon, 23 Nov 2015 18:18:29 UTC +00:00
status.cached_until # => Mon, 23 Nov 2015 18:19:44 UTC +00:00
status.server_open? # => true
status.online_players # => 25611
status.version # => 2
```

### ESI Examples

#### Alliance

##### List all alliances

##### Get alliance names

##### Get alliance information

##### List alliance's corporations

##### Get alliance icon

#### Assets

##### Get character assets

```ruby
options = { token: 'token123', character_id: 90729314 }

character_assets = EveOnline::ESI::CharacterAssets.new(options)

character_assets.assets.size # => 486

asset = character_assets.assets.first

asset.as_json # => {:type_id=>2629,
              #     :location_id=>60008674,
              #     :location_type=>"station",
              #     :item_id=>1006604012678,
              #     :location_flag=>"Hangar",
              #     :is_singleton=>false,
              #     :quantity=>16156}

asset.type_id # => 2629
asset.location_id # => 60008674
asset.location_type # => "station"
asset.item_id # => 1006604012678
asset.location_flag # => "Hangar"
asset.is_singleton # => false
asset.quantity # => 16156

# TODO: add pagination support
```

##### Get character asset locations

##### Get character asset names

##### Get corporation assets

#### Bookmarks

##### List bookmarks

##### List bookmark folders

#### Calendar

##### List calendar event summaries

##### Get an event

##### Respond to an event

##### Get attendees

#### Character

##### Character affiliation

##### Get character names

##### Get character's public information

```ruby
options = { character_id: 90729314 }

character = EveOnline::ESI::Character.new(options)

character.as_json
# => {:corporation_id=>1000168, :birthday=>Fri, 15 Jan 2010 15:26:00 UTC +00:00, :name=>"Green Black", :gender=>"male", :race_id=>2, :bloodline_id=>4, :description=>"", :alliance_id=>12345678, :ancestry_id=>24, :security_status=>1.8694881661345457}

character.scope # => nil

character.corporation_id # => 1000168
character.birthday # => Fri, 15 Jan 2010 15:26:00 UTC +00:00
character.name # => "Green Black"
character.gender # => "male"
character.race_id # => 2
character.bloodline_id # => 4
character.description  # => ""
character.alliance_id # => 12345678
character.ancestry_id # => 24
character.security_status # => 1.8694881661345457
```

##### Get agents research

##### Get blueprints

##### Get chat channels

##### Get corporation history

##### Calculate a CSPA charge cost

##### Get jump fatigue

##### Get medals

##### Get character notifications

##### Get new contact notifications

##### Get character portraits

```ruby
options = { character_id: 90729314 }

character_portrait = EveOnline::ESI::CharacterPortrait.new(options)

character_portrait.as_json
# => {:small=>"http://image.eveonline.com/Character/90729314_64.jpg", :medium=>"http://image.eveonline.com/Character/90729314_128.jpg", :large=>"http://image.eveonline.com/Character/90729314_256.jpg", :huge=>"http://image.eveonline.com/Character/90729314_512.jpg"}

character_portrait.scope # => nil

character_portrait.small # => "http://image.eveonline.com/Character/90729314_64.jpg"
character_portrait.medium # => "http://image.eveonline.com/Character/90729314_128.jpg"
character_portrait.large # => "http://image.eveonline.com/Character/90729314_256.jpg"
character_portrait.huge # => "http://image.eveonline.com/Character/90729314_512.jpg"
```

##### Get character corporation roles

##### Get standings

#### Clones

##### Get clones

##### Get active implants

#### Contacts

##### Delete contacts

##### Get contacts

##### Add contacts

##### Edit contacts

##### Get contact labels

##### Get corporation contacts

#### Contracts

##### Get contracts

##### Get contract bids

##### Get contract items

##### Get coporation contracts (typo in swagger)

##### Get corporation contract bids

##### Get corporation contract items

#### Corporation

##### Get corporation names

##### Get npc corporations

##### Get corporation information

##### Get alliance history

##### Get corporation blueprints

##### Get corporation divisions

##### Get corporation icon

##### Get corporation members

##### Get corporation member limit

##### Track corporation members

##### Get corporation member roles

##### Get corporation standings

##### Get corporation structures

##### Update structure vulnerability schedule

##### Get corporation titles

#### Dogma

##### Get attributes

##### Get attribute information

##### Get effects

##### Get effect information

#### Faction Warfare

##### List of the top factions in faction warfare

##### List of the top pilots in faction warfare

##### List of the top corporations in faction warfare

##### An overview of statistics about factions involved in faction warfare

##### Ownership of faction warfare systems

##### Data about which NPC factions are at war

#### Fittings

##### Get fitting

##### Create fitting

##### Delete fitting

#### Fleets

##### Get fleet information

##### Update fleet

##### Get fleet members

##### Create fleet invitation

##### Kick fleet member

##### Move fleet member

##### Delete fleet squad

##### Rename fleet squad

##### Get fleet wings

##### Create fleet wing

##### Delete fleet wing

##### Rename fleet wing

##### Create fleet squad

#### Incursions

##### List incursions

#### Industry

##### List character industry jobs
```ruby
options = { token: 'token123', character_id: 90729314 }

character_jobs = EveOnline::ESI::CharacterIndustryJob.new(options)

character_jobs.scope => # => "esi-industry.read_character_jobs.v1"

character_jobs.jobs 
# => [#<EveOnline::ESI::Models::IndustryJob:0x007fffd8d5cb38 @options={
		"job_id"=>334599182, 
		"installer_id"=>93174304, 
		"facility_id"=>1023579231924, 
		"station_id"=>1023579231924, 
		"activity_id"=>5, 
		"blueprint_id"=>1013170101631, 
		"blueprint_type_id"=>686, 
		"blueprint_location_id"=>1023579231924, 
		"output_location_id"=>1023579231924, 
		"runs"=>1, 
		"status"=>"active", 
		"duration"=>2580, 
		"start_date"=>"2017-07-18T18:41:22Z", 
		"end_date"=>"2017-07-19T20:58:03Z", 
		"cost"=>1673.0, 
		"licensed_runs"=>1, 
		"probability"=>1.0, 
		"product_type_id"=>686
		}>]

```


##### List corporation industry jobs
```ruby
options = { token: 'token123', corporation_id: 90729314 }

corporation_jobs = EveOnline::ESI::CorporationIndustryJob.new(options)

corporation_jobs.jobs 
# => [#<EveOnline::ESI::Models::IndustryJob:0x007fffda40e5c0 @options={
		"job_id"=>341634236, 
		"installer_id"=>93997721, 
		"facility_id"=>1022632720781, 
		"location_id"=>1022632720781, 
		"activity_id"=>3, 
		"blueprint_id"=>1024609618242, 
		"blueprint_type_id"=>990, 
		"blueprint_location_id"=>1024635511866, 
		"output_location_id"=>1024635511866, 
		"runs"=>9, 
		"status"=>"active", 
		"duration"=>2264366, 
		"start_date"=>"2017-10-14T12:10:39Z", 
		"end_date"=>"2017-11-09T17:10:05Z", 
		"cost"=>251788.0, 
		"licensed_runs"=>10, 
		"probability"=>1.0, 
		"product_type_id"=>990}>, 
	  #<EveOnline::ESI::Models::IndustryJob:0x007fffda40e598 @options={
		"job_id"=>341634210, 
		"installer_id"=>93997721, 
		"facility_id"=>1022632720781, 
		"location_id"=>1022632720781, "activity_id"=>3, 
		"blueprint_id"=>1024595195634, 
		"blueprint_type_id"=>940, 
		"blueprint_location_id"=>1024635511866, 
		"output_location_id"=>1024635511866, 
		"runs"=>9, 
		"status"=>"active", 
		"duration"=>1132183, 
		"start_date"=>"2017-10-14T12:10:22Z", 
		"end_date"=>"2017-10-27T14:40:05Z", 
		"cost"=>111720.0, 
		"licensed_runs"=>30, 
		"probability"=>1.0, 
		"product_type_id"=>940
		}>]

```

##### List industry facilities

##### List solar system cost indices

#### Insurance

##### List insurance levels

#### Killmails

##### Get character kills and losses

##### Get corporation kills and losses

##### Get a single killmail

#### Location

##### Get character location

##### Get character online

##### Get current ship

#### Loyalty

##### Get loyalty points

```ruby
options = { token: 'token123', character_id: 90729314 }

character_loyalty_points = EveOnline::ESI::CharacterLoyaltyPoints.new(options)

character_loyalty_points.loyalty_points.size # => 5

loyalty_point = character_loyalty_points.loyalty_points.first

loyalty_point.as_json # => {:corporation_id=>1000035, :loyalty_points=>14163}

character_loyalty_points.scope # => "esi-characters.read_loyalty.v1"

loyalty_point.corporation_id # => 1000035
loyalty_point.loyalty_points # => 14163
```

##### List loyalty store offers

#### Mail

##### Return mail headers

##### Send a new mail

##### Get mail labels and unread counts

##### Create a mail label

##### Delete a mail label

##### Return mailing list subscriptions

##### Delete a mail

##### Return a mail

##### Update metadata about a mail

#### Market

##### List orders from a character

##### List orders from a corporation

##### Get item groups

##### Get item group information

##### List market prices

##### List orders in a structure

##### List historical market statistics in a region

##### List orders in a region

##### List type IDs relevant to a market

#### Opportunities

##### Get a character's completed task

##### Get opportunities groups

##### Get opportunities group

##### Get opportunities tasks

##### Get opportunities task

#### Planetary Interaction

##### Get colonies

##### Get colony layout

##### Get schematic information

#### Routes

##### Get route

#### Search

##### Search on a string (search for something in character stuff)

##### Search on a string

#### Skills

##### Get character attributes

```ruby
options = { token: 'token123', character_id: 90729314 }

character_attributes = EveOnline::ESI::CharacterAttributes.new(options)

character_attributes.as_json # => {:charisma=>20,
                             #     :intelligence=>24,
                             #     :memory=>24,
                             #     :perception=>23,
                             #     :willpower=>23,
                             #     :bonus_remaps=>2,
                             #     :last_remap_date=>Sat, 07 May 2011 12:58:06 UTC +00:00,
                             #     :accrued_remap_cooldown_date=>Sun, 06 May 2012 12:58:06 UTC +00:00}

character_attributes.charisma # => 20
character_attributes.intelligence # => 24
character_attributes.memory # => 24
character_attributes.perception # => 23
character_attributes.willpower # => 23
character_attributes.bonus_remaps # => 2
character_attributes.last_remap_date # => Sat, 07 May 2011 12:58:06 UTC +00:00
character_attributes.accrued_remap_cooldown_date # => Sun, 06 May 2012 12:58:06 UTC +00:00
```

##### Get character's skill queue

```ruby
options = { token: 'token123', character_id: 90729314 }

character_skill_queue = EveOnline::ESI::CharacterSkillQueue.new(options)

character_skill_queue.skills.size # => 50

character_skill_queue.scope # => "esi-skills.read_skillqueue.v1"

skill_queue_entry = character_skill_queue.skills.first

skill_queue_entry.as_json
# => {:skill_id=>12487, :finished_level=>3, :queue_position=>0, :finish_date=>Mon, 16 Jan 2017 03:00:35 UTC +00:00, :start_date=>Sun, 15 Jan 2017 11:38:25 UTC +00:00, :training_start_sp=>7263, :level_end_sp=>40000, :level_start_sp=>7072}

skill_queue_entry.skill_id # => 12487
skill_queue_entry.finished_level # => 3
skill_queue_entry.queue_position # => 0
skill_queue_entry.finish_date # => Mon, 16 Jan 2017 03:00:35 UTC +00:00
skill_queue_entry.start_date # => Sun, 15 Jan 2017 11:38:25 UTC +00:00
skill_queue_entry.training_start_sp # => 7263
skill_queue_entry.level_end_sp # => 40000
skill_queue_entry.level_start_sp # => 7072
```

##### Get character skills

```ruby
options = { token: 'token123', character_id: 90729314 }

character_skills = EveOnline::ESI::CharacterSkills.new(options)

character_skills.total_sp # => 43232144

character_skills.as_json # => {:total_sp=>43232144}

character_skills.scope # => "esi-skills.read_skills.v1"

character_skills.skills.size # => 180

skill = character_skills.skills.first

skill.as_json # => {:skill_id=>22536, :skillpoints_in_skill=>500, :current_skill_level=>1}

skill.skill_id # => 22536
skill.skillpoints_in_skill # => 500
skill.current_skill_level # => 1
```

#### Sovereignty

##### List sovereignty campaigns

##### List sovereignty of systems

##### List sovereignty structures

#### Status

##### Retrieve the uptime and player counts

```ruby
server_status = EveOnline::ESI::ServerStatus.new

server_status.as_json # => {:start_time=>Tue, 11 Apr 2017 11:05:35 UTC +00:00, :players=>34545, :server_version=>"1135520", :vip=>nil}

server_status.scope # => nil

server_status.start_time # => Tue, 11 Apr 2017 11:05:35 UTC +00:00
server_status.players # => 34545
server_status.server_version # => "1135520"
server_status.vip # => nil
```

#### Universe

##### Get bloodlines

##### Get item categories

##### Get item category information

##### Get constellations

##### Get constellation information

##### Get factions

##### Get graphics

##### Get graphic information

##### Get item groups

##### Get item group information

##### Get moon information

##### Get names and categories for a set of ID's

##### Get planet information

##### Get character races

##### Get regions

##### Get region information

##### Get stargate information

##### Get star information

##### Get station information

##### List all public structures

##### Get structure information

##### Get system jumps

##### Get system kills

##### Get solar systems

##### Get solar system information

##### Get types

##### Get type information

#### User Interface

##### Set Autopilot Waypoint

##### Open Contract Window

##### Open Information Window

##### Open Market Details

##### Open New Mail Window

#### Wallet

##### Get a character's wallet balance

##### Get character wallet journal

```
options = { token: 'token123', character_id: 90729314 }

character_wallet = EveOnline::ESI::CharacterWallet.new(options)

character_wallet.as_json # => {:wallet=>409488252.49}

character_wallet.scope # => "esi-wallet.read_character_wallet.v1"
```

##### Get wallet transactions

##### Returns a corporation's wallet balance

##### Get corporation wallet journal

##### Get corporation wallet transactions

#### Wars

##### List wars

##### Get war information

##### List kills for a war


### SDE Examples

Agent Types:
```ruby
file = 'agtAgentTypes.yaml'

agt_agent_types = EveOnline::SDE::AgtAgentTypes.new(file)

agt_agent_types.agt_agent_types.size # => 12

agent_type = agt_agent_types.agt_agent_types.first

agent_type.as_json # => {:agent_type=>"NonAgent", :agent_type_id=>1}

agent_type.agent_type # => "NonAgent"
agent_type.agent_type_id # => 1
```

Agents:
```ruby
file = 'agtAgents.yaml'

agt_agents = EveOnline::SDE::AgtAgents.new(file)

agt_agents.agt_agents.size # => 10975

agt_agent = agt_agents.agt_agents.first

agt_agent.as_json # => {:agent_id=>3008416, :agent_type_id=>2, :corporation_id=>1000002, :division_id=>22, :is_locator=>false, :level=>1, :location_id=>60000004, :quality=>20}

agt_agent.agent_id # => 3008416
agt_agent.agent_type_id # => 2
agt_agent.corporation_id # => 1000002
agt_agent.division_id # => 22
agt_agent.is_locator # => false
agt_agent.level # => 1
agt_agent.location_id # => 60000004
agt_agent.quality # => 20
```

Inventory Flags:
```ruby
file = 'invFlags.yaml'

inv_flags = EveOnline::SDE::InvFlags.new(file)

inv_flags.inv_flags.size # => 152

inv_flag = inv_flags.inv_flags.first

inv_flag.as_json # => {:flag_id=>0, :flag_name=>"None", :flag_text=>"None", :order_id=>0}

inv_flag.flag_id # => 0
inv_flag.flag_name # => "None"
inv_flag.flag_text # => "None"
inv_flag.order_id  # => 0
```

Inventory Items:
```ruby
file = 'invItems.yaml'

inv_items = EveOnline::SDE::InvItems.new(file)

inv_items.inv_items.size # => 531470

inv_item = inv_items.inv_items.first

inv_item.as_json # => {:flag_id=>0, :item_id=>40021067, :location_id=>30000334, :owner_id=>1, :quantity=>34, :type_id=>14}

inv_item.flag_id # => 0
inv_item.item_id # => 40021067
inv_item.location_id # => 30000334
inv_item.owner_id # => 1
inv_item.quantity # => 34
inv_item.type_id # => 14
```

Inventory Names:
```ruby
file = 'invNames.yaml'

inv_names = EveOnline::SDE::InvNames.new(file)

inv_names.inv_names.size # => 519921

inv_name = inv_names.inv_names.first

inv_name.as_json # => {:item_id=>0, :item_name=>"(none)"}

inv_name.item_id # => 0
inv_name.item_name # => "(none)"
```

Inventory Positions:
```ruby
file = 'invPositions.yaml'

inv_positions = EveOnline::SDE::InvPositions.new(file)

inv_positions.inv_positions.size # => 508383

inv_position = inv_positions.inv_positions.first

inv_position.as_json # => {:item_id=>0, :pitch=>0.0, :roll=>0.0, :x=>0.0, :y=>0.0, :yaw=>0.0, :z=>0.0}

inv_position.item_id # => 0
inv_position.pitch # => 0.0
inv_position.roll # => 0.0
inv_position.x # => 0.0
inv_position.y # => 0.0
inv_position.yaw # => 0.0
inv_position.z # => 0.0
```

Character Races:
```ruby
file = 'chrRaces.yaml'

chr_races = EveOnline::SDE::ChrRaces.new(file)

chr_races.chr_races.size # => 8

chr_race = chr_races.chr_races[3]

chr_race.as_json # => {:race_id=>2,
                 #     :race_name=>"Minmatar",
                 #     :short_description=>"Breaking free of Amarrian subjugation, ...",
                 #     :description=>"Once a thriving tribal civilization, the Minmatar...",
                 #     :icon_id=>1440}


chr_race.race_id # => 2
chr_race.race_name # => "Minmatar"
chr_race.short_description # => "Breaking free of Amarrian subjugation, ..."
chr_race.description # => "Once a thriving tribal civilization, the Minmatar..."
chr_race.icon_id # => 1440
```

## Exceptions

If you want to catch all exceptions `rescue` `EveOnline::Exceptions::Base`. E.g.:

```ruby
begin
  key_id = 1234567
  v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
  options = { character_id: 90729314 }

  account_balance = EveOnline::XML::CharacterAccountBalance.new(key_id, v_code, options)

  account_balance.as_json
rescue EveOnline::Exceptions::Base
  # some logic for handle exception
end
```

If api key (XML) have many characters and you miss `character_id` you will get `EveOnline::Exceptions::InvalidCharacterIDException`.

If api key (XML) invalid (wrong key_id/v_code or key is expired) you will get `EveOnline::Exceptions::UnauthorizedException`. E.g.:

```ruby
begin
  key_id = 1234567
  v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
  options = { character_id: 90729314 }

  account_balance = EveOnline::XML::CharacterAccountBalance.new(key_id, v_code, options)

  account_balance.as_json
rescue EveOnline::Exceptions::UnauthorizedException
  # some logic for handle exception. e.g. mark api keys as invalid
end
```

Timeout. `EveOnline::Exceptions::TimeoutException`.

## Timeouts

`eve_online` gem uses `faraday` for network request. `faraday` configured with:
```ruby
faraday = Faraday.new

faraday.options.timeout = 60
faraday.options.open_timeout = 60
```

## Useful links

* [BREAKING CHANGES AND YOU - HOW TO USE ALT-ROUTES TO ENHANCE YOUR SANITY](https://developers.eveonline.com/blog/article/breaking-changes-and-you)
* [TECHNICAL NOTE: INTEGER SIZES AND THE XML API](https://developers.eveonline.com/blog/article/technical-note-integer-sizes-and-the-xml-api)
* [THE END OF PUBLIC CREST AS WE KNOW IT](https://developers.eveonline.com/blog/article/the-end-of-public-crest-as-we-know-it)
* [CCP, zKillboard (Eve-Kill), and your API](https://docs.google.com/document/d/16YfJwjhuH5A3cS4NTMDFDkprnOVKsvgtuRIKk8xjTM8/edit)
* [JUMP CLONES, IMPLANTS, SKILLS, AND MORE](https://developers.eveonline.com/blog/article/jump-clones-implants-skills-and-more)
* [ESI Swagger](https://esi.tech.ccp.is/latest/)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Issue reports and pull requests are welcome on GitHub at https://github.com/biow0lf/eve_online.

## Implementation check list

### Account

- [x] [Account Status](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/account/account_accountstatus.html)
- [x] [API Key Info](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/account/account_apikeyinfo.html)
- [x] [Characters](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/account/account_characters.html)

----

### Api

- [ ] [Call List (Access Mask reference)](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/api/api_calllist.html)

----

### Character

- [x] [Account Balance](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_accountbalance.html)
- [x] [Asset List](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_assetlist.html)
- [x] [Blueprints](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_blueprints.html)
- [x] [Bookmarks](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_bookmarks.html)
- [ ] [Calendar Event Attendees](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_calendareventattendees.html)
- [ ] [Character Sheet](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_charactersheet.html)
- [ ] [Chat Channels](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_chatchannels.html)
- [ ] [Contact List](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_contactlist.html)
- [x] [Contact Notifications](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_contactnotifications.html)
- [ ] [Contract Bids](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_contractbids.html)
- [ ] [Contract Items](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_contractitems.html)
- [ ] [Contracts](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_contracts.html)
- [ ] [Factional Warfare Stats](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_facwarstats.html)
- [ ] [Industry Jobs](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_industryjobs.html)
- [ ] [Industry Jobs History](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_industryjobshistory.html)
- [ ] [~~Kill Log~~](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_killlog.html) (deprecated)
- [ ] [Kill Mails](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_killmails.html)
- [ ] [Locations](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_locations.html)
- [ ] [Mail Bodies](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_mailbodies.html)
- [ ] [Mailing Lists](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_mailinglists.html)
- [ ] [Mail Messages](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_mailmessages.html)
- [x] [Market Orders](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_marketorders.html)
- [ ] [Medals](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_medals.html)
- [ ] [Notifications](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_notifications.html)
- [ ] [Notification Texts](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_notificationtexts.html)
- [ ] [Planetary Colonies](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_planetarycolonies.html)
- [ ] [Planetary Links](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_planetarylinks.html)
- [ ] [Planetary Pins](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_planetarypins.html)
- [ ] [Planetary Routes](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_planetaryroutes.html)
- [ ] [Research](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_research.html)
- [x] [Skill in Training](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_skillintraining.html)
- [x] [Skill Queue](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_skillqueue.html)
- [x] [Standings](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_standings.html)
- [x] [Upcoming Calendar Events](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_upcomingcalendarevents.html)
- [x] [Wallet Journal](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_walletjournal.html)
- [ ] [Wallet Transactions](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_wallettransactions.html)

----

### Corporation

- [ ] [Account Balance](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_accountbalance.html)
- [ ] [Asset List](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_assetlist.html)
- [ ] [Blueprints](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_blueprints.html)
- [ ] [Bookmarks](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_bookmarks.html)
- [ ] [Contact List](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_contactlist.html)
- [ ] [Container Log](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_containerlog.html)
- [ ] [Contract Bids](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_contractbids.html)
- [ ] [Contract Items](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_contractitems.html)
- [ ] [Contracts](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_contracts.html)
- [ ] [Corporation Sheet](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_corporationsheet.html)
- [ ] [Customs Offices](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_customsoffices.html)
- [ ] [Facilities](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_facilities.html)
- [ ] [Factional Warfare Stats](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_facwarstats.html)
- [ ] [Industry Jobs](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_industryjobs.html)
- [ ] [Industry Jobs History](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_industryjobshistory.html)
- [ ] [Kill Mails](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_killmails.html)
- [ ] [Locations](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_locations.html)
- [x] [Market Orders](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_marketorders.html)
- [ ] [Medals](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_medals.html)
- [ ] [Member Medals](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_membermedals.html)
- [ ] [Member Security](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_membersecurity.html)
- [ ] [Member Security Log](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_membersecuritylog.html)
- [ ] [Member Tracking](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_membertracking.html)
- [ ] [Outpost List](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_outpostlist.html)
- [ ] [Outpost Service Detail](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_outpostservicedetail.html)
- [ ] [Shareholders](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_shareholders.html)
- [ ] [Standings](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_standings.html)
- [ ] [Starbase Detail](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_starbasedetail.html)
- [ ] [Starbase List](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_starbaselist.html)
- [ ] [Titles](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_titles.html)
- [ ] [Wallet Journal](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_walletjournal.html)
- [ ] [Wallet Transactions](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_wallettransactions.html)

----

### Eve

- [ ] [Alliance List](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/eve/eve_alliancelist.html)
- [ ] [Character Affiliation](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/eve/eve_characteraffiliation.html)
- [ ] [Character ID](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/eve/eve_characterid.html)
- [ ] [Character Info](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/eve/eve_characterinfo.html)
- [ ] [Character Name](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/eve/eve_charactername.html)
- [ ] [Conquerable Station List](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/eve/eve_conquerablestationlist.html)
- [ ] [Error List](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/eve/eve_errorlist.html)
- [ ] [Ref Types](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/eve/eve_reftypes.html)
- [ ] [Type Name](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/eve/eve_typename.html)

----

### Map

- [ ] [Factional Warfare Systems](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/map/map_facwarsystems.html)
- [ ] [Jumps](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/map/map_jumps.html)
- [ ] [Kills](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/map/map_kills.html)
- [ ] [Sovereignty](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/map/map_sovereignty.html)

----

### Server

- [x] [Server Status](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/server/serv_serverstatus.html)

----

## TODO

- [ ] Account Status: Support multiCharacterTraining
- [ ] Access Mask
- [ ] Caching
- [ ] Test EVE server

## Author

* Igor Zubkov (@biow0lf)

## Contributors. Thank you everyone!

* Ian Flynn (@monban)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
