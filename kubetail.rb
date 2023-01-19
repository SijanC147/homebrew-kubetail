class Kubetail < Formula
  desc "Tail logs from multiple Kubernetes pods at the same time"
  homepage "https://github.com/sijanc147/kubetail"
  url "https://github.com/SijanC147/kubetail/archive/refs/tags/v1.tar.gz"
  sha256 "40bfe2fb7b8b62a7217d10fad89979ebd6b48e62b58cfe6ff4661636fbbea2e9"
  head "https://github.com/sijanc147/kubetail.git"

  option "with-short-names", "link as \"kt\" instead"
  
  def install
    bin.install "kubetail" => build.with?("short-names") ? "kt" : "kubetail"
    bash_completion.install "completion/kubetail.bash"
    zsh_completion.install "completion/kubetail.zsh" => "_kubetail"
    fish_completion.install "completion/kubetail.fish"
  end

  test do
    system "which", build.with?("short-names") ? "kt" : "kubetail"
  end
end
