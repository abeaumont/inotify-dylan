module: inotify
synopsis: Generated bindings for the inotify linux kernel subsystem.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND


define interface
  #include "sys/inotify.h",
    import: all,
    import: {
      "IN_CLOEXEC",
      "IN_NONBLOCK"
    };
end interface;