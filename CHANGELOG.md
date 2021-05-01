# Changelog

## v0.41.0

* Add `EveOnline::ESI::Search`

## v0.40.0

* Add `EveOnline::Formulas::TrainingRate`

## v0.39.0

* Sync with new ESI
* Add "Accept" header back

## 0.38.0

* Replace `net/http` with `faraday`
* Drop Ruby 2.5 support

## v0.37.0

* Use autoload for class loading
* Rails 6.1
* Ruby 3.0
* Remove `mutant` stuff

## v0.36.0

* Drop JRuby support
* Add `EveOnline::ESI::CorporationMembers`

## v0.35.1

* Rename `EveOnline::ESI::Models::PublicContract#type` to `#kind`. Fix Rails STI.

## v0.35.0

* Add `EveOnline::ESI::PublicContracts`
* Add `EveOnline::ESI::Models::PublicContract`
* Add `EveOnline::ESI::Models::PublicContractItem`
* Add `EveOnline::ESI::PublicContract`

## v0.34.0

* Rename `EveOnline::ESI::Models::Race#alliance_id` to `#faction_id`. [Fix esi issue 812](https://github.com/esi/esi-issues/issues/812).

## v0.33.0

* Sync with new ESI API
* Add `EveOnline::Exceptions::ErrorLimited`

## v0.32.0

* Sync with new ESI API
* Add `EveOnline::ESI::CharacterContracts`
* Add `EveOnline::ESI::Models::Contract`
* Add support `X-ESI-Error-Limit-Remain` header
* Add support `X-ESI-Error-Limit-Reset` header
* Add `EveOnline::ESI::Killmail`
* Add `EveOnline::ESI::MarketPrices`
* Add `EveOnline::ESI::Models::MarketPrice`
* Add `EveOnline::ESI::Models::WalletTransaction`
* Add `EveOnline::ESI::CharacterWalletTransactions`
* Rename `EveOnline::ESI::Models::WalletJournalEntry` to `EveOnline::ESI::Models::WalletJournal`
* Add `EveOnline::ESI::Models::Killmail`
* Rename `EveOnline::ESI::Models::WalletJournal#id` to `#wallet_journal_id` and update `#as_json`
* Add `EveOnline::Formulas::BlueprintCopyTime`
* Drop `EveOnline::ESI::CharacterBookmarkFolders`
* Drop `EveOnline::ESI::CharacterBookmarks`
* Drop `EveOnline::ESI::Models::Bookmark`
* Drop `EveOnline::ESI::Models::BookmarkFolder`
* Add `EveOnline::ESI::CorporationNPC`

## v0.31.0

* Add `EveOnline::ESI::Models::MailRecipient`
* Add `EveOnline::ESI::Models::MailRecipients`
* Add `EveOnline::ESI::Models::Mail`
* Add `EveOnline::ESI::CharacterGetMail`
* Add `EveOnline::ESI::Models::MailLabel`
* Add `EveOnline::ESI::CharacterMailLabels`
* Ruby 2.7.0
* Rename `EveOnline::ESI::UniverseRegion#constellations` to `#constellation_ids`
* Remove `constellations` from `EveOnline::ESI::UniverseRegion#as_json`
* Add `EveOnline::ESI::Models::Stargate#destination_stargate_id`
* Add `EveOnline::ESI::Models::Stargate#destination_system_id`
* Add `destination_stargate_id` and `destination_system_id` to `EveOnline::ESI::Models::Stargate#as_json`
* Remove `EveOnline::ESI::Models::StargateDestination`
* Remove `EveOnline::ESI::UniverseStargate#destination`
* Add `EveOnline::ESI::UniverseStargate#destination_stargate_id`
* Add `EveOnline::ESI::UniverseStargate#destination_system_id`
* Drop datasource support

## v0.30.0

* Add `EveOnline::ESI::Models::OfferRequiredItem`
* Add `EveOnline::ESI::Models::OfferRequiredItems`
* Implement `EveOnline::ESI::Models::LoyaltyStoreOffer#offer_required_items`
* Fix typo `#additation_query_params` -> `#additional_query_params`
* Add `EveOnline::ESI::Models::War`
* Add `EveOnline::ESI::War`
* Add `EveOnline::ESI::Models::Aggressor`
* Add `EveOnline::ESI::Models::Defender`
* Add `EveOnline::ESI::Models::Allies`
* Add `EveOnline::ESI::Models::Ally`
* Add `EveOnline::ESI::MarketGroups`
* Add `EveOnline::ESI::MarketGroup`
* Add `EveOnline::ESI::Models::MarketGroup`

## v0.29.0

* Rails 6.0.0

## v0.28.0

* Refactor url generator
* Move language from header to query params. So, you can cache requests by url.
* Remove `page` from `EveOnline::ESI::UniverseStructures`
* Add support `filter` in `EveOnline::ESI::UniverseStructures`
* Add support `max_war_id` in `EveOnline::ESI::Wars`
* Add support `from_event` in `EveOnline::ESI::CharacterCalendar`
* Add `EveOnline::ESI::CorporationAllianceHistory`
* Add `EveOnline::ESI::Models::CorporationAllianceHistory`

## v0.27.0

* Rails 6.0.0.rc1
* Add `EveOnline::ESI::CharacterCalendarEvent`
* Add `EveOnline::ESI::Models::EventDetails`
* Add `EveOnline::ESI::Models::LoyaltyStoreOffer`
* Add `EveOnline::ESI::CorporationLoyaltyStoreOffers`
* Rename `EveOnline::ESI::Models::EventDetails#response` to `#event_response`
* Add `EveOnine::ESI::CharacterCorporationHistory`
* Add `EveOnline::ESI::Models::CharacterCorporationHistory`

## v0.26.0

* Sync with new ESI API

## v0.25.0

* `EveOnline::ESI::CharacterAssetsLocations#etag` raise `NotImplementedError` from now
* `EveOnline::ESI::CharacterAssetsNames#etag` raise `NotImplementedError` from now
* Add corporation roles support
* Add `EveOnline::ESI::CorporationAssets`
* Add `EveOnline::ESI::CorporationAssetsLocations`
* Add `EveOnline::ESI::CorporationAssetsNames`
* Drop ruby 2.3 support
* `EveOnline::ESI::Base#not_modified?` handle timeout exceptions
* Rescue `Net::WriteTimeout` too

## v0.24.0

* Remove `implants` from `EveOnline::ESI::Models::JumpClone#as_json`
* Rename `EveOnline::ESI::Models::JumpClone#implants` to `#implant_ids`
* Add `EveOnline::ESI::Models::Coordinates`
* Remove `coordinate_x` from `EveOnline::ESI::Models::Bookmark#as_json`
* Remove `coordinate_y` from `EveOnline::ESI::Models::Bookmark#as_json`
* Remove `coordinate_z` from `EveOnline::ESI::Models::Bookmark#as_json`
* Remove `EveOnline::ESI::Models::Bookmark#coordinate_x`
* Remove `EveOnline::ESI::Models::Bookmark#coordinate_y`
* Remove `EveOnline::ESI::Models::Bookmark#coordinate_z`
* Add `EveOnline::ESI::Models::Bookmark#coordinates`
* Drop Rubinius support
* Add ruby 2.6.0 write_timeout and write_timeout= support (#201)

## v0.23.0

* Sync with new ESI API
* Remove `systems` from `EveOnline::ESI::Models::Constellation#as_json`
* Rename `EveOnline::ESI::Models::Constellation#systems` to `#system_ids`

## v0.22.0

* Add `EveOnline::ESI::AllianceCorporations#etag`
* Remove `EveOnline::ESI::Models::ModelWithEtag`
* Remove `EveOnline::ESI::ResponseWithEtag`
* Remove `EveOnline::ESI::Models::Alliance#etag`
* Remove `EveOnline::ESI::Models::Corporation#etag`
* Add exception `EveOnline::Exceptions::NotModified` for case when body not present for 304 request
* Remove `EveOnline::ESI::Models::Star#etag`
* Remove `EveOnline::ESI::Models::Stargate#etag`
* Add `EveOnline::ESI::Base#etag`
* `EveOnline::ESI::Base#content` raise `EveOnline::Exceptions::NotModified` when body not present for 304 requests
* Add setter `EveOnline::ESI::Base.etag=`

## v0.21.0

* Remove `memoist` gem
* Fix etag support
* Rename `EveOnline::ESI::Base#no_content?` to `#not_modified?`
* Add `EveOnline::ESI::Models::ModelWithEtag`
* Add `EveOnline::ESI::ResponseWithEtag`
* Add `EveOnline::ESI::Models::Stargate#etag`
* Add `etag` to `EveOnline::ESI::Models::Stargate#as_json`
* Add `EveOnline::ESI::UniverseStar#etag`
* Add `etag` to `EveOnline::ESI::Models::Star#as_json`
* Add `EveOnline::ESI::Alliances#etag`
* Add `etag` to `EveOnline::ESI::Models::Alliance#as_json`
* Add `EveOnline::ESI::Alliance#etag`
* Rename `EveOnline::ESI::Races` to `EveOnline::ESI::UniverseRaces`
* Add `EveOnline::ESI::UniverseRaces#etag`
* Rename `EveOnline::ESI::Factions` to `EveOnline::ESI::UniverseFactions`
* Add `EveOnline::ESI::UniverseFactions#etag`
* Rename `EveOnline::ESI::Bloodlines` to `EveOnline::ESI::UniverseBloodlines`
* Add `EveOnline::ESI::UniverseBloodlines#etag`
* Rename `EveOnline::ESI::Ancestries` to `EveOnline::ESI::UniverseAncestries`
* Add `EveOnline::ESI::UniverseAncestries#etag`
* Add `EveOnline::ESI::Models::Corporation#etag`
* Add `etag` to `EveOnline::ESI::Models::Corporation#as_json`
* Add `EveOnline::ESI::Corporation#etag`

## v0.20.0

* Add `EveOnline::ESI::UniverseCategories`
* Add `EveOnline::ESI::UniverseCategory`
* Add `EveOnline::ESI::Models::Category`
* Add `EveOnline::ESI::UniverseGraphics`
* Add `EveOnline::ESI::UniverseGroups`
* Add `EveOnline::ESI::Models::Group`
* Add `EveOnline::ESI::UniverseGroup`
* Add `EveOnline::ESI::Models::Graphic`
* Add `EveOnline::ESI::UniverseGraphic`
* Add `EveOnline::ESI::UniverseSystem`
* Add `EveOnline::ESI::Models::System`
* Add `EveOnline::ESI::Models::PlanetShort`
* Add `EveOnline::ESI::Models::Planets`
* Add `EveOnline::ESI::Models::Planet`
* Add `EveOnline::ESI::UniversePlanet`
* Add `EveOnline::ESI::Models::AsteroidBelt`
* Add `EveOnline::ESI::UniverseAsteroidBelt`
* Add `EveOnline::ESI::UniverseMoon`
* Add `EveOnline::ESI::Models::Moon`
* Add `EveOnline::ESI::Models::SystemJump`
* Add `EveOnline::ESI::UniverseSystemJumps`
* Add `EveOnline::ESI::Models::SystemKill`
* Add `EveOnline::ESI::UniverseSystemKills`
* Add `EveOnline::ESI::UniverseStructures`
* Add `EveOnline::ESI::Models::StargateDestination`
* Add `EveOnline::ESI::Models::Stargate`
* Add `EveOnline::ESI::UniverseStargate`
* Add `EveOnline::ESI::Models::Star`
* Add `EveOnline::ESI::UniverseStar`
* Add `EveOnline::ESI::Models::Station`
* Add `EveOnline::ESI::UniverseStation`

## v0.19.0

* Replace `faraday` gem with ruby `net/http`
* Add `Etag` / `If-None-Match` support for caching
* Add `Accept-Language` header support
* Add `EveOnline::ESI::CharacterAssetsLocations`
* Add `EveOnline::ESI::Models::Position`
* Add `EveOnline::ESI::Models::AssetLocation`
* Add `EveOnline::ESI::Models::AssetName`
* Add `EveOnline::ESI::CharacterAssetsNames`
* Remove `EveOnline::ESI::UniverseConstellation#position_x, #position_y, #position_z`. Use new `#position` instead.
* Add `EveOnline::ESI::UniverseType#dogma_attributes`
* Add `EveOnline::ESI::UniverseType#dogma_effects`
* Add `EveOnline::ESI::Models::DogmaAttributeShort`
* Add `EveOnline::ESI::Models::DogmaEffectShort`
* Add `EveOnline::ESI::Models::Type#dogma_attributes`
* Add `EveOnline::ESI::Models::Type#dogma_effects`
* Add `EveOnline::ESI::Models::DogmaAttributes`
* Add `EveOnline::ESI::Models::DogmaEffects`
* Add `EveOnline::ESI::Models::DogmaEffect`
* Add `EveOnline::ESI::DogmaEffects`
* Add `EveOnline::ESI::DogmaEffect`
* Rename `EveOnline::ESI::AllianceCorporations#corporations` to `#corporation_ids`
* Rename `EveOnline::ESI::Alliances#alliances` to `#alliance_ids`
* Rename `EveOnline::ESI::Wars#wars_ids` to `#war_ids`
* Rename `EveOnline::ESI::UniverseTypes#universe_types_ids` to `#universe_type_ids`
* Rename `EveOnline::ESI::DogmaEffects#effects_ids` to `#effect_ids`
* Rename `EveOnline::ESI::UniverseSystems#universe_systems_ids` to `#universe_system_ids`
* Rename `EveOnline::ESI::UniverseRegions#universe_regions_ids` to `#universe_region_ids`
* Rename `EveOnline::ESI::UniverseConstellations#constellations_ids` to `#constellation_ids`
* Rename `EveOnline::ESI::DogmaAttributes#attributes` to `#attribute_ids`
* Rename `EveOnline::ESI::CharacterImplants#implants` to `#implant_ids`
* Add `EveOnline::ESI::DogmaEffect`
* Add `EveOnline::ESI::Models::DogmaEffectModifier`
* Add `EveOnline::ESI::Models::DogmaEffectModifiers`

## v0.18.0

* Add `EveOnline::ESI::Models::CharacterShip`
* Add `EveOnline::ESI::Models::CharacterLocation`
* Add `EveOnline::ESI::CharacterShip`
* Add `EveOnline::ESI::CharacterLocation`
* Update urls from `https://esi.tech.ccp.is/` to `https://esi.evetech.net/`
* Add pagination support
* Add `EveOnline::ESI::UniverseRegions`
* Add `EveOnline::ESI::UniverseRegion`
* Add `EveOnline::ESI::UniverseConstellations`
* Add `EveOnline::ESI::UniverseConstellation`
* Add `EveOnline::ESI::Models::Constellation`
* Add `EveOnline::ESI::UniverseSystems`
* Add `EveOnline::ESI::Wars`
* Add `EveOnline::ESI::Models::KillmailShort`
* Add `EveOnline::ESI::WarKillmails`
* Add `EveOnline::ESI::CharacterKillmailsRecent`
* Add `EveOnline::ESI::CorporationKillmailsRecent`

## v0.17.0

* Sync with new ESI API
* Remove `EveOnline::ESI::AlliancesNames`
* Lint `README.md`, `CHANGELOG.md` and `TODO.md` with `mdl` gem
* Add datasource support. Just add `datasource: tranquility` or `datasource: singularity` to options. Default is `tranquility`.
* Rename `EveOnline::ESI::Models::DogmaAttribute#id` to `#attribute_id`
* Rename input `attribute_id:` to `id:` in `EveOnline::ESI::DogmaAttribute`
* Rename `EveOnline::ESI::Models::IndustryJob` to `EveOnline::ESI::Models::CharacterIndustryJob`
* Add `EveOnline::ESI::Models::CorporationIndustryJob`
* Rename `EveOnline::ESI::Models::CharacterOrder#is_corp` to `#is_corporation`
* Remove `EveOnline::ESI::Models::CharacterOrder#state`
* Remove `EveOnline::ESI::Models::CharacterOrder#account_id`
* Remove `EveOnline::ESI::Models::WalletJournalEntry#ref_id`
* Remove `EveOnline::ESI::Models::WalletJournalEntry#first_party_type`
* Remove `EveOnline::ESI::Models::WalletJournalEntry#second_party_type`
* Add `EveOnline::ESI::Models::WalletJournalEntry#context_id`
* Add `EveOnline::ESI::Models::WalletJournalEntry#context_id_type`
* Add `EveOnline::ESI::Models::WalletJournalEntry#description`
* Add `EveOnline::ESI::Models::WalletJournalEntry#id`
* Rename input `type_id:` to `id:` in `EveOnline::ESI::UniverseType`
* Add `EveOnline::ESI::UniverseType#type_id`
* Add `EveOnline::ESI::Models::CorporationOrder#issued_by`
* Remove `EveOnline::ESI::Models::CorporationOrder#state`

## v0.16.0

* Add `EveOnline::ESI::UniverseTypes`
* Add `EveOnline::ESI::UniverseType`
* Add `EveOnline::ESI::Models::Type`
* Rails 5.2.0
* Sync with new ESI API
* JRuby 9.1.17.0
* Add exception for 204 status `EveOnline::Exceptions::NoContent`
* Add exception for 400 status `EveOnline::Exceptions::BadRequest`
* Add exception for 401 status `EveOnline::Exceptions::Unauthorized`
* Add exception for 403 status `EveOnline::Exceptions::Forbidden`
* Add exception for 404 status `EveOnline::Exceptions::ResourceNotFound`
* Add exception for 500 status `EveOnline::Exceptions::InternalServerError`
* Add exception for 502 status `EveOnline::Exceptions::BadGateway`
* Add exception for 503 status `EveOnline::Exceptions::ServiceUnavailable`
* Add open/read timeouts. Default to 60s.
* Add `EveOnline::ESI::Base#read_timeout`
* Add `EveOnline::ESI::Base#read_timeout=`
* Add `EveOnline::ESI::Base#open_timeout`
* Add `EveOnline::ESI::Base#open_timeout=`
* Add `EveOnline::ESI::Base#client`
* Remove `EveOnline::Exceptions::InvalidCharacterIDException`
* Remove `EveOnline::Exceptions::UnauthorizedException`
* Rename `EveOnline::Exceptions::TimeoutException` to `EveOnline::Exceptions::Timeout`
* JRuby 9.2.0.0

## v0.15.0

* Add `EveOnline::ESI::Alliances`
* Add `EveOnline::ESI::AllianceCorporations`
* Add `EveOnline::ESI::Models::AllianceShort`
* Add `EveOnline::ESI::AlliancesNames`
* Ruby 2.5.0
* Add `EveOnline::ESI::Models::CharacterOrder`
* Add `EveOnline::ESI::CharacterOrders`
* Remove `EveOnline::XML::CharacterMarketOrders`. Use `EveOnline::ESI::CharacterOrders` instead.
* Add `EveOnline::ESI::Models::CorporationOrder`
* Add `EveOnline::ESI::CorporationOrders`
* Remove `EveOnline::XML::CorporationMarketOrders`. Use `EveOnline::ESI::CorporationOrders` instead.
* Remove `EveOnline::MarketOrder`
* Add `EveOnline::ESI::Models::Bookmark`
* Add `EveOnline::ESI::CharacterBookmarks`
* Remove `EveOnline::Bookmark`
* Remove `EveOnline::BookmarkFolder`
* Remove `EveOnline::XML::CharacterBookmarks`. Use `EveOnline::ESI::CharacterBookmarks` instead.
* Add `EveOnline::ESI::Models::BookmarkFolder`
* Add `EveOnline::ESI::CharacterBookmarkFolders`
* Add `EveOnline::ESI::Models::Notification`
* Add `EveOnline::ESI::CharacterNotifications`
* Remove `EveOnline::XML::CharacterContactNotifications`. Use `EveOnline::ESI::CharacterNotifications` instead.
* Remove `EveOnline::ContactNotification`
* [Drop Ruby 2.2 support](https://www.ruby-lang.org/en/news/2017/12/14/ruby-2-2-9-released/)
* Add `EveOnline::ESI::CharacterWalletJournal`
* Add `EveOnline::ESI::Models::WalletJournalEntry`
* Remove `EveOnline::XML::CharacterWalletJournal`. Use `EveOnline::ESI::CharacterWalletJournal` instead.
* Remove `EveOnline::WalletJournalEntry`
* Add `EveOnline::ESI::CharacterCalendar`
* Add `EveOnline::ESI::Models::Event`
* Remove `EveOnline::XML::CharacterUpcomingCalendarEvents`. Use `EveOnline::ESI::CharacterCalendar` instead.
* Remove `EveOnline::Event`
* Remove `EveOnline::EventResponseObject`
* Remove `EveOnline::XML::Base`
* Remove `EveOnline::Base`
* Remove `EveOnline::BaseXML`
* Remove `EveOnline::SDE::AgtAgentTypes`
* Remove `EveOnline::SDE::AgtAgents`
* Remove `EveOnline::SDE::AgtResearchAgents`
* Remove `EveOnline::SDE::Base`
* Remove `EveOnline::SDE::InvFlags`
* Remove `EveOnline::SDE::InvItems`
* Remove `EveOnline::SDE::InvNames`
* Remove `EveOnline::SDE::InvPositions`
* Remove `EveOnline::SDE::Models::AgtAgent`
* Remove `EveOnline::SDE::Models::AgtAgentType`
* Remove `EveOnline::SDE::Models::AgtResearchAgent`
* Remove `EveOnline::SDE::Models::InvFlag`
* Remove `EveOnline::SDE::Models::InvItem`
* Remove `EveOnline::SDE::Models::InvName`
* Remove `EveOnline::SDE::Models::InvPosition`
* Add `EveOnline::ESI::Models::Ancestry`
* Add `EveOnline::ESI::Ancestries`
* Rename `EveOnline::ESI::Models::AllianceIcon#small` to `#icon_small`
* Rename `EveOnline::ESI::Models::AllianceIcon#medium` to `#icon_medium`
* Rename `EveOnline::ESI::AllianceIcon#small` to `#icon_small`
* Rename `EveOnline::ESI::AllianceIcon#medium`  to `#icon_medium`

## v0.14.0

* Add `EveOnline::ESI::CorporationBlueprints`
* Add `EveOnline::ESI::Models::MarketHistory`
* Add `EveOnline::ESI::MarketHistory`
* [Sync with ESI 2017/12/20 update](https://developers.eveonline.com/blog/article/esi-endpoint-versioning-important-info-and-best-practices)
* Add `EveOnline::ESI::CharacterOnline`
* Add `EveOnline::ESI::Models::Online`

## v0.13.0

* Drop CREST API support
* Drop `EveOnline::BaseCREST` without alternative
* Drop `EveOnline::Sovereignty::Campaigns` without alternative
* Drop Ruby 1.9.3 support
* Drop Ruby 2.0 support
* Drop Ruby 2.1 support
* Add `EveOnline::ESI::CharacterWallet`
* Add `EveOnline::SDE::Models::ChrRace#icon_id`
* Add `icon_id` to `EveOnline::SDE::Models::ChrRace#as_json`
* Rename `EveOnline::SDE::ChrRaces` to `EveOnline::SDE::Races`
* Rename `EveOnline::SDE::ChrRace` to `EveOnline::SDE::ChrRace`
* Rename `EveOnline::SDE::Races#chr_races` to `EveOnline::SDE::Races#races`
* Combine options to options hash for ESI
* Always use versioned ESI routes
* Drop `EveOnline::XML::ServerStatus`. Use `EveOnline::ESI::ServerStatus` instead.
* Add `EveOnline::ESI::CharacterAssets`
* Add `EveOnline::ESI::Models::Asset`
* Drop `EveOnline::Item`
* Drop `EveOnline::XML::CharacterAssetList`. Use `EveOnline::ESI::CharacterAssets` instead.
* Drop `EveOnline::XML::CharacterSkillQueue`. Use `EveOnline::ESI::CharacterSkillQueue` instead.
* Drop `EveOnline::XML::Models::SkillQueueEntry`
* Add `EveOnline::ESI::CharacterAttributes`
* Add `EveOnline::ESI::Models::Attributes`
* Add `EveOnline::ESI::Models::Character`
* Add `EveOnline::ESI::Models::Base`
* Add `EveOnline::ESI::Races`
* Add `EveOnline::ESI::Models::Race`
* Add `EveOnline::ESI::Bloodlines`
* Add `EveOnline::ESI::Models::Bloodline`
* Drop `EveOnline::SDE::Races`. Use `EveOnline::ESI::Races` instead.
* Drop `EveOnline::SDE::Models::Race`
* Add `EveOnline::ESI::CharacterImplants`
* Drop `EveOnline::XML::CharacterAccountBalance`. Use `EveOnline::ESI::CharacterWallet` instead.
* Drop `EveOnline::XML::CharacterSheet#balance`. Use `EveOnline::ESI::CharacterWallet` instead.
* Drop `EveOnline::XML::CharacterSheet#implants`. Use `EveOnline::ESI::CharacterImplants` instead.
* Drop `EveOnline::Implant`
* Drop `EveOnline::CharacterImplants`
* Drop `EveOnline::XML::CharacterSheet#skills`. Use `EveOnline::ESI::CharacterSkills` instead.
* Drop `EveOnline::CharacterSkills`
* Drop `EveOnline::Skill`
* Drop `EveOnline::XML::CharacterSkillInTraining`. Use `EveOnline::ESI::CharacterSkillQueue` instead.
* Drop `EveOnline::XML::CharacterCalendarEventAttendees`
* Drop `EveOnline::XML::CharacterChatChannels`
* Drop `EveOnline::XML::CharacterContactList`
* Drop `EveOnline::XML::CharacterContractBids`
* Drop `EveOnline::XML::CharacterContractItems`
* Drop `EveOnline::XML::CharacterContracts`
* Drop `EveOnline::XML::CharacterWalletTransactions`
* Drop `EveOnline::XML::CharacterFacWarStats`
* Drop `EveOnline::XML::CharacterIndustryJobs`
* Drop `EveOnline::XML::CharacterIndustryJobsHistory`
* Drop `EveOnline::XML::CharacterKillMails`
* Drop `EveOnline::XML::CharacterLocations`
* Drop `EveOnline::XML::CharacterMailBodies`
* Drop `EveOnline::XML::CharacterMailingLists`
* Drop `EveOnline::XML::CharacterMailMessages`
* Drop `EveOnline::XML::CharacterMedals`
* Drop `EveOnline::XML::CharacterNotifications`
* Drop `EveOnline::XML::CharacterNotificationTexts`
* Drop `EveOnline::XML::CharacterPlanetaryColonies`
* Drop `EveOnline::XML::CharacterPlanetaryLinks`
* Drop `EveOnline::XML::CharacterPlanetaryPins`
* Drop `EveOnline::XML::CharacterPlanetaryRoutes`
* Drop `EveOnline::XML::CharacterResearch`
* Add `EveOnline::ESI::Alliance`
* Add `EveOnline::ESI::AllianceIcon`
* Add `EveOnline::ESI::Models::Alliance`
* Add `EveOnline::ESI::Models::AllianceIcon`
* Add `EveOnline::ESI::Models::CharacterPortrait`
* Add `EveOnline::ESI::CharacterBlueprints`
* Add `EveOnline::ESI::Models::Blueprint`
* Drop `EveOnline::XML::CharacterBlueprints`. Use `EveOnline::ESI::CharacterBlueprints` instead.
* Drop `EveOnline::Eve::CharacterID`
* Drop `EveOnline::XML::AccountCharacters`. ESI doesn't support this.
* Drop `EveOnline::XML::ApiKeyInfo`
* Drop `EveOnline::XML::AccountStatus`. ESO doesn't support this.
* Add `EveOnline::ESI::Models::Standing`
* Add `EveOnline::ESI::Standings`
* Drop `EveOnline::XML::CharacterStandings`. Use `EveOnline::ESI::Standings` instead.
* Add `EveOnline::ESI::CharacterFatigue`
* Add `EveOnline::ESI::Models::Fatigue`
* Add `EveOnline::ESI::Models::ServerStatus`
* Add `EveOnline::ESI::Corporation`. ([#120](https://github.com/biow0lf/eve_online/pull/120), @Mekaret)
* Add `EveOnline::ESI::CharacterClones`
* Add `EveOnline::ESI::Models::JumpClone`
* Add `EveOnline::ESI::Models::HomeLocation`
* Drop `EveOnline::JumpClone`
* Drop `EveOnline::JumpCloneImplant`
* Drop `EveOnline::CharacterJumpClones`
* Drop `EveOnline::CharacterJumpCloneImplants`
* Drop `EveOnline::XML::CharacterSheet#jump_clones`
* Drop `EveOnline::XML::CharacterSheet#jump_clone_implants`
* Drop `EveOnline::XML::CharacterSheet`. Use ESI endpoints.
* Add `EveOnline::ESI::CharacterIndustryJobs`. ([#126](https://github.com/biow0lf/eve_online/pull/126), @Mekaret)
* Add `EveOnline::ESI::CorporationIndustryJobs`. ([#126](https://github.com/biow0lf/eve_online/pull/126), @Mekaret)
* Drop `EveOnline::XML::Models::AccountTypeObject`
* Add `EveOnline::ESI::Factions`
* Add `EveOnline::ESI::Models::Faction`
* Add `EveOnline::ESI::DogmaAttributes`
* Add `EveOnline::ESI::Models::DogmaAttribute`
* Add `EveOnline::ESI::DogmaAttribute`

## v0.12.0

* **Breaking change**. Rename `EveOnline::Exceptions::Exception` to `EveOnline::Exceptions::Base`.
* Add `EveOnline::XML::Base` class
* Add `EveOnline::Exceptions::UnauthorizedException`
* Add `EveOnline::Exceptions::InvalidCharacterIDException`
* Test with Rails 5.1.0 too
* Rename `EveOnline::Account::Status` to `EveOnline::XML::AccountStatus`
* Rename `EveOnline::Account::ApiKeyInfo` to `EveOnline::XML::ApiKeyInfo`
* Rename `EveOnline::Account::Characters` to `EveOnline::XML::AccountCharacters`
* Rename `EveOnline::Characters::AccountBalance` to `EveOnline::XML::CharacterAccountBalance`
* Rename `EveOnline::Characters::AssetList` to `EveOnline::XML::CharacterAssetList`
* Rename `EveOnline::Characters::Blueprints` to `EveOnline::XML::CharacterBlueprints`
* Rename `EveOnline::Characters::Bookmarks` to `EveOnline::XML::CharacterBookmarks`
* Rename `EveOnline::Characters::CharacterSheet` to `EveOnline::XML::CharacterSheet`
* Rename `EveOnline::Corporations::MarketOrders` to `EveOnline::XML::CorporationMarketOrders`
* Rename `EveOnline::Server::Status` to `EveOnline::XML::ServerStatus`
* Rename `EveOnline::Characters::Medals` to `EveOnline::XML::CharacterMedals`
* Rename `EveOnline::Characters::SkillQueue` to `EveOnline::XML::CharacterSkillQueue`
* Rename `EveOnline::Characters::ChatChannels` to `EveOnline::XML::CharacterChatChannels`
* Rename `EveOnline::Characters::CalendarEventAttendees` to `EveOnline::XML::CharacterCalendarEventAttendees`
* Rename `EveOnline::Characters::ContractBids` to `EveOnline::XML::CharacterContractBids`
* Rename `EveOnline::Characters::ContractItems` to `EveOnline::XML::CharacterContractItems`
* Rename `EveOnline::Characters::ContactList` to `EveOnline::XML::CharacterContactList`
* Rename `EveOnline::Characters::ContactNotifications` to `EveOnline::XML::CharacterContactNotifications`
* Rename `EveOnline::Characters::Contracts` to `EveOnline::XML::CharacterContracts`
* Rename `EveOnline::Characters::FacWarStats` to `EveOnline::XML::CharacterFacWarStats`
* Rename `EveOnline::Characters::IndustryJobsHistory` to `EveOnline::XML::CharacterIndustryJobsHistory`
* Rename `EveOnline::Characters::IndustryJobs` to `EveOnline::XML::CharacterIndustryJobs`
* Rename `EveOnline::Characters::KillMails` to `EveOnline::XML::CharacterKillMails`
* Rename `EveOnline::Characters::Locations` to `EveOnline::XML::CharacterLocations`
* Rename `EveOnline::Characters::MailBodies` to `EveOnline::XML::CharacterMailBodies`
* Rename `EveOnline::Characters::MailMessages` to `EveOnline::XML::CharacterMailMessages`
* Rename `EveOnline::Characters::MailingLists` to `EveOnline::XML::CharacterMailingLists`
* Rename `EveOnline::Characters::MarketOrders` to `EveOnline::XML::CharacterMarketOrders`
* Rename `EveOnline::Characters::NotificationTexts` to `EveOnline::XML::CharacterNotificationTexts`
* Rename `EveOnline::Characters::Notifications` to `EveOnline::XML::CharacterNotifications`
* Rename `EveOnline::Characters::PlanetaryColonies` to `EveOnline::XML::CharacterPlanetaryColonies`
* Rename `EveOnline::Characters::PlanetaryLinks` to `EveOnline::XML::CharacterPlanetaryLinks`
* Rename `EveOnline::Characters::PlanetaryPins` to `EveOnline::XML::CharacterPlanetaryPins`
* Rename `EveOnline::Characters::PlanetaryRoutes` to `EveOnline::XML::CharacterPlanetaryRoutes`
* Rename `EveOnline::Characters::Research` to `EveOnline::XML::CharacterResearch`
* Rename `EveOnline::Characters::SkillInTraining` to `EveOnline::XML::CharacterSkillInTraining`
* Rename `EveOnline::Characters::Standings` to `EveOnline::XML::CharacterStandings`
* Rename `EveOnline::Characters::UpcomingCalendarEvents` to `EveOnline::XML::CharacterUpcomingCalendarEvents`
* Rename `EveOnline::Characters::WalletJournal` to `EveOnline::XML::CharacterWalletJournal`
* Rename `EveOnline::Characters::WalletTransactions` to `EveOnline::XML::CharacterWalletTransactions`
* Rename `EveOnline::XML::CharacterSheet#base_intelligence` to `EveOnline::XML::CharacterSheet#intelligence`
* Rename `EveOnline::XML::CharacterSheet#base_memory` to `EveOnline::XML::CharacterSheet#memory`
* Rename `EveOnline::XML::CharacterSheet#base_charisma` to `EveOnline::XML::CharacterSheet#charisma`
* Rename `EveOnline::XML::CharacterSheet#base_perception` to `EveOnline::XML::CharacterSheet#perception`
* Rename `EveOnline::XML::CharacterSheet#base_willpower` to `EveOnline::XML::CharacterSheet#willpower`
* Fix `EveOnline::ESI::Character`
* Use versioned API endpoints
* Ignore missed fields in responses
* Add `EveOnline::ESI::ServerStatus`

## v0.11.0

* Add SDE support classes
* `EveOnline::SDE::AgtAgentTypes`
* `EveOnline::SDE::AgtAgents`
* `EveOnline::SDE::AgtResearchAgents`
* `EveOnline::SDE::ChrRaces`
* `EveOnline::SDE::InvFlags`
* `EveOnline::SDE::InvItems`
* `EveOnline::SDE::InvNames`
* `EveOnline::SDE::InvPositions`
* `EveOnline::SDE::Models::AgtAgentType`
* `EveOnline::SDE::Models::AgtAgent`
* `EveOnline::SDE::Models::AgtResearchAgent`
* `EveOnline::SDE::Models::ChrRace`
* `EveOnline::SDE::Models::InvFlag`
* `EveOnline::SDE::Models::InvItem`
* `EveOnline::SDE::Models::InvName`
* `EveOnline::SDE::Models::InvPosition`
* Finish `EveOnline::ESI::Characters::Character`
* Add `EveOnline::ESI::CharacterPortrait`
* Add `EveOnline::ESI::CharacterSkills`
* Rename `EveOnline::ESI::Characters::Character` to `EveOnline::ESI::Character`
* Add `EveOnline::ESI::CharacterSkillQueue`
* Add `EveOnline::ESI::CharacterLoyaltyPoints`
* Add `EveOnline::ESI::Models::LoyaltyPoint` class for handling character loyalty points
* Add `EveOnline::ESI::Models::SkillQueue` class for handling character skill queue entries
* Add `EveOnline::ESI::Models::Skill` class for handing character skills
* Rename `EveOnline::SkillQueueEntry` to `EveOnline::XML::Models::SkillQueueEntry`

## v0.10.0

* Replace `open-uri` with `faraday`
* Add `EveOnline::ESI::Characters::Character`
* Add `EveOnline::AccountTypeObject` class for handling EveOnline account type values
* `EveOnline::Account::ApiKeyInfo#type` now returns symbols. e.g. `:account`
* Add `EveOnline::Account::ApiKeyInfo#as_json`
* Rename `EveOnline::Account::ApiKeyInfo#type` to `#api_key_type`

## v0.9.0

* Add basic `EveOnline::Characters::Contracts`
* Add basic `EveOnline::Characters::ContractBids`
* Add basic `EveOnline::Characters::ContractItems`
* Add basic `EveOnline::Characters::FacWarStats`
* Add basic `EveOnline::Characters::IndustryJobs`
* Add basic `EveOnline::Characters::IndustryJobsHistory`
* Add `EveOnline::JumpCloneImplant` class for handling character jump clone implant
* Add `EveOnline::CharacterJumpCloneImplants` class for handling character jump clone implants
* Add basic `EveOnline::Characters::KillMails`
* Add basic `EveOnline::Characters::Locations`
* Add basic `EveOnline::Characters::MailBodies`
* Add basic `EveOnline::Characters::MailingLists`
* Add basic `EveOnline::Characters::MailMessages`
* Add basic `EveOnline::Characters::MarketOrders`
* Add basic `EveOnline::Characters::Notifications`
* `EveOnline::Characters::AccountBalance#balance` return float from now
* `EveOnline::Characters::CharacterSheet#balance` return float from now
* Add basic `EveOnline::Characters::NotificationTexts`
* Add basic `EveOnline::Characters::PlanetaryColonies`
* Add basic `EveOnline::Characters::PlanetaryLinks`
* Add basic `EveOnline::Characters::PlanetaryPins`
* Add basic `EveOnline::Characters::PlanetaryRoutes`
* Add basic `EveOnline::Characters::Research`
* Add basic `EveOnline::Characters::WalletJournal`
* Add basic `EveOnline::Characters::WalletTransactions`
* Add `EveOnline::SkillQueueEntry` class for handling character skill queue entry
* Make `EveOnline::Characters::Blueprints#row` `private`
* Make `EveOnline::Characters::Blueprints#rowset` `private`
* Make `EveOnline::Account::ApiKeyInfo#row` `private`
* Make `EveOnline::Account::ApiKeyInfo#rowset` `private`
* Make `EveOnline::Account::Characters#row` `private`
* Make `EveOnline::Account::Characters#rowset` `private`
* [Skill Queue](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_skillqueue.html)
* Add `EveOnline::ContactNotification` class for handling character contact notification
* [Contact Notifications](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_contactnotifications.html)
* Make `EveOnline::Characters::AccountBalance#row` `private`
* Make `EveOnline::Characters::AccountBalance#rowset` `private`
* Make `EveOnline::Characters::Account#key` `private`
* Make `EveOnline::Characters::AssetList#row` `private`
* Make `EveOnline::Characters::AssetList#rowset` `private`
* Make `EveOnline::Characters::Locations#escaped_ids` `private`
* Make `EveOnline::Characters::MailBodies#escaped_ids` `private`
* Make `EveOnline::Characters::NotificationTexts#escaped_ids` `private`
* Make `EveOnline::Characters::UpcomingCalendarEvents#row` `private`
* Make `EveOnline::Characters::UpcomingCalendarEvents#rowset` `private`
* Add access masks
* Make `EveOnline::Characters::Bookmarks#row` `private`
* Make `EveOnline::Characters::Bookmarks#rowset` `private`
* Add `EveOnline::WalletJournalEntry` class for handling character wallet journal entry
* [Wallet Journal](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_walletjournal.html)
* Rework memoization
* [Market Orders](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_marketorders.html)
* [Market Orders](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_marketorders.html)

## v0.8.0

* Add basic `EveOnline::Characters::Medals` class
* Add basic `EveOnline::Characters::CharacterSheet` class
* Add `EveOnline::Implant` class for handling character implant
* Add `EveOnline::Skill` class for handling character skill
* Add `EveOnline::CharacterSkills` class for handling character skills
* Add `EveOnline::JumpClone` class for handling character jump clone
* Add `EveOnline::CharacterImplants` class for handling character implants
* Add `EveOnline::CharacterJumpClones` class for handling character jump clones
* Finish [Character Bookmarks](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_bookmarks.html)
* Finish [Standings](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_standings.html)
* Add `EveOnline::Standing` class for handling character standing

## v0.7.0

* Drop `nokogiri` gem from gem dependency
* Add `json` gem for CREST API
* Add `EveOnline::Item` for handle items in AssetList
* [Asset List](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_assetlist.html)
* Remove unused `EveOneline::Skill` and `EveOnline::SkillGroup` classes
* Add `EveOnline::BookmarkFolder` class for handling bookmarks folders
* Add `EveOnline::Bookmark` class for handling EveOnline Bookmarks
* Remove unused `EveOnline::Eve::SkillTree` class
* Relax activesupport version requirement (now requires 3.0.0 or later)
* Respect EveOnline API guidelines. Set correct user agent.
* Add basic `EveOnline::Sovereignty::Campaigns` class
* Add basic `EveOnline::Eve::CharacterID` to handle character name to character id requests
* Add `EveOnline::BaseXML` as base for XML API
* Add `EveOnline::BaseCREST` as base for CREST API
* Citadel 1.0 updates

## v0.6.0

* Add `EveOnline::EventResponseObject` class for handling EveOnline Event response values
* `EveOnline::Event#response` now returns symbols. e.g. `:undecided`
* [Character Blueprints](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_blueprints.html)
* Add `EveOnline::Blueprint` class for handling EveOnline Blueprints
* Add basic [Character Bookmarks](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_bookmarks.html)
* [Characters SkillInTraining](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_skillintraining.html)

## v0.5.0

* Add `EveOnline::Event` class for handling EveOnline Events
* `EveOnline::Account::ApiKeyInfo#expires` now returns time with timezone
* [Upcoming Calendar Events](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_upcomingcalendarevents.html)
* Basic [Calendar Event Attendees](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_calendareventattendees.html)

## v0.4.0

* Time zone fixes
* Add `EveOnline::Character` class for handling each Character
* `EveOnline::Account::Characters` and `EveOnline::Account::ApiKeyInfo` now supports multiple characters
* Fix `EveOnline::Characters::AccountBalance` class
* Fix `EveOnline::Characters::AccountBalance#account_key`
* Add `#as_json` methods

## v0.3.0

* [Characters](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/account/account_characters.html)
* Refactoring and bug fixes

## v0.2.0

* [Account Balance](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_accountbalance.html)
* [API Key Info](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/account/account_apikeyinfo.html)
* [Account Status](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/account/account_accountstatus.html)

## v0.1.0

* [Server Status](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/server/serv_serverstatus.html)
