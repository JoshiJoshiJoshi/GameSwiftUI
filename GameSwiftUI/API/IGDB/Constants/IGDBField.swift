//
//  RequestConstants.swift
//  GameSwiftUI
//
//  Created by Joshi on 07.04.21.
//

import Foundation

enum IGDBEndpoint: String {
    case games = "/v4/games"
    
    case ageRatings = "/v4/age_ratings"
    case ageRatingContentDescriptions = "/v4/age_rating_content_description"
    case alternativeNames = "/v4/alternative_names"
    case artworks = "/v4/artworks"
    case characters = "/v4/characters"
    case characterMugShots = "/v4/character_mug_shots"
    case collections = "/v4/collections"
    case companies = "/v4/companies"
    case companyLogos = "/v4/company_logos"
    case companyWebsites = "/v4/company_websites"
    case covers = "/v4/covers"
    case externalGames = "/v4/external_games"
    case franchises = "/v4/franchises"
    case gameEngines = "/v4/game_engines"
    case gameEngineLogos = "/v4/game_engine_logos"
    case gameModes = "/v4/game_modes"
    case gameVersions = "/v4/game_versions"
    case gameVersionFeatures = "/v4/game_version_features"
    case gameVersionFeatureValues = "/v4/game_version_feature_values"
    case gameVideos = "/v4/game_videos"
    case genres = "/v4/genres"
    case involvedCompanies = "/v4/involved_companies"
    case keywords = "/v4/keywords"
    case multiplayerModes = "/v4/multiplayer_modes"
    case platforms = "/v4/platforms"
    case platformFamilies = "/v4/platform_families"
    case platformVersions = "/v4/platform_versions"
    case platformVersionCompanies = "/v4/platform_version_companies"
    case platformVersionReleaseDates = "/v4/platform_version_release_dates"
    case platformWebsites = "/v4/platform_websites"
    case playerPerspectives = "/v4/player_perspectives"
    case releaseDates = "/v4/release_dates"
    case screenshots = "/v4/screenshots"
    case search = "/v4/search"
    case themes = "/v4/themes"
    case websites = "/v4/websites"
}

struct IGDBField {
    struct AgeRating {
        static private let base = (IGDBConstant.AgeRating._base)
        static let all = "\(base).*"
        static let category = "\(base).\(IGDBConstant.AgeRating.category)"
        static let checksum = "\(base).\(IGDBConstant.AgeRating.checksum)"
        static let contentDescriptions = "\(base).\(IGDBConstant.AgeRating.contentDescriptions)"
        static let rating = "\(base).\(IGDBConstant.AgeRating.rating)"
        static let ratingCoverUrl = "\(base).\(IGDBConstant.AgeRating.ratingCoverUrl)"
        static let synopsis = "\(base).\(IGDBConstant.AgeRating.synopsis)"
    }
    
    struct AgeRatingContentDescription {
        static private let base = (IGDBConstant.AgeRatingContentDescription._base)
        static let all = "\(base).*"
        static let category = "\(base).\(IGDBConstant.AgeRatingContentDescription.category)"
        static let checksum = "\(base).\(IGDBConstant.AgeRatingContentDescription.checksum)"
        static let description = "\(base).\(IGDBConstant.AgeRatingContentDescription.description)"
    }
    
