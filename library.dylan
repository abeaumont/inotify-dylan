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

  export
    inotify-init,
    inotify-init1,
    inotify-add-watch,
    inotify-rm-watch,
    inotify-close;

  export
    $IN-CLOEXEC,
    $IN-NONBLOCK;

  export
    errno,
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
    $EWOULDBLOCK
end module;
