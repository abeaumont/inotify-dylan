module: dylan-user
synopsis: Generated bindings for the inotify linux kernel subsystem.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND


define library inotify
  use common-dylan;
  use io;
end library;

define module inotify
  use common-dylan, exclude: { format-to-string };
  use format-out;
end module;
