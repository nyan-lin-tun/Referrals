import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Referrals"

    var body: some HTML {
        Text("Referral Links")
            .font(.title1)

        List {
            Link("Google AI Pro", target: "https://g.co/g1referral/CKL6SHJK")
                .target(.blank)
            Link("Warp", target: "https://app.warp.dev/referral/7P3R93")
                .target(.blank)
            Link("Wise", target: "https://wise.com/invite/ihpc/nyant5")
                .target(.blank)
            Link("Wirex", target: "https://wirexapp.com/r/nyanlintun")
                .target(.blank)
            Link("Revolut", target: "https://revolut.com/referral/?referral-code=nyanu2efp!JUN2-25-AR&geo-redirect")
                .target(.blank)
        }
    }
}
