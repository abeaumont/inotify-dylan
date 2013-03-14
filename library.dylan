module: dylan-user
synopsis: Generated bindings for the inotify linux kernel subsystem.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND


define library inotify
  use common-dylan;
  use c-ffi;

  export inotify;
end library;

define module inotify
  use common-dylan, exclude: { format-to-string };
  use c-ffi;

  // inotify API functions
  export
    inotify-init,
    inotify-init1,
    inotify-add-watch,
    inotify-rm-watch,
    inotify-close;

  // inotify-init1 flags
  export
    $IN-CLOEXEC,
    $IN-NONBLOCK;

  // inotify-add-watch and <inotify-event> mask field bits
  export
    $IN-ACCESS,
    $IN-ATTRIB,
    $IN-CLOSE-WRITE,
    $IN-CLOSE-NOWRITE,
    $IN-CREATE,
    $IN-DELETE,
    $IN-DELETE-SELF,
    $IN-MODIFY,
    $IN-MOVE-SELF,
    $IN-MOVED-FROM,
    $IN-MOVED-TO,
    $IN-OPEN;

  // additional inotify-add-watch mask field bits
  export
    $IN-ALL-EVENTS,
    $IN-CLOSE,
    $IN-DONT-FOLLOW, // since Linux 2.6.15
    $IN-EXCL-UNLINK, // since Linux 2.6.36
    $IN-MASK-ADD,
    $IN-MOVE,
    $IN-ONESHOT,
    $IN-ONLYDIR;     // since Linux 2.6.15

  // additional <inotify-event> mask field bits
  export
    $IN-IGNORED,
    $IN-ISDIR,
    $IN-Q-OVERFLOW,
    $IN-UNMOUNT;

  // error variable and values
  export
    //errno,
    $EACCES,
    $EAGAIN,
    $EBADF,
    $EFAULT,
    $EINTR,
    $EINVAL,
    $EIO,
    $EISDIR,
    $EMFILE,
    $ENFILE,
    $ENOENT,
    $ENOMEM,
    $ENOSPC,
    $EWOULDBLOCK;
end module;
