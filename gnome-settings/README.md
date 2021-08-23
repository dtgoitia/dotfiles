# GNOME configurations

## Usage

Enable automatic backups:

1. Ensure Dropbox scripts are available in `PATH`.
2. Symlink all files using `stow`
3. Enable automatic backups using systemd:
  ```bash
  systemctl --user start gnome-config-backup.timer
  ```

Restore backup:

```bash
dconf load / < "$HOME/.config/dconf/settings.ini"
```

[Source][3]

## How does it work?

[This][2] was a very useful tutorial.

`%h` refers to the user home directory [1][1].

* TL;DR: timer triggers service, service executes command.

* To debug the timer:
  - Status: `systemctl --user status gnome-config-backup.timer`
  - Run: `systemctl --user start gnome-config-backup.timer`
  - Stop: `systemctl --user stop gnome-config-backup.timer`
  - Logs: `journalctl --user -u gnome-config-backup.timer`
  - Note: if you change the timer file, you need to stop/start it again to reload the changes.

* To debug the service:
  - Status: `systemctl --user status gnome-config-backup.service`
  - Run: `systemctl --user start gnome-config-backup.service`
  - Logs: `journalctl --user -u gnome-config-backup.service`

<!-- External resources -->

[1]: https://wiki.archlinux.org/title/Systemd/User#Writing_user_units "Arch Wiki | systemd - Writing user units"
[2]: https://opensource.com/article/20/7/systemd-timers "Useful tutorial"
[3]: https://peterbabic.dev/blog/keep-gnome-shell-settings-dotfiles-yadm/ "Keep Gnome Shell settings in dotfiles with yadm"
