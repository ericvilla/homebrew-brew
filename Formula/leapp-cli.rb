require "language/node"

  class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.19"
  url "https://registry.npmjs.org/@hesketh-racing/leapp-cli/-/leapp-cli-0.1.19.tgz"
  sha256 "994d9649db3d6c06f1f3dbc5fb5041cb844a615e11b570ac94ee1bb8485df28a"

  depends_on "node@16"
  depends_on "libsecret"
  depends_on "python" => :build

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec).reject { |a| a == "--build-from-source" }
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"leapp", "version"
  end
end
