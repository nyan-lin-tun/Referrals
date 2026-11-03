import Foundation

struct ReferralCategory {
    struct Referral {
        let title: String
        let url: String
    }

    let title: String
    let order: Int
    let links: [Referral]

    private struct InvalidData: LocalizedError {
        let errorDescription: String?
    }

    /// Reads the documented category format, rather than accepting arbitrary YAML or Markdown.
    static func load() throws -> [ReferralCategory] {
        let directory = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
            .appendingPathComponent("Data/referrals")
        let files = try FileManager.default.contentsOfDirectory(
            at: directory, includingPropertiesForKeys: nil
        ).filter { $0.pathExtension == "md" }.sorted { $0.lastPathComponent < $1.lastPathComponent }
        var categories: [ReferralCategory] = []
        var seenURLs = Set<String>()
        let linkPattern = try NSRegularExpression(pattern: #"^- \[([^\[\]]+)\]\((https?://[^\s]+)\)$"#)

        for file in files {
            func invalid(_ message: String) -> InvalidData {
                InvalidData(errorDescription: "Data/referrals/\(file.lastPathComponent): \(message)")
            }
            let lines = try String(contentsOf: file, encoding: .utf8)
                .components(separatedBy: .newlines)
                .map { $0.trimmingCharacters(in: .whitespaces) }
            guard lines.first == "---",
                  let end = lines.dropFirst().firstIndex(of: "---") else {
                throw invalid("Expected a metadata block between --- lines.")
            }
            var metadata: [String: String] = [:]
            for line in lines[1..<end] {
                let parts = line.split(separator: ":", maxSplits: 1).map {
                    $0.trimmingCharacters(in: .whitespaces)
                }
                guard parts.count == 2, ["title", "order"].contains(parts[0]),
                      metadata[parts[0]] == nil, !parts[1].isEmpty else {
                    throw invalid("Use one title: and one order: field, without quotes.")
                }
                metadata[parts[0]] = parts[1]
            }
            guard let title = metadata["title"], let rawOrder = metadata["order"],
                  let order = Int(rawOrder) else {
                throw invalid("A title and integer order are required.")
            }
            guard !categories.contains(where: { $0.title == title || $0.order == order }) else {
                throw invalid("Category titles and order values must be unique.")
            }
            var links: [Referral] = []
            for (index, line) in lines.enumerated() where index > end && !line.isEmpty {
                guard let match = linkPattern.firstMatch(
                    in: line, range: NSRange(line.startIndex..., in: line)
                ), let nameRange = Range(match.range(at: 1), in: line),
                   let urlRange = Range(match.range(at: 2), in: line) else {
                    throw invalid("Line \(index + 1): expected - [Name](https://example.com).")
                }
                let name = String(line[nameRange]).trimmingCharacters(in: .whitespaces)
                let url = String(line[urlRange])
                guard !name.isEmpty, let parsed = URLComponents(string: url),
                      let host = parsed.host, !host.isEmpty else {
                    throw invalid("Line \(index + 1): invalid name or URL.")
                }
                guard seenURLs.insert(url).inserted else {
                    throw invalid("Line \(index + 1): duplicate referral URL.")
                }
                links.append(Referral(title: name, url: url))
            }
            guard !links.isEmpty else { throw invalid("Add at least one referral link.") }
            categories.append(ReferralCategory(title: title, order: order, links: links))
        }
        guard !categories.isEmpty else {
            throw InvalidData(errorDescription: "Data/referrals: no category Markdown files found.")
        }
        return categories.sorted { $0.order < $1.order }
    }
}
