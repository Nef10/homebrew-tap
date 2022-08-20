class SwiftTestCoverage < Formula
  desc "Command-line Tool to display the test coverage of a swift package"
  homepage "https://github.com/Nef10/swift-test-coverage"
  url "https://github.com/Nef10/swift-test-coverage/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "6af439b994101c645c84cea4e6810e8c68ec1ede220ff16486601ecc00d79348"
  license "MIT"

  def install
    bin.install "swift-test-coverage"
  end
end
