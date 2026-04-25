import Foundation
import Ignite

struct MainLayout: Layout {
    var body: some Document {
        Head {
            MetaLink(href: "/css/custom.css", rel: .stylesheet)
            Script(code: """
                (function() {
                    var s = document.createElement('script');
                    s.async = true;
                    s.src = 'https://www.googletagmanager.com/gtag/js?id=G-JXLXCN5680';
                    document.head.appendChild(s);
                    window.dataLayer = window.dataLayer || [];
                    function gtag(){dataLayer.push(arguments);}
                    gtag('js', new Date());
                    gtag('config', 'G-JXLXCN5680');
                })();
                """)
        }
        Body {
            NavigationBar(logo: Link("Nyan's Referrals", target: "https://nyanlintun.me"))
                .navigationBarStyle(.dark)
                .class("bg-dark")
            content
            IgniteFooter()
        }
    }
}
