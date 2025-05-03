flake:
{
  config,
  lib,
  pkgs,
  ...
}:

let

  cfg = config.services.tgexpiry;

in
{
  options.services.tgexpiry = {

    enable = lib.mkEnableOption { };

    package = lib.mkPackageOption flake.inputs.self.packages."${pkgs.system}" "tgexpiry" { };

    ttl = lib.mkOption {
      type = lib.types.int;
      default = 7;
    };
  };

  config = lib.mkIf cfg.enable {

    systemd.user.services.tgexpiry = {
      Unit = {
        Description = "https://github.com/surfaceflinger/tgexpiry";
      };
      Service = {
        Type = "oneshot";
        Environment = [ "TGEXPIRY_TTL=${toString cfg.ttl}" ];
        ExecStart = lib.getExe cfg.package;
      };
    };

    systemd.user.timers.tgexpiry = {
      Install.WantedBy = [ "timers.target" ];
      Unit.Description = "https://github.com/surfaceflinger/tgexpiry";
      Timer = {
        OnCalendar = "daily";
        Persistent = true;
        Unit = "tgexpiry.service";
      };
    };

  };

}
