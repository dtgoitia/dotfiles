# Advanced touchpad gestures

To debug your config:
  
  1. Stop the process and start the debugging mode:

      ```bash
      libinput-gestures-setup stop
      libinput-gestures -d
      ```

  2. Play around until you get the gestures you want.

  3. Restart the process:

      ```bash
      libinput-gestures-setup autostart start
      ```

<!-- External references -->

[1]: https://github.com/bulletmark/libinput-gestures "libinput-gestures (GitHub)"
