import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Nyan's Referrals"
    var categories: [ReferralCategory]

    var body: some HTML {
        ForEach(categories) { category in
            Text(category.title)
                .font(.title3)
                .class("referral-heading")
            List(category.links) { referral in
                Link(referral.title, target: referral.url)
                    .target(.blank)
            }
            .class("referral-list")
        }
    }
}
