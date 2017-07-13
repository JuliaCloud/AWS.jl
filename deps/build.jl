using BinDeps

@BinDeps.setup

@static if is_windows() begin
  crypto = library_dependency("libcrypto", aliases = ["libcrypto-10"])
  using WinRPM
  provides(WinRPM.RPM, "openssl", crypto, os = :Windows )
end

@BinDeps.install
