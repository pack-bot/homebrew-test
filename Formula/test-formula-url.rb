class TestFormulaUrl < Formula
  desc "Formula to test Action"
  homepage "https://github.com/dawidd6/actions-updater"
  url "https://github.com/dawidd6/actions-updater/archive/v0.1.11.tar.gz"
  sha256 "b1c83ee9d19289eb403ad0863c235fa9c3b3a980c9b13a43cda9fc9413935df4"
  license "MIT"

  bottle :unneeded

  def install
    system "sleep", "1"
  end

  test do
    system "sleep", "1"
  end
end
