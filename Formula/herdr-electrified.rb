class HerdrElectrified < Formula
  include Language::Python::Virtualenv

  desc "Reversible appearance settings and patched renderers for Herdr"
  homepage "https://github.com/rm0nroe/herdr-electric"
  url "https://github.com/rm0nroe/herdr-electric/archive/refs/tags/v1.10.1.tar.gz"
  sha256 "8a55d0b216486acf274f27c6960ff5585c7e851e774b9153bc47f89dc804e88e"
  license all_of: ["Apache-2.0", "MIT"]

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.12"

  resource "tomlkit" do
    url "https://files.pythonhosted.org/packages/94/96/e07752635b98536177fa1f37671c8f3cdde2e724c6bcf6034b2cfb571565/tomlkit-0.15.1.tar.gz"
    sha256 "e25bbf38843005246210a12982776f27f99cb9be67160e14434d0c0d21ee1e97"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Run herdr-electrified install to preview and apply Electric.
      Add ~/.local/bin to PATH to use herdr-electric.
      Run herdr-electrified undo before uninstalling to restore your settings.
    EOS
  end

  test do
    assert_equal "herdr-electrified #{version}", shell_output("#{bin}/herdr-electrified --version").strip
    system bin/"herdr-electrified", "check"
  end
end
