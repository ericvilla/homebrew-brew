require "language/node"

  class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.17"
  url "https://registry.npmjs.org/@hesketh-racing/leapp-cli/-/leapp-cli-0.1.17.tgz"
  sha256 "9a630f505711961279a32a95970a53d69c500a9f38f5ea8c9a8006b641d8c267"

  depends_on "node@16"
  depends_on "libsecret"
  depends_on "python" => :build

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"leapp", "version"
  end
end
