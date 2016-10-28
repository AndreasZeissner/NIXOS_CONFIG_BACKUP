{ config, lib, pkgs, ... }:
with lib;
{
  users = let
    userDefaultSettings =
    {
      isNormalUser = true;
      extraGroups  = [ "wheel" ];
    };
    in
    {
      mutableUsers = true;
      extraUsers   = mapAttrs (userName: userSettings: userDefaultSettings // userSettings) rec {
        wangoe = {
          home = "/home/wangoe";
          description = "WangoeWoe Account";
        };
        andreas = {
          home         = "/home/wangoe";
          description  = "SSH account from mbr readonly";
          openssh.authorizedKeys.keys = [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDJ7Mp0Kk6vkE/eF8wN7Ee8kr4EpWy4eNqX7YBR+XMx/bEaFA8p1HnGVavBGyoenFo2lZ50llU29nDr0r2ez1ZuqbipHBuWbte/Aj0iFHXZ6vXH5llvj385LXAP/i39t0hHSyZ9g1JCEjFCcZrglgTkqwZTUt7V/B+5s0YiBQqTmtUUzpysNF9SCg/tnRCnNPOcoSGJRwo2L8AlgQ23f2CC+PHFTqkvQ82FUwvx0i8OrebdIzlm5QGs70RVXNECZhPG7x/d8CfVjwu386s+0DQPjlv4eXX8XsFXtSHVuKv8sH1daQgq7XuSf5jZyQZFwYBKxVQKLhtRWBxoVf/aokG9NoF2MmGcuNhZmLsYvmoim2QjaFfQ+wTAS4aSXgvAaGBe3wsAGoEKm127xw+lLosoh4YvM9OojnEaJ1blgLvGq673NIcBtezNvnYPYQ924nSjQDqk51smeexFIBOueoOCRQuVh0780ncS+nN+Lhpt4pUwpSSvYMcxiN7OcmFuLf/yoLNgXTUkEV6H46fHDz8uYpdyY7lkYr0qERxeSSZQLdsoVg5zu2Fd262iZp85TU6flLo7jkCu2jSaa7AQfaus+XX2nD1MfCrPN14A73ZATaf1HiSenFTx6Q7QzCv1FlKIRNuxwlJfT0b50m8yCiwQgctyKeEB8nP1kdHlBBZwCw== andreas@Andreass-MacBook-Pro.local"
          ];
        };
        vagrant = {
          home = "/home/vagrant";
          description = "vagrant user for development";
          extraGroups = [ "vboxsf"  ];
          password    = "strongpassword";
          openssh.authorizedKeys.keys = [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key"
          ];
        };
        root = {
            isNormalUser = false;
            isSystemUser = true;
            hashedPassword = "f93fc10472a31bb3061aa0b45e228c5a";
        };
      };
   };
}
