import Foundation

// highs, lows, precip inches, date, sunrise, sunset, windspeed


// MARK: - Welcome
struct Welcome: Codable {
    let latitude: Double
    let longitude: Double
    let timezone: String
    let currently: Currently
    let minutely: Minutely
    let hourly: Hourly
    let daily: Daily
    let alerts: [Alert]
    let flags: Flags
    let offset: Int
}

// MARK: - Alert
struct Alert: Codable {
    let title: String
    let regions: [String]
    let severity: String
    let time, expires: Int
    let alertDescription: String
    let uri: String

    enum CodingKeys: String, CodingKey {
        case title, regions, severity, time, expires
        case alertDescription = "description"
        case uri
    }
}

// MARK: - Currently
struct Currently: Codable {
    let time: Int
    let summary: Summary
    let icon: Icon
    let nearestStormDistance: Int?
    let nearestStormBearing: Int?
    let precipIntensity, precipProbability, temperature, apparentTemperature: Double
    let dewPoint: Double
    let humidity: Double
    let pressure: Double
    let windSpeed: Double
//    let windGust: Double
//    let windBearing: Int
//    let cloudCover: Double
    let uvIndex: Int
    let visibility, ozone: Double
    let precipType: PrecipType?
}

enum Icon: String, Codable {
    case clearDay = "clear-day"
    case clearNight = "clear-night"
    case cloudy = "cloudy"
    case partlyCloudyDay = "partly-cloudy-day"
    case partlyCloudyNight = "partly-cloudy-night"
}

enum PrecipType: String, Codable {
    case rain = "rain"
}

enum Summary: String, Codable {
    case clear = "Clear"
    case mostlyCloudy = "Mostly Cloudy"
    case overcast = "Overcast"
    case partlyCloudy = "Partly Cloudy"
}

// MARK: - Daily
struct Daily: Codable {
    let summary: String
    let icon: Icon
    let data: [DailyDatum]
}

// MARK: - DailyDatum
struct DailyDatum: Codable {
    let time: Int
    let summary: String
    let icon: Icon
    let sunriseTime, sunsetTime: Int
    let moonPhase, precipIntensity, precipIntensityMax: Double
    let precipIntensityMaxTime: Int
    let precipProbability: Double
    let precipType: PrecipType?
    let temperatureHigh: Double
    let temperatureHighTime: Int
    let temperatureLow: Double
    let temperatureLowTime: Int
//    let apparentTemperatureHigh: Double
//    let apparentTemperatureHighTime: Int
//    let apparentTemperatureLow: Double
//    let apparentTemperatureLowTime: Int
//    let dewPoint: Double
//    let humidity: Double
//    let pressure: Double
    let windSpeed: Double
//    let windGust: Double
//    let windGustTime, windBearing: Int
//    let cloudCover: Double
//    let uvIndex, uvIndexTime: Int
//    let visibility, ozone, temperatureMin: Double
    let temperatureMinTime: Int
    let temperatureMax: Double
    let temperatureMaxTime: Int
    let apparentTemperatureMin: Double
    let apparentTemperatureMinTime: Int
    let apparentTemperatureMax: Double
    let apparentTemperatureMaxTime: Int
}

// MARK: - Flags
//struct Flags: Codable {
//    let sources: [String]
//    let nearestStation: Double
//    let units: String
//
//    enum CodingKeys: String, CodingKey {
//        case sources
//        case nearestStation = "nearest-station"
//        case units
//    }
//}

// MARK: - Hourly
//struct Hourly: Codable {
//    let summary: String
//    let icon: Icon
//    let data: [Currently]
//}

// MARK: - Minutely
//struct Minutely: Codable {
//    let summary: String
//    let icon: Icon
//    let data: [MinutelyDatum]
//}

// MARK: - MinutelyDatum
//struct MinutelyDatum: Codable {
//    let time: Int
//    let precipIntensity: Double
//    let precipProbability: Double
//    let precipIntensityError: Double?
//    let precipType: PrecipType?
//}
