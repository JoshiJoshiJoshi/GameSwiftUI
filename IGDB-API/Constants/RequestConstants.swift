//
//  RequestConstants.swift
//  GameSwiftUI
//
//  Created by Joshi on 07.04.21.
//

import Foundation

enum RequestMethod: String {
    case GET = "GET"
    case POST = "POST"
}

struct RequestEndpoints {
    static let games = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.Game._base)"
    
    static let ageRatings = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.AgeRating._base)"
    static let ageRatingContentDescriptions = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.AgeRatingContentDescription._base)"
    static let alternativeNames = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.AlternativeName._base)"
    static let artworks = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.Artwork._base)"
    static let characters = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.Character._base)"
    static let characterMugShots = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.CharacterMugShot._base)"
    static let collections = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.Collection._base)"
    static let companies = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.Company._base)"
    static let companyLogos = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.CompanyLogo._base)"
    static let companyWebsites = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.CompanyWebsite._base)"
    static let covers = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.Cover._base)"
    static let externalGames = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.ExternalGame._base)"
    static let franchises = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.Franchise._base)"
    static let gameEngines = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.GameEngine._base)"
    static let gameEngineLogos = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.GameEngineLogo._base)"
    static let gameModes = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.GameMode._base)"
    static let gameVersions = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.GameVersion._base)"
    static let gameVersionFeatures = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.GameVersionFeature._base)"
    static let gameVersionFeatureValues = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.GameVersionFeatureValue._base)"
    static let gameVideos = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.GameVideo._base)"
    static let genres = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.Genre._base)"
    static let involvedCompanies = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.InvolvedCompany._base)"
    static let keywords = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.Keyword._base)"
    static let multiplayerModes = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.MultiplayerMode._base)"
    static let platforms = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.Platform._base)"
    static let platformFamilies = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.PlatformFamily._base)"
    static let platformVersions = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.PlatformVersion._base)"
    static let platformVersionCompanies = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.PlatformVersionCompany._base)"
    static let platformVersionReleaseDates = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.PlatformVersionReleaseDate._base)"
    static let platformWebsites = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.PlatformWebsite._base)"
    static let playerPerspectives = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.PlayerPerspective._base)"
    static let release_dates = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.ReleaseDate._base)"
    static let screenshots = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.Screenshot._base)"
    static let search = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.Search._base)"
    static let themes = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.Theme._base)"
    static let websites = "/\(IGDBConfig.currentApiVersion)/\(APIConstants.Website._base)"
}

// Resources:
// Adding Placeholders: https://www.informit.com/articles/article.aspx?p=1914191&seqNum=3
// Example:
// static private let base = "<#name#>"
// static let all = "\(base).*"
// static let <#name#> = "\(base).<#name#>"

struct RequestConstants {
    struct AgeRating {
        static private let base = (APIConstants.AgeRating._base)
        static let all = "\(base).*"
        static let category = "\(base).\(APIConstants.AgeRating.category)"
        static let checksum = "\(base).\(APIConstants.AgeRating.checksum)"
        static let contentDescriptions = "\(base).\(APIConstants.AgeRating.contentDescriptions)"
        static let rating = "\(base).\(APIConstants.AgeRating.rating)"
        static let ratingCoverUrl = "\(base).\(APIConstants.AgeRating.ratingCoverUrl)"
        static let synopsis = "\(base).\(APIConstants.AgeRating.synopsis)"
    }
    
    struct AgeRatingContentDescription {
        static private let base = (APIConstants.AgeRatingContentDescription._base)
        static let all = "\(base).*"
        static let category = "\(base).\(APIConstants.AgeRatingContentDescription.category)"
        static let checksum = "\(base).\(APIConstants.AgeRatingContentDescription.checksum)"
        static let description = "\(base).\(APIConstants.AgeRatingContentDescription.description)"
    }
    