    struct AlternativeName {
        static private let base = (IGDBConstant.AlternativeName._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(IGDBConstant.AlternativeName.checksum)"
        static let comment = "\(base).\(IGDBConstant.AlternativeName.comment)"
        static let game = "\(base).\(IGDBConstant.AlternativeName.game)"
        static let name = "\(base).\(IGDBConstant.AlternativeName.name)"
    }
    struct Artwork {
        static private let base = (IGDBConstant.Artwork._base)
        static let all = "\(base).*"
        static let alphaChannel = "\(base).\(IGDBConstant.Artwork.alphaChannel)"
        static let animated = "\(base).\(IGDBConstant.Artwork.animated)"
        static let checksum = "\(base).\(IGDBConstant.Artwork.checksum)"
        static let game = "\(base).\(IGDBConstant.Artwork.game)"
        static let height = "\(base).\(IGDBConstant.Artwork.height)"
        static let imageId = "\(base).\(IGDBConstant.Artwork.imageId)"
        static let url = "\(base).\(IGDBConstant.Artwork.url)"
        static let width = "\(base).\(IGDBConstant.Artwork.width)"
    }
    struct Character {
        static private let base = (IGDBConstant.Character._base)
        static let all = "\(base).*"
        static let akas = "\(base).\(IGDBConstant.Character.akas)"
        static let checksum = "\(base).\(IGDBConstant.Character.checksum)"
        static let countryName = "\(base).\(IGDBConstant.Character.countryName)"
        static let createdAt = "\(base).\(IGDBConstant.Character.createdAt)"
        static let description = "\(base).\(IGDBConstant.Character.description)"
        static let games = "\(base).\(IGDBConstant.Character.games)"
        static let gender = "\(base).\(IGDBConstant.Character.gender)"
        static let mugShot = "\(base).\(IGDBConstant.Character.mugShot)"
        static let name = "\(base).\(IGDBConstant.Character.name)"
        static let slug = "\(base).\(IGDBConstant.Character.slug)"
        static let species = "\(base).\(IGDBConstant.Character.species)"
        static let updatedAt = "\(base).\(IGDBConstant.Character.updatedAt)"
        static let url = "\(base).\(IGDBConstant.Character.url)"
    }
    struct CharacterMugShot {
        static private let base = (IGDBConstant.CharacterMugShot._base)
        static let all = "\(base).*"
        static let alphaChannel = "\(base).\(IGDBConstant.CharacterMugShot.alphaChannel)"
        static let animated = "\(base).\(IGDBConstant.CharacterMugShot.animated)"
        static let checksum = "\(base).\(IGDBConstant.CharacterMugShot.checksum)"
        static let height = "\(base).\(IGDBConstant.CharacterMugShot.height)"
        static let imageId = "\(base).\(IGDBConstant.CharacterMugShot.imageId)"
        static let url = "\(base).\(IGDBConstant.CharacterMugShot.url)"
        static let width = "\(base).\(IGDBConstant.CharacterMugShot.width)"
    }
    struct Collection {
        static private let base = (IGDBConstant.Collection._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(IGDBConstant.Collection.checksum)"
        static let createdAt = "\(base).\(IGDBConstant.Collection.createdAt)"
        static let games = "\(base).\(IGDBConstant.Collection.games)"
        static let name = "\(base).\(IGDBConstant.Collection.name)"
        static let slug = "\(base).\(IGDBConstant.Collection.slug)"
        static let updatedAt = "\(base).\(IGDBConstant.Collection.updatedAt)"
        static let url = "\(base).\(IGDBConstant.Collection.url)"
    }
    struct Company {
        static private let base = (IGDBConstant.Company._base)
        static let all = "\(base).*"
        static let changeDate = "\(base).\(IGDBConstant.Company.changeDate)"
        static let changeDateCategory = "\(base).\(IGDBConstant.Company.changeDateCategory)"
        static let changedCompanyId = "\(base).\(IGDBConstant.Company.changedCompanyId)"
        static let checksum = "\(base).\(IGDBConstant.Company.checksum)"
        static let country = "\(base).\(IGDBConstant.Company.country)"
        static let createdAt = "\(base).\(IGDBConstant.Company.createdAt)"
        static let description = "\(base).\(IGDBConstant.Company.description)"
        static let developed = "\(base).\(IGDBConstant.Company.developed)"
        static let logo = "\(base).\(IGDBConstant.Company.logo)"
        static let name = "\(base).\(IGDBConstant.Company.name)"
        static let parent = "\(base).\(IGDBConstant.Company.parent)"
        static let published = "\(base).\(IGDBConstant.Company.published)"
        static let slug = "\(base).\(IGDBConstant.Company.slug)"
        static let startDate = "\(base).\(IGDBConstant.Company.startDate)"
        static let startDateCategory = "\(base).\(IGDBConstant.Company.startDateCategory)"
        static let updatedAt = "\(base).\(IGDBConstant.Company.updatedAt)"
        static let url = "\(base).\(IGDBConstant.Company.url)"
        static let websites = "\(base).\(IGDBConstant.Company.websites)"
    }
    struct CompanyLogo {
        static private let base = (IGDBConstant.CompanyLogo._base)
        static let all = "\(base).*"
        static let alphaChannel = "\(base).\(IGDBConstant.CompanyLogo.alphaChannel)"
        static let animated = "\(base).\(IGDBConstant.CompanyLogo.animated)"
        static let checksum = "\(base).\(IGDBConstant.CompanyLogo.checksum)"
        static let height = "\(base).\(IGDBConstant.CompanyLogo.height)"
        static let imageId = "\(base).\(IGDBConstant.CompanyLogo.imageId)"
        static let url = "\(base).\(IGDBConstant.CompanyLogo.url)"
        static let width = "\(base).\(IGDBConstant.CompanyLogo.width)"
    }
    struct CompanyWebsite {
        static private let base = (IGDBConstant.CompanyWebsite._base)
        static let all = "\(base).*"
        static let category = "\(base).\(IGDBConstant.CompanyWebsite.category)"
        static let checksum = "\(base).\(IGDBConstant.CompanyWebsite.checksum)"
        static let trusted = "\(base).\(IGDBConstant.CompanyWebsite.trusted)"
        static let url = "\(base).\(IGDBConstant.CompanyWebsite.url)"
    }
    struct Cover {
        static private let base = (IGDBConstant.Cover._base)
        static let all = "\(base).*"
        static let alphaChannel = "\(base).\(IGDBConstant.Cover.alphaChannel)"
        static let animated = "\(base).\(IGDBConstant.Cover.animated)"
        static let checksum = "\(base).\(IGDBConstant.Cover.checksum)"
        static let game = "\(base).\(IGDBConstant.Cover.game)"
        static let height = "\(base).\(IGDBConstant.Cover.height)"
        static let imageId = "\(base).\(IGDBConstant.Cover.imageId)"
        static let url = "\(base).\(IGDBConstant.Cover.url)"
        static let width = "\(base).\(IGDBConstant.Cover.width)"
    }
    struct ExternalGame {
        static private let base = (IGDBConstant.ExternalGame._base)
        static let all = "\(base).*"
        static let category = "\(base).\(IGDBConstant.ExternalGame.category)"
        static let checksum = "\(base).\(IGDBConstant.ExternalGame.checksum)"
        static let countries = "\(base).\(IGDBConstant.ExternalGame.countries)"
        static let createdAt = "\(base).\(IGDBConstant.ExternalGame.createdAt)"
        static let game = "\(base).\(IGDBConstant.ExternalGame.game)"
        static let media = "\(base).\(IGDBConstant.ExternalGame.media)"
        static let name = "\(base).\(IGDBConstant.ExternalGame.name)"
        static let platform = "\(base).\(IGDBConstant.ExternalGame.platform)"
        static let uid = "\(base).\(IGDBConstant.ExternalGame.uid)"
        static let updatedAt = "\(base).\(IGDBConstant.ExternalGame.updatedAt)"
        static let url = "\(base).\(IGDBConstant.ExternalGame.url)"
        static let year = "\(base).\(IGDBConstant.ExternalGame.year)"
    }
    
