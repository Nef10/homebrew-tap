class SwiftTestCoverage < Formula
  desc "Command-line Tool to display the test coverage of a swift package"
  homepage "https://github.com/Nef10/swift-test-coverage"
  url "https://github.com/Nef10/swift-test-coverage/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "29567d0120c9d1800c22737b1c327c3a1ae30910f219210e6d531bdad0b2af86"
  license "MIT"

  def install
    bin.install "swift-test-coverage"
  end
end