    struct AlternativeName {
        static private let base = (APIConstants.AlternativeName._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(APIConstants.AlternativeName.checksum)"
        static let comment = "\(base).\(APIConstants.AlternativeName.comment)"
        static let game = "\(base).\(APIConstants.AlternativeName.game)"
        static let name = "\(base).\(APIConstants.AlternativeName.name)"
    }
    struct Artwork {
        static private let base = (APIConstants.Artwork._base)
        static let all = "\(base).*"
        static let alphaChannel = "\(base).\(APIConstants.Artwork.alphaChannel)"
        static let animated = "\(base).\(APIConstants.Artwork.animated)"
        static let checksum = "\(base).\(APIConstants.Artwork.checksum)"
        static let game = "\(base).\(APIConstants.Artwork.game)"
        static let height = "\(base).\(APIConstants.Artwork.height)"
        static let imageId = "\(base).\(APIConstants.Artwork.imageId)"
        static let url = "\(base).\(APIConstants.Artwork.url)"
        static let width = "\(base).\(APIConstants.Artwork.width)"
    }
    struct Character {
        static private let base = (APIConstants.Character._base)
        static let all = "\(base).*"
        static let akas = "\(base).\(APIConstants.Character.akas)"
        static let checksum = "\(base).\(APIConstants.Character.checksum)"
        static let countryName = "\(base).\(APIConstants.Character.countryName)"
        static let createdAt = "\(base).\(APIConstants.Character.createdAt)"
        static let description = "\(base).\(APIConstants.Character.description)"
        static let games = "\(base).\(APIConstants.Character.games)"
        static let gender = "\(base).\(APIConstants.Character.gender)"
        static let mugShot = "\(base).\(APIConstants.Character.mugShot)"
        static let name = "\(base).\(APIConstants.Character.name)"
        static let slug = "\(base).\(APIConstants.Character.slug)"
        static let species = "\(base).\(APIConstants.Character.species)"
        static let updatedAt = "\(base).\(APIConstants.Character.updatedAt)"
        static let url = "\(base).\(APIConstants.Character.url)"
    }
    struct CharacterMugShot {
        static private let base = (APIConstants.CharacterMugShot._base)
        static let all = "\(base).*"
        static let alphaChannel = "\(base).\(APIConstants.CharacterMugShot.alphaChannel)"
        static let animated = "\(base).\(APIConstants.CharacterMugShot.animated)"
        static let checksum = "\(base).\(APIConstants.CharacterMugShot.checksum)"
        static let height = "\(base).\(APIConstants.CharacterMugShot.height)"
        static let imageId = "\(base).\(APIConstants.CharacterMugShot.imageId)"
        static let url = "\(base).\(APIConstants.CharacterMugShot.url)"
        static let width = "\(base).\(APIConstants.CharacterMugShot.width)"
    }
    struct Collection {
        static private let base = (APIConstants.Collection._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(APIConstants.Collection.checksum)"
        static let createdAt = "\(base).\(APIConstants.Collection.createdAt)"
        static let games = "\(base).\(APIConstants.Collection.games)"
        static let name = "\(base).\(APIConstants.Collection.name)"
        static let slug = "\(base).\(APIConstants.Collection.slug)"
        static let updatedAt = "\(base).\(APIConstants.Collection.updatedAt)"
        static let url = "\(base).\(APIConstants.Collection.url)"
    }
    struct Company {
        static private let base = (APIConstants.Company._base)
        static let all = "\(base).*"
        static let changeDate = "\(base).\(APIConstants.Company.changeDate)"
        static let changeDateCategory = "\(base).\(APIConstants.Company.changeDateCategory)"
        static let changedCompanyId = "\(base).\(APIConstants.Company.changedCompanyId)"
        static let checksum = "\(base).\(APIConstants.Company.checksum)"
        static let country = "\(base).\(APIConstants.Company.country)"
        static let createdAt = "\(base).\(APIConstants.Company.createdAt)"
        static let description = "\(base).\(APIConstants.Company.description)"
        static let developed = "\(base).\(APIConstants.Company.developed)"
        static let logo = "\(base).\(APIConstants.Company.logo)"
        static let name = "\(base).\(APIConstants.Company.name)"
        static let parent = "\(base).\(APIConstants.Company.parent)"
        static let published = "\(base).\(APIConstants.Company.published)"
        static let slug = "\(base).\(APIConstants.Company.slug)"
        static let startDate = "\(base).\(APIConstants.Company.startDate)"
        static let startDateCategory = "\(base).\(APIConstants.Company.startDateCategory)"
        static let updatedAt = "\(base).\(APIConstants.Company.updatedAt)"
        static let url = "\(base).\(APIConstants.Company.url)"
        static let websites = "\(base).\(APIConstants.Company.websites)"
    }
    struct CompanyLogo {
        static private let base = (APIConstants.CompanyLogo._base)
        static let all = "\(base).*"
        static let alphaChannel = "\(base).\(APIConstants.CompanyLogo.alphaChannel)"
        static let animated = "\(base).\(APIConstants.CompanyLogo.animated)"
        static let checksum = "\(base).\(APIConstants.CompanyLogo.checksum)"
        static let height = "\(base).\(APIConstants.CompanyLogo.height)"
        static let imageId = "\(base).\(APIConstants.CompanyLogo.imageId)"
        static let url = "\(base).\(APIConstants.CompanyLogo.url)"
        static let width = "\(base).\(APIConstants.CompanyLogo.width)"
    }
    struct CompanyWebsite {
        static private let base = (APIConstants.CompanyWebsite._base)
        static let all = "\(base).*"
        static let category = "\(base).\(APIConstants.CompanyWebsite.category)"
        static let checksum = "\(base).\(APIConstants.CompanyWebsite.checksum)"
        static let trusted = "\(base).\(APIConstants.CompanyWebsite.trusted)"
        static let url = "\(base).\(APIConstants.CompanyWebsite.url)"
    }
    struct Cover {
        static private let base = (APIConstants.Cover._base)
        static let all = "\(base).*"
        static let alphaChannel = "\(base).\(APIConstants.Cover.alphaChannel)"
        static let animated = "\(base).\(APIConstants.Cover.animated)"
        static let checksum = "\(base).\(APIConstants.Cover.checksum)"
        static let game = "\(base).\(APIConstants.Cover.game)"
        static let height = "\(base).\(APIConstants.Cover.height)"
        static let imageId = "\(base).\(APIConstants.Cover.imageId)"
        static let url = "\(base).\(APIConstants.Cover.url)"
        static let width = "\(base).\(APIConstants.Cover.width)"
    }
    struct ExternalGame {
        static private let base = (APIConstants.ExternalGame._base)
        static let all = "\(base).*"
        static let category = "\(base).\(APIConstants.ExternalGame.category)"
        static let checksum = "\(base).\(APIConstants.ExternalGame.checksum)"
        static let countries = "\(base).\(APIConstants.ExternalGame.countries)"
        static let createdAt = "\(base).\(APIConstants.ExternalGame.createdAt)"
        static let game = "\(base).\(APIConstants.ExternalGame.game)"
        static let media = "\(base).\(APIConstants.ExternalGame.media)"
        static let name = "\(base).\(APIConstants.ExternalGame.name)"
        static let platform = "\(base).\(APIConstants.ExternalGame.platform)"
        static let uid = "\(base).\(APIConstants.ExternalGame.uid)"
        static let updatedAt = "\(base).\(APIConstants.ExternalGame.updatedAt)"
        static let url = "\(base).\(APIConstants.ExternalGame.url)"
        static let year = "\(base).\(APIConstants.ExternalGame.year)"
    }
    