    struct Franchise {
        static private let base = (IGDBConstant.Franchise._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(IGDBConstant.Franchise.checksum)"
        static let createdAt = "\(base).\(IGDBConstant.Franchise.createdAt)"
        static let games = "\(base).\(IGDBConstant.Franchise.games)"
        static let name = "\(base).\(IGDBConstant.Franchise.name)"
        static let slug = "\(base).\(IGDBConstant.Franchise.slug)"
        static let updatedAt = "\(base).\(IGDBConstant.Franchise.updatedAt)"
        static let url = "\(base).\(IGDBConstant.Franchise.url)"
    }
    
    struct Game {
        static let all = "*"
        static let id = (IGDBConstant.Game.id)
        static let ageRatings = (IGDBConstant.Game.ageRatings)
        static let aggregatedRating = (IGDBConstant.Game.aggregatedRating)
        static let aggregatedRatingCount = (IGDBConstant.Game.aggregatedRatingCount)
        static let alternativeNames = (IGDBConstant.Game.alternativeNames)
        static let artworks = (IGDBConstant.Game.artworks)
        static let bundles = (IGDBConstant.Game.bundles)
        static let category = (IGDBConstant.Game.category)
        static let checksum = (IGDBConstant.Game.checksum)
        static let collection = (IGDBConstant.Game.collection)
        static let cover = (IGDBConstant.Game.cover)
        static let createdAt = (IGDBConstant.Game.createdAt)
        static let dlcs = (IGDBConstant.Game.dlcs)
        static let expandedGames = (IGDBConstant.Game.expandedGames)
        static let expansions = (IGDBConstant.Game.expansions)
        static let externalGames = (IGDBConstant.Game.externalGames)
        static let firstReleaseDate = (IGDBConstant.Game.firstReleaseDate)
        static let follows = (IGDBConstant.Game.follows)
        static let forks = (IGDBConstant.Game.forks)
        static let franchise = (IGDBConstant.Game.franchise)
        static let franchises = (IGDBConstant.Game.franchises)
        static let gameEngines = (IGDBConstant.Game.gameEngines)
        static let gameModes = (IGDBConstant.Game.gameModes)
        static let genres = (IGDBConstant.Game.genres)
        static let hypes = (IGDBConstant.Game.hypes)
        static let involvedCompanies = (IGDBConstant.Game.involvedCompanies)
        static let keywords = (IGDBConstant.Game.keywords)
        static let multiplayerModes = (IGDBConstant.Game.multiplayerModes)
        static let name = (IGDBConstant.Game.name)
        static let parentGame = (IGDBConstant.Game.parentGame)
        static let platforms = (IGDBConstant.Game.platforms)
        static let playerPerspectives = (IGDBConstant.Game.playerPerspectives)
        static let ports = (IGDBConstant.Game.ports)
        static let rating = (IGDBConstant.Game.rating)
        static let ratingCount = (IGDBConstant.Game.ratingCount)
        static let releaseDates = (IGDBConstant.Game.releaseDates)
        static let remakes = (IGDBConstant.Game.remakes)
        static let remasters = (IGDBConstant.Game.remasters)
        static let screenshots = (IGDBConstant.Game.screenshots)
        static let similarGames = (IGDBConstant.Game.similarGames)
        static let slug = (IGDBConstant.Game.slug)
        static let standaloneExpansions = (IGDBConstant.Game.standaloneExpansions)
        static let status = (IGDBConstant.Game.status)
        static let storyline = (IGDBConstant.Game.storyline)
        static let summary = (IGDBConstant.Game.summary)
        static let tags = (IGDBConstant.Game.tags)
        static let themes = (IGDBConstant.Game.themes)
        static let totalRating = (IGDBConstant.Game.totalRating)
        static let totalRatingCount = (IGDBConstant.Game.totalRatingCount)
        static let updatedAt = (IGDBConstant.Game.updatedAt)
        static let url = (IGDBConstant.Game.url)
        static let versionParent = (IGDBConstant.Game.versionParent)
        static let versionTitle = (IGDBConstant.Game.versionTitle)
        static let videos = (IGDBConstant.Game.videos)
        static let websites = (IGDBConstant.Game.websites)
    }
    struct GameEngine {
        static private let base = (IGDBConstant.GameEngine._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(IGDBConstant.GameEngine.checksum)"
        static let companies = "\(base).\(IGDBConstant.GameEngine.companies)"
        static let createdAt = "\(base).\(IGDBConstant.GameEngine.createdAt)"
        static let description = "\(base).\(IGDBConstant.GameEngine.description)"
        static let logo = "\(base).\(IGDBConstant.GameEngine.logo)"
        static let name = "\(base).\(IGDBConstant.GameEngine.name)"
        static let platforms = "\(base).\(IGDBConstant.GameEngine.platforms)"
        static let slug = "\(base).\(IGDBConstant.GameEngine.slug)"
        static let updatedAt = "\(base).\(IGDBConstant.GameEngine.updatedAt)"
        static let url = "\(base).\(IGDBConstant.GameEngine.url)"
    }
    
