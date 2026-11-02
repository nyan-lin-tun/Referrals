import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() async throws {
        let categories = try ReferralCategory.load()
        var site = ReferralsSite(homePage: Home(categories: categories))

        try await site.publish()
    }
}

struct ReferralsSite: Site {
    var name = "Nyan's Referrals"
    var titleSuffix = ""
    var url = URL(static: "https://nyanlintun.me/Referrals")
    var builtInIconsEnabled = true
    var author = "Nyan Lin Tun"

    var homePage: Home
    var layout = MainLayout()
}
