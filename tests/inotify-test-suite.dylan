module: inotify-test-suite
synopsis: Testsuite for inotify bindings.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND


define suite inotify-test-suite ()
  test init-close-inotify-test;
end suite inotify-test-suite;

define test init-close-inotify-test ()
  let fd = inotify-init();
  check("inotify-init success", fd > 0);
  // TODO: Close file descriptor
end test init-close-inotify-test;
