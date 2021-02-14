require "json"

class Cartool < Formula
  def self.homepage
    "https://github.com/0xxd0/cartools"
  end

  def self.tag 
    "1.0.0-alpha"
  end

  def self.file_path
    "#{tag}.tar.gz"
  end

  def self.download_url
    "#{homepage}/archive/#{file_path}"
  end

  def self.sha256_checksum
    "a9b862dae30695df8611a85d53ae52af12a3741b0f5a760a17d842aac5d62a3c"
  end
  
  desc "ToolKit for Compiled Asset Catalogs (.car file) written in Swift"
  homepage homepage
  url download_url
  sha256 sha256_checksum
  license "MIT"

  depends_on :xcode => "12.0"

  def install
    system "xcodebuild", "-resolvePackageDependencies"
    system "xcodebuild",
           "-project", "Cartools.xcodeproj",
           "-scheme", "cartool",
           "-configuration", "Release",
           "-arch", "x86_64",
           "-sdk", "macosx",
           "-derivedDataPath", ".build"

    bin.install ".build/Build/Products/Release/cartool"
  end

  test do
    system "#{bin}/cartool", "-h"
  end
end
