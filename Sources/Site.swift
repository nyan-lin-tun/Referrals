import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() async {
        var site = ReferralsSite()

        do {
            try await site.publish()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ReferralsSite: Site {
    var name = "Referrals"
    var titleSuffix = " – Nyan Lin Tun"
    var url = URL(static: "https://nyanlintun.me/Referrals")
    var builtInIconsEnabled = true
    var author = "Nyan Lin Tun"

    var homePage = Home()
    var layout = MainLayout()
}
