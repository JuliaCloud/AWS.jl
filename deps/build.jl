using BinDeps

@BinDeps.setup

@windows_only begin
  crypto = library_dependency("libcrypto", aliases = ["libcrypto-10"])
  using WinRPM
  provides(WinRPM.RPM, "openssl", crypto, os = :Windows )
end

@BinDeps.install
