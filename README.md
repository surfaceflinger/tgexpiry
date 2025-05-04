# tgexpiry

> [!CAUTION]
> Using Desktop session breaks TOS. If you don't have Telegram Premium or your account is very new, you're likely to get banned, maybe even instantly.

[home-manager](https://github.com/nix-community/home-manager) module that adds a user systemd service with a small script that takes your Telegram Desktop session and removes all messages everywhere (except from Saved Messages) that are older than defined TTL. This includes messages which you sent on channels (not talking about groups).

## why?

Because People allow themselves to turn off auto delete and it doesn't work in groups.

## use

```
inputs = {
  tgexpiry.url = "github:surfaceflinger/tgexpiry/main";
};
```

```
imports = [ inputs.tgexpiry.homeModules.tgexpiry ];

services.tgexpiry = {
  enable = true;
  ttl = 7;
};
```

