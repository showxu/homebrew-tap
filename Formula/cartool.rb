class Cartool < Formula
  desc "Extract resources from car file."
  homepage "https://github.com/0xxd0/swift-cartools"
  url "https://github.com/0xxd0/swift-cartools/releases/download/1.0.0-alpha/cartool.tar.gz"
  sha256 "8c0e6883c8e256639d4252803b2601ac63b5ee461a8a703598a83f9dc20f10c3"
  version "1.0.0-alpha"
  license all_of: ["MIT"]

  def install
    bin.install "cartool"
  end
end