# Homebrew Tap Formula: brew install rm0nroe/tap/delegait
class Delegait < Formula
  desc "Zero-Standing-Privilege Execution Vault & Hardware-Signed Policy CLI"
  homepage "https://delegait.app"
  url "https://registry.npmjs.org/delegait/-/delegait-5.5.1.tgz"
  sha256 "f27004e31a22cd3c2fba97e61b1011681234a6c27843cebc98035c9aa07f2852"
  license "MIT"

  depends_on "node@22"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/delegait start --check")
    assert_match "2026-07-28", output
  end
end
