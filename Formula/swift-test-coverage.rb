class SwiftTestCoverage < Formula
  desc "Command-line Tool to display the test coverage of a swift package"
  homepage "https://github.com/Nef10/swift-test-coverage"
  url "https://github.com/Nef10/swift-test-coverage/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "a0f6126af6a53f322c56ce506dcfd430fc87fb5576f34264fa27a35a0b3073cb"
  license "MIT"

  def install
    bin.install "swift-test-coverage"
  end
end
