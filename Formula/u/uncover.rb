class Uncover < Formula
  desc "Tool to discover exposed hosts on the internet using multiple search engines"
  homepage "https://github.com/projectdiscovery/uncover"
  url "https://github.com/projectdiscovery/uncover/archive/refs/tags/v1.0.7.tar.gz"
  sha256 "1c97474166b84ef68c3085fd58fd0eba34ea7e835d0db6bb6c7590725b835329"
  license "MIT"
  head "https://github.com/projectdiscovery/uncover.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "9da9f74a24f70e1bbda19e1e4e5cf4e7a2cf7509dfa06082be24803ccac8ba9d"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "ac4f6484caa772ca2237c49f910dcb31e6843cfa6ca3c139c47842b07ffc5c41"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "bc1e601510189910702218f4e57013506a90e9a0c9c46c23a8ebd30313aacdaf"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "cc94bee06b1c410c6bd755a1aa2418d976d36f069886c977f98be90d22234ecf"
    sha256 cellar: :any_skip_relocation, sonoma:         "bdc60b28227abf3ac16b5322e2e3448931a824c55ebd7e6059b81f9e3a7c61e5"
    sha256 cellar: :any_skip_relocation, ventura:        "d9a3af7cfa6ffaf7cd7805d625d7a12f0f4d0f83b58a74782633b69d917531ae"
    sha256 cellar: :any_skip_relocation, monterey:       "d0761fdbbed10b1db0f9b1c57219a1e08dc9c10f0b3021975c38bb92b913d8d9"
    sha256 cellar: :any_skip_relocation, big_sur:        "e4037dee3da440c3b9dff22c5ee1b78311e761166419c78614987098c785d81e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "9790ab57b0aa977d14e00e7750d7e923c816c500fd3e2b9d599744e46ab1bb27"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/uncover"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/uncover -version 2>&1")
    assert_match "no keys were found", shell_output("#{bin}/uncover -q brew -e shodan 2>&1", 1)
  end
end
