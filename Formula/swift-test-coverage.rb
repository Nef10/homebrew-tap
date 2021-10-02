class SwiftTestCoverage < Formula
  desc "Command-line Tool to display the test coverage of a swift package"
  homepage "https://github.com/Nef10/swift-test-coverage"
  url "https://github.com/Nef10/swift-test-coverage/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "ac0c58289cde648564373a743250752ebc71a7971bec710772e3e5fa9b9f6664"
  license "MIT"

  def install
    bin.install "swift-test-coverage"
  end
end
