# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Cartool < Formula
  desc "ToolKit for Compiled Asset Catalogs (.car file) written in Swift."
  homepage "https://github.com/0xxd0/cartools"
  url "https://github.com/0xxd0/cartools/archive/1.0.0-alpha.tar.gz"
  sha256 "a9b862dae30695df8611a85d53ae52af12a3741b0f5a760a17d842aac5d62a3c"
  license "MIT"

  depends_on :xcode => "12.0"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
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
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test cartools`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
