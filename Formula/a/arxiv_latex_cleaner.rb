class ArxivLatexCleaner < Formula
  include Language::Python::Virtualenv

  desc "Clean LaTeX code to submit to arXiv"
  homepage "https://github.com/google-research/arxiv-latex-cleaner"
  url "https://files.pythonhosted.org/packages/7b/be/e0afb37ba09060368e3858c8248328faf187d814f9cb9da00e5611d150d0/arxiv_latex_cleaner-1.0.8.tar.gz"
  sha256 "e40215f486770a90aaec3d4d5c666a5695ce282b4bf57cdd39c2f4623866e3f4"
  license "Apache-2.0"
  head "https://github.com/google-research/arxiv-latex-cleaner.git", branch: "main"

  bottle do
    sha256 cellar: :any,                 arm64_sonoma:   "199097f12165c2d0e99c45df44cf5b5120f5203ef894e8fe134709d90b615a86"
    sha256 cellar: :any,                 arm64_ventura:  "cc362c9e3f269d5c5e2af6b005db01ebeb4ef68b5d6246a09968d123cabae109"
    sha256 cellar: :any,                 arm64_monterey: "1490f77d4c16068ba49b323c7926e75c61762df6b2dc6166367a16d9c813c624"
    sha256 cellar: :any,                 sonoma:         "9d9de5c14132d82225eea8fc4d5f47788e6d7435fcfc28e5dbce2a4b1bc1bdb6"
    sha256 cellar: :any,                 ventura:        "c30ecde049903234c8f8c904fd0ea70090c04f2b6921dfdf294b961ece570c60"
    sha256 cellar: :any,                 monterey:       "e5874bf8bfe74d6b01ff4e7a2f5d9e9da4d43f2126dd2876cf7731056e734422"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "b743c497d9e22261d607535b2a80a852d8071805b2143429fe47e942e0d96699"
  end

  depends_on "libyaml"
  depends_on "pillow"
  depends_on "python@3.12"

  resource "absl-py" do
    url "https://files.pythonhosted.org/packages/7a/8f/fc001b92ecc467cc32ab38398bd0bfb45df46e7523bf33c2ad22a505f06e/absl-py-2.1.0.tar.gz"
    sha256 "7820790efbb316739cde8b4e19357243fc3608a152024288513dd968d7d959ff"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/cd/e5/af35f7ea75cf72f2cd079c95ee16797de7cd71f29ea7c68ae5ce7be1eda0/PyYAML-6.0.1.tar.gz"
    sha256 "bfdf460b1736c775f2ba9f6a92bca30bc2095067b8a9d77876d1fad6cc3b4a43"
  end

  resource "regex" do
    url "https://files.pythonhosted.org/packages/7a/db/5ddc89851e9cc003929c3b08b9b88b429459bf9acbf307b4556d51d9e49b/regex-2024.5.15.tar.gz"
    sha256 "d3ee02d9e5f482cc8309134a91eeaacbdd2261ba111b0fef3748eeb4913e6a2c"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    latexdir = testpath/"latex"
    latexdir.mkpath
    (latexdir/"test.tex").write <<~EOS
      % remove
      keep
    EOS
    system bin/"arxiv_latex_cleaner", latexdir
    assert_predicate testpath/"latex_arXiv", :exist?
    assert_equal "keep", (testpath/"latex_arXiv/test.tex").read.strip
  end
end
