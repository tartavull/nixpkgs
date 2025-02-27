{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kubedb-cli";
  version = "0.28.0";

  src = fetchFromGitHub {
    owner = "kubedb";
    repo = "cli";
    rev = "v${version}";
    sha256 = "sha256-fSJ9IIuyOuKmpklw7uh1NKM3Pr5epJefYBJ3udeC5sE=";
  };

  vendorSha256 = null;

  # Don't compile the documentation stuff
  subPackages = [ "cmd/kubectl-dba" ];

  meta = with lib; {
    description = "kubectl plugin for KubeDB by AppsCode.";
    homepage    = "https://github.com/kubedb/cli";
    license     = licenses.unfree;
    maintainers = [ maintainers.starcraft66 ];
  };
}
