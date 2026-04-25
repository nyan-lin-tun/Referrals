import Foundation
import Ignite

struct MainLayout: Layout {
    var body: some Document {
        Head {
            MetaLink(href: "/css/custom.css", rel: .stylesheet)
        }
        Body {
            content
            IgniteFooter()
        }
    }
}