    struct GameEngineLogo {
        static private let base = (IGDBConstant.GameEngineLogo._base)
        static let all = "\(base).*"
        static let alphaChannel = "\(base).\(IGDBConstant.GameEngineLogo.alphaChannel)"
        static let animated = "\(base).\(IGDBConstant.GameEngineLogo.animated)"
        static let checksum = "\(base).\(IGDBConstant.GameEngineLogo.checksum)"
        static let game = "\(base).\(IGDBConstant.GameEngineLogo.game)"
        static let height = "\(base).\(IGDBConstant.GameEngineLogo.height)"
        static let imageId = "\(base).\(IGDBConstant.GameEngineLogo.imageId)"
        static let url = "\(base).\(IGDBConstant.GameEngineLogo.url)"
        static let width = "\(base).\(IGDBConstant.GameEngineLogo.width)"
    }
    struct GameMode {
        static private let base = (IGDBConstant.GameMode._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(IGDBConstant.GameMode.checksum)"
        static let createdAt = "\(base).\(IGDBConstant.GameMode.createdAt)"
        static let name = "\(base).\(IGDBConstant.GameMode.name)"
        static let slug = "\(base).\(IGDBConstant.GameMode.slug)"
        static let updatedAt = "\(base).\(IGDBConstant.GameMode.updatedAt)"
        static let url = "\(base).\(IGDBConstant.GameMode.url)"
    }
    struct GameVersion {
        static private let base = (IGDBConstant.GameVersion._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(IGDBConstant.GameVersion.checksum)"
        static let createdAt = "\(base).\(IGDBConstant.GameVersion.createdAt)"
        static let features = "\(base).\(IGDBConstant.GameVersion.features)"
        static let game = "\(base).\(IGDBConstant.GameVersion.game)"
        static let games = "\(base).\(IGDBConstant.GameVersion.games)"
        static let updatedAt = "\(base).\(IGDBConstant.GameVersion.updatedAt)"
        static let url = "\(base).\(IGDBConstant.GameVersion.url)"
    }
    struct GameVersionFeature {
        static private let base = (IGDBConstant.GameVersionFeature._base)
        static let all = "\(base).*"
        static let category = "\(base).\(IGDBConstant.GameVersionFeature.category)"
        static let checksum = "\(base).\(IGDBConstant.GameVersionFeature.checksum)"
        static let description = "\(base).\(IGDBConstant.GameVersionFeature.description)"
        static let position = "\(base).\(IGDBConstant.GameVersionFeature.position)"
        static let title = "\(base).\(IGDBConstant.GameVersionFeature.title)"
        static let values = "\(base).\(IGDBConstant.GameVersionFeature.values)"
    }
    struct GameVersionFeatureValue {
        static private let base = (IGDBConstant.GameVersionFeatureValue._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(IGDBConstant.GameVersionFeatureValue.checksum)"
        static let game = "\(base).\(IGDBConstant.GameVersionFeatureValue.game)"
        static let gameFeature = "\(base).\(IGDBConstant.GameVersionFeatureValue.gameFeature)"
        static let includedFeature = "\(base).\(IGDBConstant.GameVersionFeatureValue.includedFeature)"
        static let note = "\(base).\(IGDBConstant.GameVersionFeatureValue.note)"
    }
    struct GameVideo {
        static private let base = (IGDBConstant.GameVideo._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(IGDBConstant.GameVideo.checksum)"
        static let name = "\(base).\(IGDBConstant.GameVideo.name)"
        static let videoId = "\(base).\(IGDBConstant.GameVideo.videoId)"
    }
    struct Genre {
        static private let base = (IGDBConstant.Genre._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(IGDBConstant.Genre.checksum)"
        static let createdAt = "\(base).\(IGDBConstant.Genre.createdAt)"
        static let name = "\(base).\(IGDBConstant.Genre.name)"
        static let slug = "\(base).\(IGDBConstant.Genre.slug)"
        static let updatedAt = "\(base).\(IGDBConstant.Genre.updatedAt)"
        static let url = "\(base).\(IGDBConstant.Genre.url)"
    }
    struct InvolvedCompany {
        static private let base = (IGDBConstant.InvolvedCompany._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(IGDBConstant.InvolvedCompany.checksum)"
        static let company = "\(base).\(IGDBConstant.InvolvedCompany.company)"
        static let createdAt = "\(base).\(IGDBConstant.InvolvedCompany.createdAt)"
        static let developer = "\(base).\(IGDBConstant.InvolvedCompany.developer)"
        static let game = "\(base).\(IGDBConstant.InvolvedCompany.game)"
        static let porting = "\(base).\(IGDBConstant.InvolvedCompany.porting)"
        static let publisher = "\(base).\(IGDBConstant.InvolvedCompany.publisher)"
        static let supporting = "\(base).\(IGDBConstant.InvolvedCompany.supporting)"
        static let updatedAt = "\(base).\(IGDBConstant.InvolvedCompany.updatedAt)"
    }
    struct Keyword {
        static private let base = (IGDBConstant.Keyword._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(IGDBConstant.Keyword.checksum)"
        static let createdAt = "\(base).\(IGDBConstant.Keyword.createdAt)"
        static let name = "\(base).\(IGDBConstant.Keyword.name)"
        static let slug = "\(base).\(IGDBConstant.Keyword.slug)"
        static let updatedAt = "\(base).\(IGDBConstant.Keyword.updatedAt)"
        static let url = "\(base).\(IGDBConstant.Keyword.url)"
    }
    struct MultiplayerMode {
        static private let base = (IGDBConstant.MultiplayerMode._base)
        static let all = "\(base).*"
        static let campaignCoop = "\(base).\(IGDBConstant.MultiplayerMode.campaignCoop)"
        static let checksum = "\(base).\(IGDBConstant.MultiplayerMode.checksum)"
        static let dropIn = "\(base).\(IGDBConstant.MultiplayerMode.dropIn)"
        static let game = "\(base).\(IGDBConstant.MultiplayerMode.game)"
        static let lanCoop = "\(base).\(IGDBConstant.MultiplayerMode.lanCoop)"
        static let offlineCoop = "\(base).\(IGDBConstant.MultiplayerMode.offlineCoop)"
        static let offlineCoopMax = "\(base).\(IGDBConstant.MultiplayerMode.offlineCoopMax)"
        static let offlineMax = "\(base).\(IGDBConstant.MultiplayerMode.offlineMax)"
        static let platform = "\(base).\(IGDBConstant.MultiplayerMode.platform)"
        static let splitscreen = "\(base).\(IGDBConstant.MultiplayerMode.splitscreen)"
        static let splitscreenOnline = "\(base).\(IGDBConstant.MultiplayerMode.splitscreenOnline)"
    }
    struct Platform {
        static private let base = (IGDBConstant.Platform._base)
        static let all = "\(base).*"
        static let abbreviation = "\(base).\(IGDBConstant.Platform.abbreviation)"
        static let alternativeName = "\(base).\(IGDBConstant.Platform.alternativeName)"
        static let category = "\(base).\(IGDBConstant.Platform.category)"
        static let checksum = "\(base).\(IGDBConstant.Platform.checksum)"
        static let createdAt = "\(base).\(IGDBConstant.Platform.createdAt)"
        static let generation = "\(base).\(IGDBConstant.Platform.generation)"
        static let name = "\(base).\(IGDBConstant.Platform.name)"
        static let platformFamily = "\(base).\(IGDBConstant.Platform.platformFamily)"
        static let platformLogo = "\(base).\(IGDBConstant.Platform.platformLogo)"
        static let slug = "\(base).\(IGDBConstant.Platform.slug)"
        static let summary = "\(base).\(IGDBConstant.Platform.summary)"
        static let updatedAt = "\(base).\(IGDBConstant.Platform.updatedAt)"
        static let url = "\(base).\(IGDBConstant.Platform.url)"
        static let versions = "\(base).\(IGDBConstant.Platform.versions)"
        static let websites = "\(base).\(IGDBConstant.Platform.websites)"
    }
    struct PlatformFamily {
        static private let base = (IGDBConstant.PlatformFamily._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(IGDBConstant.PlatformFamily.checksum)"
        static let name = "\(base).\(IGDBConstant.PlatformFamily.name)"
        static let slug = "\(base).\(IGDBConstant.PlatformFamily.slug)"
    }
    struct PlatformLogo {
        static private let base = (IGDBConstant.PlatformLogo._base)
        static let all = "\(base).*"
        static let alphaChannel = "\(base).\(IGDBConstant.PlatformLogo.alphaChannel)"
        static let animated = "\(base).\(IGDBConstant.PlatformLogo.animated)"
        static let checksum = "\(base).\(IGDBConstant.PlatformLogo.checksum)"
        static let game = "\(base).\(IGDBConstant.PlatformLogo.game)"
        static let height = "\(base).\(IGDBConstant.PlatformLogo.height)"
        static let imageId = "\(base).\(IGDBConstant.PlatformLogo.imageId)"
        static let url = "\(base).\(IGDBConstant.PlatformLogo.url)"
        static let width = "\(base).\(IGDBConstant.PlatformLogo.width)"
    }
    struct PlatformVersion {
        static private let base = (IGDBConstant.PlatformVersion._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(IGDBConstant.PlatformVersion.checksum)"
        static let companies = "\(base).\(IGDBConstant.PlatformVersion.companies)"
        static let connectivity = "\(base).\(IGDBConstant.PlatformVersion.connectivity)"
        static let cpu = "\(base).\(IGDBConstant.PlatformVersion.cpu)"
        static let graphics = "\(base).\(IGDBConstant.PlatformVersion.graphics)"
        static let mainManufacturer = "\(base).\(IGDBConstant.PlatformVersion.mainManufacturer)"
        static let media = "\(base).\(IGDBConstant.PlatformVersion.media)"
        static let memory = "\(base).\(IGDBConstant.PlatformVersion.memory)"
        static let name = "\(base).\(IGDBConstant.PlatformVersion.name)"
        static let os = "\(base).\(IGDBConstant.PlatformVersion.os)"
        static let output = "\(base).\(IGDBConstant.PlatformVersion.output)"
        static let platformLogo = "\(base).\(IGDBConstant.PlatformVersion.platformLogo)"
        static let platformVersionReleaseDates = "\(base).\(IGDBConstant.PlatformVersion.platformVersionReleaseDates)"
        static let resolutions = "\(base).\(IGDBConstant.PlatformVersion.resolutions)"
        static let slug = "\(base).\(IGDBConstant.PlatformVersion.slug)"
        static let sound = "\(base).\(IGDBConstant.PlatformVersion.sound)"
        static let storage = "\(base).\(IGDBConstant.PlatformVersion.storage)"
        static let summary = "\(base).\(IGDBConstant.PlatformVersion.summary)"
        static let url = "\(base).\(IGDBConstant.PlatformVersion.url)"
    }
    struct PlatformVersionCompany {
        static private let base = (IGDBConstant.PlatformVersionCompany._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(IGDBConstant.PlatformVersionCompany.checksum)"
        static let comment = "\(base).\(IGDBConstant.PlatformVersionCompany.comment)"
        static let company = "\(base).\(IGDBConstant.PlatformVersionCompany.company)"
        static let developer = "\(base).\(IGDBConstant.PlatformVersionCompany.developer)"
        static let manufacturer = "\(base).\(IGDBConstant.PlatformVersionCompany.manufacturer)"
    }
    struct PlatformVersionReleaseDate {
        static private let base = (IGDBConstant.PlatformVersionReleaseDate._base)
        static let all = "\(base).*"
        static let category = "\(base).\(IGDBConstant.PlatformVersionReleaseDate.category)"
        static let checksum = "\(base).\(IGDBConstant.PlatformVersionReleaseDate.checksum)"
        static let createdAt = "\(base).\(IGDBConstant.PlatformVersionReleaseDate.createdAt)"
        static let date = "\(base).\(IGDBConstant.PlatformVersionReleaseDate.date)"
        static let human = "\(base).\(IGDBConstant.PlatformVersionReleaseDate.human)"
        static let month = "\(base).\(IGDBConstant.PlatformVersionReleaseDate.month)"
        static let platformVersion = "\(base).\(IGDBConstant.PlatformVersionReleaseDate.platformVersion)"
        static let region = "\(base).\(IGDBConstant.PlatformVersionReleaseDate.region)"
        static let updatedAt = "\(base).\(IGDBConstant.PlatformVersionReleaseDate.updatedAt)"
        static let year = "\(base).\(IGDBConstant.PlatformVersionReleaseDate.year   )"
    }
    struct PlatformWebsite {
        static private let base = (IGDBConstant.PlatformWebsite._base)
        static let all = "\(base).*"
        static let category = "\(base).\(IGDBConstant.PlatformWebsite.category)"
        static let checksum = "\(base).\(IGDBConstant.PlatformWebsite.checksum)"
        static let trusted = "\(base).\(IGDBConstant.PlatformWebsite.trusted)"
        static let url = "\(base).\(IGDBConstant.PlatformWebsite.url)"
    }
    struct PlayerPerspective {
        static private let base = (IGDBConstant.PlayerPerspective._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(IGDBConstant.PlayerPerspective.checksum)"
        static let createdAt = "\(base).\(IGDBConstant.PlayerPerspective.createdAt)"
        static let name = "\(base).\(IGDBConstant.PlayerPerspective.name)"
        static let slug = "\(base).\(IGDBConstant.PlayerPerspective.slug)"
        static let updatedAt = "\(base).\(IGDBConstant.PlayerPerspective.updatedAt)"
        static let url = "\(base).\(IGDBConstant.PlayerPerspective.url)"
    }
    struct ReleaseDate {
        static private let base = (IGDBConstant.ReleaseDate._base)
        static let all = "\(base).*"
        static let category = "\(base).\(IGDBConstant.ReleaseDate.category)"
        static let checksum = "\(base).\(IGDBConstant.ReleaseDate.checksum)"
        static let createdAt = "\(base).\(IGDBConstant.ReleaseDate.createdAt)"
        static let date = "\(base).\(IGDBConstant.ReleaseDate.date)"
        static let game = "\(base).\(IGDBConstant.ReleaseDate.game)"
        static let human = "\(base).\(IGDBConstant.ReleaseDate.human)"
        static let month = "\(base).\(IGDBConstant.ReleaseDate.month)"
        static let platform = "\(base).\(IGDBConstant.ReleaseDate.platform)"
        static let region = "\(base).\(IGDBConstant.ReleaseDate.region)"
        static let updatedAt = "\(base).\(IGDBConstant.ReleaseDate.updatedAt)"
        static let year = "\(base).\(IGDBConstant.ReleaseDate.year)"
    }
    struct Screenshot {
        static private let base = (IGDBConstant.Screenshot._base)
        static let all = "\(base).*"
        static let alphaChannel = "\(base).\(IGDBConstant.Screenshot.alphaChannel)"
        static let animated = "\(base).\(IGDBConstant.Screenshot.animated)"
        static let checksum = "\(base).\(IGDBConstant.Screenshot.checksum)"
        static let game = "\(base).\(IGDBConstant.Screenshot.game)"
        static let height = "\(base).\(IGDBConstant.Screenshot.height)"
        static let imageId = "\(base).\(IGDBConstant.Screenshot.imageId)"
        static let url = "\(base).\(IGDBConstant.Screenshot.url)"
        static let width = "\(base).\(IGDBConstant.Screenshot.width)"
    }
    struct Search {
        static private let base = (IGDBConstant.Search._base)
        static let all = "\(base).*"
        static let alternativeName = "\(base).\(IGDBConstant.Search.alternativeName)"
        static let character = "\(base).\(IGDBConstant.Search.character)"
        static let checksum = "\(base).\(IGDBConstant.Search.checksum)"
        static let collection = "\(base).\(IGDBConstant.Search.collection)"
        static let company = "\(base).\(IGDBConstant.Search.company)"
        static let description = "\(base).\(IGDBConstant.Search.description)"
        static let game = "\(base).\(IGDBConstant.Search.game)"
        static let name = "\(base).\(IGDBConstant.Search.name)"
        static let platform = "\(base).\(IGDBConstant.Search.platform)"
        static let publishedAt = "\(base).\(IGDBConstant.Search.publishedAt)"
        static let testDummy = "\(base).\(IGDBConstant.Search.testDummy)"
        static let theme = "\(base).\(IGDBConstant.Search.theme)"
    }
    struct Theme {
        static private let base = (IGDBConstant.Theme._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(IGDBConstant.Theme.checksum)"
        static let createdAt = "\(base).\(IGDBConstant.Theme.createdAt)"
        static let name = "\(base).\(IGDBConstant.Theme.name)"
        static let slug = "\(base).\(IGDBConstant.Theme.slug)"
        static let updatedAt = "\(base).\(IGDBConstant.Theme.updatedAt)"
        static let url = "\(base).\(IGDBConstant.Theme.url)"
    }
    struct Website {
        static private let base = (IGDBConstant.Website._base)
        static let all = "\(base).*"
        static let category = "\(base).\(IGDBConstant.Website.category)"
        static let checksum = "\(base).\(IGDBConstant.Website.checksum)"
        static let game = "\(base).\(IGDBConstant.Website.game)"
        static let trusted = "\(base).\(IGDBConstant.Website.trusted)"
        static let url = "\(base).\(IGDBConstant.Website.url)"
    }
}


