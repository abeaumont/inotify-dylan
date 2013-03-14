module: inotify
synopsis: Generated bindings for the inotify linux kernel subsystem.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND


// Add read and close by hand, apparently including unistd.h doesn't work
// TODO: Add read function
define c-function inotify-close
  parameter file-descriptor :: <c-int>;
  result status :: <c-int>;
  c-name: "close";
end c-function inotify-close;

/*
define c-variable inotify-errno :: <c-int>
  c-name: "errno";
end c-variable;
*/

define interface
  #include {
    "errno.h",
    "sys/inotify.h"
    },
    import: all,

    // inotify-init1 flags
    import: {
      "IN_CLOEXEC",
      "IN_NONBLOCK"
    },

    // possible errno values while operating with inotify
    import: {
      "EACCES",
      "EAGAIN",
      "EBADF",
      "EFAULT",
      "EINTR",
      "EINVAL",
      "EIO",
      "EISDIR",
      "EMFILE",
      "ENFILE",
      "ENOENT",
      "ENOMEM",
      "ENOSPC",
      "EWOULDBLOCK"
    },
    equate: {"char *" => <c-string>};
end interface;