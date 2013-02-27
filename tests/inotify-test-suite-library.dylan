module: dylan-user
synopsis: Testsuite for inotify bindings.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND


define library inotify-test-suite
  use common-dylan;
  use testworks;
  use inotify;

  export inotify-test-suite;
end library inotify-test-suite;

define module inotify-test-suite
  use common-dylan, exclude: { format-to-string };
  use testworks;
  use inotify;

  export inotify-test-suite;
end module inotify-test-suite;
