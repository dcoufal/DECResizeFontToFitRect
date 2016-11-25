Pod::Spec.new do |s|
s.name             = "DECResizeFontToFitRect"
s.version          = "1.1.0"
s.summary          = "Code to calculate the optimal point size of a font to fit any given text and rect"

s.description      = <<-DESC
This pod contains a function to calculate the optimal size of font that fits a given string in any given rectangle.
DESC

s.homepage         = "https://github.com/dcoufal/DECResizeFontToFitRect"
s.license          = 'MIT'
s.author           = { "David Coufal" => "dcoufal@alum.mit.edu" }
s.source           = { :git => "https://github.com/dcoufal/DECResizeFontToFitRect.git", :tag => s.version.to_s }
s.social_media_url = 'https://twitter.com/davidcoufal'

s.platform     = :ios, '8.0'
s.requires_arc = true

s.source_files = 'Pod/Classes/**/*'
end
