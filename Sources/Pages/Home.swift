import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Nyan's Referrals"

    var body: some HTML {
        List {
            Link("Google AI Pro", target: "https://g.co/g1referral/CKL6SHJK")
                .target(.blank)
            Link("Warp", target: "https://app.warp.dev/referral/7P3R93")
                .target(.blank)
            Link("Wise", target: "https://wise.com/invite/ihpc/nyant5")
                .target(.blank)
            Link("Wirex", target: "https://wirexapp.com/r/nyanlintun")
                .target(.blank)
            Link("Revolut", target: "https://revolut.com/referral/?referral-code=nyanu2efp!MAY1-26-VR-SG&geo-redirect")
                .target(.blank)
            Link("Syfe", target: "https://www.syfe.com/invite/trade/SRPS2ETNU")
                .target(.blank)
            Link("StashAway", target: "https://www.stashaway.sg/referrals/a7274688")
                .target(.blank)
            Link("Tiger Trade", target: "https://tigr.link/s/60Fd6X6")
                .target(.blank)
            Link("moomoo", target: "https://j.moomoo.com/0Be7On")
                .target(.blank)
        }
        .class("referral-list")
    }
}