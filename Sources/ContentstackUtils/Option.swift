public protocol Renderable {
    func renderOptions(embeddedObject: EmbeddedObject, metadata: Metadata) -> String?
    func renderMark(markType: MarkType, text: String) -> String
//    func renderNode(nodeType: NodeType, node: String, next: (() -> String)) -> String
}

public protocol Option: Renderable {
    var entry: EntryEmbedable { get }
}

extension Option {
    func renderOptions(embeddedObject: EmbeddedObject, metadata: Metadata) -> String? {
        switch metadata.styleType {
        case StyleType.block:
            var renderString = "<div><p>\(embeddedObject.uid)</p>"
            if let embeddedEntry = embeddedObject as? EmbeddedEntry {
                renderString = """
<div><p>\(embeddedEntry.title)</p><p>Content type: <span>\(type(of: embeddedEntry).contentTypeUid)</span></p>
"""
            } else if let embeddedContentTypeUid = embeddedObject as? EmbeddedContentTypeUid {
                renderString += "<p>Content type: <span>\(type(of: embeddedContentTypeUid).contentTypeUid)</span></p>"
            }
            return renderString + "</div>"
        case StyleType.inline:
            if let embeddedEntry = embeddedObject as? EmbeddedEntry {
                return "<span>\(embeddedEntry.title)</span>"
            }
            return "<span>\(embeddedObject.uid)</span>"
        case StyleType.link:
            if let embeddedEntry = embeddedObject as? EmbeddedEntry {
                return "<a href=\"\(embeddedObject.uid)\">\(metadata.text ?? embeddedEntry.title)</a>"
            }
            return "<a href=\"\(embeddedObject.uid)\">\(metadata.text ?? embeddedObject.uid)</a>"
        case StyleType.display:
            if let asset = embeddedObject as? EmbeddedAsset {
                return "<img src=\"\(asset.url)\" alt=\"\(asset.title)\" />"
            }
            return "<img src=\"\(embeddedObject.uid)\" alt=\"\(embeddedObject.uid)\" />"
        }
    }
    
    public func renderMark(markType: MarkType, text: String) -> String {
        switch markType {
        case .bold:
            return "<strong>\(text)</strong>"
        case .italic:
            return "<em>\(text)</em>"
        case .underline:
            return "<u>\(text)</u>"
        case .strickthrough:
            return "<strike>\(text)</strike>"
        case .inlineCode:
            return "<span>\(text)</span>"
        case .subscript:
            return "<sub>\(text)</sub>"
        case .superscript:
            return "<sup>\(text)</sup>"
        }
    }
}
