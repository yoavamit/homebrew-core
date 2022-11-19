require "language/node"

class Svgo < Formula
  desc "Nodejs-based tool for optimizing SVG vector graphics files"
  homepage "https://github.com/svg/svgo"
  url "https://github.com/svg/svgo/archive/v3.0.2.tar.gz"
  sha256 "fe0a790407c9055025607bf3d717d545f737f98ecb8af1cc21636020adc2c7e5"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "55b7cca8c2dd5a82b85c784ab338577895e0e312a922fd5cdd9213cd562cc2bd"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    cp test_fixtures("test.svg"), testpath
    system bin/"svgo", "test.svg", "-o", "test.min.svg"
    assert_match(/^<svg /, (testpath/"test.min.svg").read)
  end
end
