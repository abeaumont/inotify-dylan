module: inotify-test-suite
synopsis: Testsuite for inotify bindings.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND


define suite inotify-test-suite ()
  test init-close-inotify-test;
  test init1-close-inotify-test;
  test add-rm-watch-inotify-test;
end suite inotify-test-suite;

define test init-close-inotify-test ()
  let fd = inotify-init();
  check("inotify-init() succeeds", method () fd > 0 end);
  check-equal("inotify-close(fd) succeeds", inotify-close(fd), 0);
end test init-close-inotify-test;

define test init1-close-inotify-test ()
  // Equivalent to inotify-init();
  let fd = inotify-init1(0);
  check("inotify-init1(0) succeeds", method () fd > 0 end);
  check-equal("inotify-close(fd) succeeds", inotify-close(fd), 0);

  // $IN-NONBLOCK option
  let fd = inotify-init1($IN-NONBLOCK);
  check("inotify-init1($IN-NONBLOCK) succeeds", method () fd > 0 end);
  check-equal("inotify-close(fd) succeeds", inotify-close(fd), 0);

  // $IN-CLOEXEC option
  let fd = inotify-init1($IN-CLOEXEC);
  check("inotify-init1($IN-CLOEXEC) succeeds", method () fd > 0 end);
  check-equal("inotify-close(fd) succeeds", inotify-close(fd), 0);

  // Both $IN-NONBLOCK and $IN-CLOEXEC option
  let fd = inotify-init1(logior($IN-NONBLOCK, $IN-CLOEXEC));
  check("inotify-init1(logior($IN-NONBLOCK, $IN-CLOEXEC)) succeeds",
        method () fd > 0 end);
  check-equal("inotify-close(fd) succeeds", inotify-close(fd), 0);

  // Invalid init option
  let fd = inotify-init1(logior($IN-NONBLOCK, $IN-CLOEXEC) + 1);
  check-equal("inotify-init1 with an invalid option fails", fd, -1);
end test init1-close-inotify-test;

define test add-rm-watch-inotify-test ()
  let fd = inotify-init();
  check("inotify-init() succeeds", method () fd > 0 end);

  // No mask
  check-equal("inotify-add-watch() fails", inotify-add-watch(fd, "/tmp", 0), -1);

  check-equal("inotify-close(fd) succeeds", inotify-close(fd), 0);
end test add-rm-watch-inotify-test;
