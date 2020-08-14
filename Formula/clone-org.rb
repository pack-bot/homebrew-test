class CloneOrg < Formula
  desc "Clone all repos of a github organization"
  homepage "https://github.com/caarlos0/clone-org"
  url "https://github.com/caarlos0/clone-org/archive/v1.1.2.tar.gz"
  sha256 "5d8ffd94da079ea4eec57ed3b11977edb316ee1e510bbd4bdc4915905b8d8dd1"
  license "MIT"
  head "https://github.com/caarlos0/clone-org.git"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "-ldflags", "-X main.version=#{version}", "./cmd/clone-org"
  end

  test do
    assert_equal "clone-org version #{version}", shell_output("#{bin}/clone-org -v").chomp
  end
end
