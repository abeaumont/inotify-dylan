module: inotify
synopsis: Generated bindings for the inotify linux kernel subsystem.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND


// Add read and close by hand, apparently including unistd.h doesn't work
// TODO: Add read class
define C-function inotify-close
  parameter file-descriptor :: <C-int>;
  result status :: <C-int>;
  c-name: "close";
end C-function inotify-close;

define interface
  #include "sys/inotify.h",
    import: all,
    import: {
      "IN_CLOEXEC",
      "IN_NONBLOCK"
    };
end interface;