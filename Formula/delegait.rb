# Homebrew Tap Formula: brew install rm0nroe/tap/delegait
class Delegait < Formula
  desc "Zero-Standing-Privilege Execution Vault & Hardware-Signed Policy CLI"
  homepage "https://delegait.app"
  url "https://registry.npmjs.org/delegait/-/delegait-5.5.0.tgz"
  sha256 "cc2548b03f305e2d7acc65e78953051cb1d161e365f2497daaa1d1e2e447d214"
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