    struct Franchise {
        static private let base = (APIConstants.Franchise._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(APIConstants.Franchise.checksum)"
        static let createdAt = "\(base).\(APIConstants.Franchise.createdAt)"
        static let games = "\(base).\(APIConstants.Franchise.games)"
        static let name = "\(base).\(APIConstants.Franchise.name)"
        static let slug = "\(base).\(APIConstants.Franchise.slug)"
        static let updatedAt = "\(base).\(APIConstants.Franchise.updatedAt)"
        static let url = "\(base).\(APIConstants.Franchise.url)"
    }
    
    struct Game {
        static let all = "*"
        static let ageRatings = (APIConstants.Game.ageRatings)
        static let aggregatedRating = (APIConstants.Game.aggregatedRating)
        static let aggregatedRatingCount = (APIConstants.Game.aggregatedRatingCount)
        static let alternativeNames = (APIConstants.Game.alternativeNames)
        static let artworks = (APIConstants.Game.artworks)
        static let bundles = (APIConstants.Game.bundles)
        static let category = (APIConstants.Game.category)
        static let checksum = (APIConstants.Game.checksum)
        static let collection = (APIConstants.Game.collection)
        static let cover = (APIConstants.Game.cover)
        static let createdAt = (APIConstants.Game.createdAt)
        static let dlcs = (APIConstants.Game.dlcs)
        static let expandedGames = (APIConstants.Game.expandedGames)
        static let expansions = (APIConstants.Game.expansions)
        static let externalGames = (APIConstants.Game.externalGames)
        static let firstReleaseDate = (APIConstants.Game.firstReleaseDate)
        static let follows = (APIConstants.Game.follows)
        static let forks = (APIConstants.Game.forks)
        static let franchise = (APIConstants.Game.franchise)
        static let franchises = (APIConstants.Game.franchises)
        static let gameEngines = (APIConstants.Game.gameEngines)
        static let gameModes = (APIConstants.Game.gameModes)
        static let genres = (APIConstants.Game.genres)
        static let hypes = (APIConstants.Game.hypes)
        static let involvedCompanies = (APIConstants.Game.involvedCompanies)
        static let keywords = (APIConstants.Game.keywords)
        static let multiplayerModes = (APIConstants.Game.multiplayerModes)
        static let name = (APIConstants.Game.name)
        static let parentGame = (APIConstants.Game.parentGame)
        static let platforms = (APIConstants.Game.platforms)
        static let playerPerspectives = (APIConstants.Game.playerPerspectives)
        static let ports = (APIConstants.Game.ports)
        static let rating = (APIConstants.Game.rating)
        static let ratingCount = (APIConstants.Game.ratingCount)
        static let releaseDates = (APIConstants.Game.releaseDates)
        static let remakes = (APIConstants.Game.remakes)
        static let remasters = (APIConstants.Game.remasters)
        static let screenshots = (APIConstants.Game.screenshots)
        static let similarGames = (APIConstants.Game.similarGames)
        static let slug = (APIConstants.Game.slug)
        static let standaloneExpansions = (APIConstants.Game.standaloneExpansions)
        static let status = (APIConstants.Game.status)
        static let storyline = (APIConstants.Game.storyline)
        static let summary = (APIConstants.Game.summary)
        static let tags = (APIConstants.Game.tags)
        static let themes = (APIConstants.Game.themes)
        static let totalRating = (APIConstants.Game.totalRating)
        static let totalRatingCount = (APIConstants.Game.totalRatingCount)
        static let updatedAt = (APIConstants.Game.updatedAt)
        static let url = (APIConstants.Game.url)
        static let versionParent = (APIConstants.Game.versionParent)
        static let versionTitle = (APIConstants.Game.versionTitle)
        static let videos = (APIConstants.Game.videos)
        static let websites = (APIConstants.Game.websites)
    }
    struct GameEngine {
        static private let base = (APIConstants.GameEngine._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(APIConstants.GameEngine.checksum)"
        static let companies = "\(base).\(APIConstants.GameEngine.companies)"
        static let createdAt = "\(base).\(APIConstants.GameEngine.createdAt)"
        static let description = "\(base).\(APIConstants.GameEngine.description)"
        static let logo = "\(base).\(APIConstants.GameEngine.logo)"
        static let name = "\(base).\(APIConstants.GameEngine.name)"
        static let platforms = "\(base).\(APIConstants.GameEngine.platforms)"
        static let slug = "\(base).\(APIConstants.GameEngine.slug)"
        static let updatedAt = "\(base).\(APIConstants.GameEngine.updatedAt)"
        static let url = "\(base).\(APIConstants.GameEngine.url)"
    }
    
