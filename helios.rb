require "formula"

class Helios < Formula
  homepage "https://github.com/spotify/helios"
  url "https://oss.sonatype.org/service/local/repositories/releases/content/com/spotify/helios-tools/0.9.199/helios-tools-0.9.199-shaded.jar"
  sha256 "455f7bb24b02183e343257b23fb9d9d77a786ae6c417fefd7cffa001391eafd6"
  version "0.9.199"

  depends_on :java => "1.7+"

  def install
    libexec.install "helios-tools-0.9.199-shaded.jar"
    bin.write_jar_script libexec/"helios-tools-0.9.199-shaded.jar", "helios", "-XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xverify:none"
  end

  test do
    system "#{bin}/helios", "--version"
  end
end
