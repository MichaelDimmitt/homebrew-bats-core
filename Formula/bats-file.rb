class BatsFile < Formula
  desc "Common filesystem assertions for Bats"
  homepage "https://github.com/bats-core/bats-file"
  version "0.3.0"
  url "https://github.com/bats-core/bats-file/archive/refs/tags/v0.3.0.tar.gz"
  head "https://github.com/bats-core/bats-file.git"
  sha256 "54d1c8b1908608aef8e46ac17d4001a75119e279662aeac4e5859ce780515362"
  license "CC0 1.0 Universal"

  def install
    mkdir "bats-file"
    mv "load.bash", "bats-file/"
    mv "src", "bats-file/"
    mv "test", "bats-file/"
    lib.install "bats-file"
  end

  def caveats
    <<~EOS

      To load the bats-file lib in your bats test:

          load '#{HOMEBREW_PREFIX}/lib/bats-support/load.bash'
          load '#{HOMEBREW_PREFIX}/lib/bats-file/load.bash'
    EOS
  end

  test do
    ENV["TEST_DEPS_DIR"] = "#{HOMEBREW_PREFIX}/lib"
    system "bats", "#{lib}/bats-file/test"
  end
end