    struct GameEngineLogo {
        static private let base = (APIConstants.GameEngineLogo._base)
        static let all = "\(base).*"
        static let alphaChannel = "\(base).\(APIConstants.GameEngineLogo.alphaChannel)"
        static let animated = "\(base).\(APIConstants.GameEngineLogo.animated)"
        static let checksum = "\(base).\(APIConstants.GameEngineLogo.checksum)"
        static let game = "\(base).\(APIConstants.GameEngineLogo.game)"
        static let height = "\(base).\(APIConstants.GameEngineLogo.height)"
        static let imageId = "\(base).\(APIConstants.GameEngineLogo.imageId)"
        static let url = "\(base).\(APIConstants.GameEngineLogo.url)"
        static let width = "\(base).\(APIConstants.GameEngineLogo.width)"
    }
    struct GameMode {
        static private let base = (APIConstants.GameMode._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(APIConstants.GameMode.checksum)"
        static let createdAt = "\(base).\(APIConstants.GameMode.createdAt)"
        static let name = "\(base).\(APIConstants.GameMode.name)"
        static let slug = "\(base).\(APIConstants.GameMode.slug)"
        static let updatedAt = "\(base).\(APIConstants.GameMode.updatedAt)"
        static let url = "\(base).\(APIConstants.GameMode.url)"
    }
    struct GameVersion {
        static private let base = (APIConstants.GameVersion._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(APIConstants.GameVersion.checksum)"
        static let createdAt = "\(base).\(APIConstants.GameVersion.createdAt)"
        static let features = "\(base).\(APIConstants.GameVersion.features)"
        static let game = "\(base).\(APIConstants.GameVersion.game)"
        static let games = "\(base).\(APIConstants.GameVersion.games)"
        static let updatedAt = "\(base).\(APIConstants.GameVersion.updatedAt)"
        static let url = "\(base).\(APIConstants.GameVersion.url)"
    }
    struct GameVersionFeature {
        static private let base = (APIConstants.GameVersionFeature._base)
        static let all = "\(base).*"
        static let category = "\(base).\(APIConstants.GameVersionFeature.category)"
        static let checksum = "\(base).\(APIConstants.GameVersionFeature.checksum)"
        static let description = "\(base).\(APIConstants.GameVersionFeature.description)"
        static let position = "\(base).\(APIConstants.GameVersionFeature.position)"
        static let title = "\(base).\(APIConstants.GameVersionFeature.title)"
        static let values = "\(base).\(APIConstants.GameVersionFeature.values)"
    }
    struct GameVersionFeatureValue {
        static private let base = (APIConstants.GameVersionFeatureValue._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(APIConstants.GameVersionFeatureValue.checksum)"
        static let game = "\(base).\(APIConstants.GameVersionFeatureValue.game)"
        static let gameFeature = "\(base).\(APIConstants.GameVersionFeatureValue.gameFeature)"
        static let includedFeature = "\(base).\(APIConstants.GameVersionFeatureValue.includedFeature)"
        static let note = "\(base).\(APIConstants.GameVersionFeatureValue.note)"
    }
    struct GameVideo {
        static private let base = (APIConstants.GameVideo._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(APIConstants.GameVideo.checksum)"
        static let name = "\(base).\(APIConstants.GameVideo.name)"
        static let videoId = "\(base).\(APIConstants.GameVideo.videoId)"
    }
    struct Genre {
        static private let base = (APIConstants.Genre._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(APIConstants.Genre.checksum)"
        static let createdAt = "\(base).\(APIConstants.Genre.createdAt)"
        static let name = "\(base).\(APIConstants.Genre.name)"
        static let slug = "\(base).\(APIConstants.Genre.slug)"
        static let updatedAt = "\(base).\(APIConstants.Genre.updatedAt)"
        static let url = "\(base).\(APIConstants.Genre.url)"
    }
    struct InvolvedCompany {
        static private let base = (APIConstants.InvolvedCompany._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(APIConstants.InvolvedCompany.checksum)"
        static let company = "\(base).\(APIConstants.InvolvedCompany.company)"
        static let createdAt = "\(base).\(APIConstants.InvolvedCompany.createdAt)"
        static let developer = "\(base).\(APIConstants.InvolvedCompany.developer)"
        static let game = "\(base).\(APIConstants.InvolvedCompany.game)"
        static let porting = "\(base).\(APIConstants.InvolvedCompany.porting)"
        static let publisher = "\(base).\(APIConstants.InvolvedCompany.publisher)"
        static let supporting = "\(base).\(APIConstants.InvolvedCompany.supporting)"
        static let updatedAt = "\(base).\(APIConstants.InvolvedCompany.updatedAt)"
    }
    struct Keyword {
        static private let base = (APIConstants.Keyword._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(APIConstants.Keyword.checksum)"
        static let createdAt = "\(base).\(APIConstants.Keyword.createdAt)"
        static let name = "\(base).\(APIConstants.Keyword.name)"
        static let slug = "\(base).\(APIConstants.Keyword.slug)"
        static let updatedAt = "\(base).\(APIConstants.Keyword.updatedAt)"
        static let url = "\(base).\(APIConstants.Keyword.url)"
    }
    struct MultiplayerMode {
        static private let base = (APIConstants.MultiplayerMode._base)
        static let all = "\(base).*"
        static let campaignCoop = "\(base).\(APIConstants.MultiplayerMode.campaignCoop)"
        static let checksum = "\(base).\(APIConstants.MultiplayerMode.checksum)"
        static let dropIn = "\(base).\(APIConstants.MultiplayerMode.dropIn)"
        static let game = "\(base).\(APIConstants.MultiplayerMode.game)"
        static let lanCoop = "\(base).\(APIConstants.MultiplayerMode.lanCoop)"
        static let offlineCoop = "\(base).\(APIConstants.MultiplayerMode.offlineCoop)"
        static let offlineCoopMax = "\(base).\(APIConstants.MultiplayerMode.offlineCoopMax)"
        static let offlineMax = "\(base).\(APIConstants.MultiplayerMode.offlineMax)"
        static let platform = "\(base).\(APIConstants.MultiplayerMode.platform)"
        static let splitscreen = "\(base).\(APIConstants.MultiplayerMode.splitscreen)"
        static let splitscreenOnline = "\(base).\(APIConstants.MultiplayerMode.splitscreenOnline)"
    }
    struct Platform {
        static private let base = (APIConstants.Platform._base)
        static let all = "\(base).*"
        static let abbreviation = "\(base).\(APIConstants.Platform.abbreviation)"
        static let alternativeName = "\(base).\(APIConstants.Platform.alternativeName)"
        static let category = "\(base).\(APIConstants.Platform.category)"
        static let checksum = "\(base).\(APIConstants.Platform.checksum)"
        static let createdAt = "\(base).\(APIConstants.Platform.createdAt)"
        static let generation = "\(base).\(APIConstants.Platform.generation)"
        static let name = "\(base).\(APIConstants.Platform.name)"
        static let platformFamily = "\(base).\(APIConstants.Platform.platformFamily)"
        static let platformLogo = "\(base).\(APIConstants.Platform.platformLogo)"
        static let slug = "\(base).\(APIConstants.Platform.slug)"
        static let summary = "\(base).\(APIConstants.Platform.summary)"
        static let updatedAt = "\(base).\(APIConstants.Platform.updatedAt)"
        static let url = "\(base).\(APIConstants.Platform.url)"
        static let versions = "\(base).\(APIConstants.Platform.versions)"
        static let websites = "\(base).\(APIConstants.Platform.websites)"
    }
    struct PlatformFamily {
        static private let base = (APIConstants.PlatformFamily._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(APIConstants.PlatformFamily.checksum)"
        static let name = "\(base).\(APIConstants.PlatformFamily.name)"
        static let slug = "\(base).\(APIConstants.PlatformFamily.slug)"
    }
    struct PlatformLogo {
        static private let base = (APIConstants.PlatformLogo._base)
        static let all = "\(base).*"
        static let alphaChannel = "\(base).\(APIConstants.PlatformLogo.alphaChannel)"
        static let animated = "\(base).\(APIConstants.PlatformLogo.animated)"
        static let checksum = "\(base).\(APIConstants.PlatformLogo.checksum)"
        static let game = "\(base).\(APIConstants.PlatformLogo.game)"
        static let height = "\(base).\(APIConstants.PlatformLogo.height)"
        static let imageId = "\(base).\(APIConstants.PlatformLogo.imageId)"
        static let url = "\(base).\(APIConstants.PlatformLogo.url)"
        static let width = "\(base).\(APIConstants.PlatformLogo.width)"
    }
    struct PlatformVersion {
        static private let base = (APIConstants.PlatformVersion._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(APIConstants.PlatformVersion.checksum)"
        static let companies = "\(base).\(APIConstants.PlatformVersion.companies)"
        static let connectivity = "\(base).\(APIConstants.PlatformVersion.connectivity)"
        static let cpu = "\(base).\(APIConstants.PlatformVersion.cpu)"
        static let graphics = "\(base).\(APIConstants.PlatformVersion.graphics)"
        static let mainManufacturer = "\(base).\(APIConstants.PlatformVersion.mainManufacturer)"
        static let media = "\(base).\(APIConstants.PlatformVersion.media)"
        static let memory = "\(base).\(APIConstants.PlatformVersion.memory)"
        static let name = "\(base).\(APIConstants.PlatformVersion.name)"
        static let os = "\(base).\(APIConstants.PlatformVersion.os)"
        static let output = "\(base).\(APIConstants.PlatformVersion.output)"
        static let platformLogo = "\(base).\(APIConstants.PlatformVersion.platformLogo)"
        static let platformVersionReleaseDates = "\(base).\(APIConstants.PlatformVersion.platformVersionReleaseDates)"
        static let resolutions = "\(base).\(APIConstants.PlatformVersion.resolutions)"
        static let slug = "\(base).\(APIConstants.PlatformVersion.slug)"
        static let sound = "\(base).\(APIConstants.PlatformVersion.sound)"
        static let storage = "\(base).\(APIConstants.PlatformVersion.storage)"
        static let summary = "\(base).\(APIConstants.PlatformVersion.summary)"
        static let url = "\(base).\(APIConstants.PlatformVersion.url)"
    }
    struct PlatformVersionCompany {
        static private let base = (APIConstants.PlatformVersionCompany._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(APIConstants.PlatformVersionCompany.checksum)"
        static let comment = "\(base).\(APIConstants.PlatformVersionCompany.comment)"
        static let company = "\(base).\(APIConstants.PlatformVersionCompany.company)"
        static let developer = "\(base).\(APIConstants.PlatformVersionCompany.developer)"
        static let manufacturer = "\(base).\(APIConstants.PlatformVersionCompany.manufacturer)"
    }
    struct PlatformVersionReleaseDate {
        static private let base = (APIConstants.PlatformVersionReleaseDate._base)
        static let all = "\(base).*"
        static let category = "\(base).\(APIConstants.PlatformVersionReleaseDate.category)"
        static let checksum = "\(base).\(APIConstants.PlatformVersionReleaseDate.checksum)"
        static let createdAt = "\(base).\(APIConstants.PlatformVersionReleaseDate.createdAt)"
        static let date = "\(base).\(APIConstants.PlatformVersionReleaseDate.date)"
        static let human = "\(base).\(APIConstants.PlatformVersionReleaseDate.human)"
        static let month = "\(base).\(APIConstants.PlatformVersionReleaseDate.month)"
        static let platformVersion = "\(base).\(APIConstants.PlatformVersionReleaseDate.platformVersion)"
        static let region = "\(base).\(APIConstants.PlatformVersionReleaseDate.region)"
        static let updatedAt = "\(base).\(APIConstants.PlatformVersionReleaseDate.updatedAt)"
        static let year = "\(base).\(APIConstants.PlatformVersionReleaseDate.year   )"
    }
    struct PlatformWebsite {
        static private let base = (APIConstants.PlatformWebsite._base)
        static let all = "\(base).*"
        static let category = "\(base).\(APIConstants.PlatformWebsite.category)"
        static let checksum = "\(base).\(APIConstants.PlatformWebsite.checksum)"
        static let trusted = "\(base).\(APIConstants.PlatformWebsite.trusted)"
        static let url = "\(base).\(APIConstants.PlatformWebsite.url)"
    }
    struct PlayerPerspective {
        static private let base = (APIConstants.PlayerPerspective._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(APIConstants.PlayerPerspective.checksum)"
        static let createdAt = "\(base).\(APIConstants.PlayerPerspective.createdAt)"
        static let name = "\(base).\(APIConstants.PlayerPerspective.name)"
        static let slug = "\(base).\(APIConstants.PlayerPerspective.slug)"
        static let updatedAt = "\(base).\(APIConstants.PlayerPerspective.updatedAt)"
        static let url = "\(base).\(APIConstants.PlayerPerspective.url)"
    }
    struct ReleaseDate {
        static private let base = (APIConstants.ReleaseDate._base)
        static let all = "\(base).*"
        static let category = "\(base).\(APIConstants.ReleaseDate.category)"
        static let checksum = "\(base).\(APIConstants.ReleaseDate.checksum)"
        static let createdAt = "\(base).\(APIConstants.ReleaseDate.createdAt)"
        static let date = "\(base).\(APIConstants.ReleaseDate.date)"
        static let game = "\(base).\(APIConstants.ReleaseDate.game)"
        static let human = "\(base).\(APIConstants.ReleaseDate.human)"
        static let month = "\(base).\(APIConstants.ReleaseDate.month)"
        static let platform = "\(base).\(APIConstants.ReleaseDate.platform)"
        static let region = "\(base).\(APIConstants.ReleaseDate.region)"
        static let updatedAt = "\(base).\(APIConstants.ReleaseDate.updatedAt)"
        static let year = "\(base).\(APIConstants.ReleaseDate.year)"
    }
    struct Screenshot {
        static private let base = (APIConstants.Screenshot._base)
        static let all = "\(base).*"
        static let alphaChannel = "\(base).\(APIConstants.Screenshot.alphaChannel)"
        static let animated = "\(base).\(APIConstants.Screenshot.animated)"
        static let checksum = "\(base).\(APIConstants.Screenshot.checksum)"
        static let game = "\(base).\(APIConstants.Screenshot.game)"
        static let height = "\(base).\(APIConstants.Screenshot.height)"
        static let imageId = "\(base).\(APIConstants.Screenshot.imageId)"
        static let url = "\(base).\(APIConstants.Screenshot.url)"
        static let width = "\(base).\(APIConstants.Screenshot.width)"
    }
    struct Search {
        static private let base = (APIConstants.Search._base)
        static let all = "\(base).*"
        static let alternativeName = "\(base).\(APIConstants.Search.alternativeName)"
        static let character = "\(base).\(APIConstants.Search.character)"
        static let checksum = "\(base).\(APIConstants.Search.checksum)"
        static let collection = "\(base).\(APIConstants.Search.collection)"
        static let company = "\(base).\(APIConstants.Search.company)"
        static let description = "\(base).\(APIConstants.Search.description)"
        static let game = "\(base).\(APIConstants.Search.game)"
        static let name = "\(base).\(APIConstants.Search.name)"
        static let platform = "\(base).\(APIConstants.Search.platform)"
        static let publishedAt = "\(base).\(APIConstants.Search.publishedAt)"
        static let testDummy = "\(base).\(APIConstants.Search.testDummy)"
        static let theme = "\(base).\(APIConstants.Search.theme)"
    }
    struct Theme {
        static private let base = (APIConstants.Theme._base)
        static let all = "\(base).*"
        static let checksum = "\(base).\(APIConstants.Theme.checksum)"
        static let createdAt = "\(base).\(APIConstants.Theme.createdAt)"
        static let name = "\(base).\(APIConstants.Theme.name)"
        static let slug = "\(base).\(APIConstants.Theme.slug)"
        static let updatedAt = "\(base).\(APIConstants.Theme.updatedAt)"
        static let url = "\(base).\(APIConstants.Theme.url)"
    }
    struct Website {
        static private let base = (APIConstants.Website._base)
        static let all = "\(base).*"
        static let category = "\(base).\(APIConstants.Website.category)"
        static let checksum = "\(base).\(APIConstants.Website.checksum)"
        static let game = "\(base).\(APIConstants.Website.game)"
        static let trusted = "\(base).\(APIConstants.Website.trusted)"
        static let url = "\(base).\(APIConstants.Website.url)"
    }
}


