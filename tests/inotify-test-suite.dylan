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

  // No valid file descriptor
  check-equal("inotify-add-watch with invalid file descriptor fails",
              inotify-add-watch(0, "/tmp", 0), -1);

  // Non-existant file
  check-equal("inotify-add-watch with non-existant file descriptor fails",
              inotify-add-watch(fd, "/-_-_-_-", 0), -1);

  // No mask
  check-equal("inotify-add-watch() fails", inotify-add-watch(fd, "/tmp", 0), -1);

  // $IN-ACCESS mask bit
  let wd = inotify-add-watch(fd, "/tmp", $IN-ACCESS);
  check("inotify-add-watch($IN-ACCESS) succeeds", method () wd > 0 end);
  check-equal("inotify-rm-watch($IN-ACCESS) succeeds", inotify-rm-watch(fd, wd), 0);
  
  // $IN-ALL-EVENTS mask bit
  wd := inotify-add-watch(fd, "/tmp", $IN-ALL-EVENTS);
  check("inotify-add-watch($IN-ALL-EVENTS) succeeds", method () wd > 0 end);
  check-equal("inotify-rm-watch($IN-ALL-EVENTS) succeeds", inotify-rm-watch(fd, wd), 0);
  
  // $IN-ATTRIB mask bit
  wd := inotify-add-watch(fd, "/tmp", $IN-ATTRIB);
  check("inotify-add-watch($IN-ATTRIB) succeeds", method () wd > 0 end);
  check-equal("inotify-rm-watch($IN-ATTRIB) succeeds", inotify-rm-watch(fd, wd), 0);
  
  // $IN-CLOSE mask bit
  wd := inotify-add-watch(fd, "/tmp", $IN-CLOSE);
  check("inotify-add-watch($IN-CLOSE) succeeds", method () wd > 0 end);
  check-equal("inotify-rm-watch($IN-CLOSE) succeeds", inotify-rm-watch(fd, wd), 0);
  
  // $IN-CLOSE-WRITE mask bit
  wd := inotify-add-watch(fd, "/tmp", $IN-CLOSE-WRITE);
  check("inotify-add-watch($IN-CLOSE-WRITE) succeeds", method () wd > 0 end);
  check-equal("inotify-rm-watch($IN-CLOSE-WRITE) succeeds", inotify-rm-watch(fd, wd), 0);
  
  // $IN-CLOSE-NOWRITE mask bit
  wd := inotify-add-watch(fd, "/tmp", $IN-CLOSE-NOWRITE);
  check("inotify-add-watch($IN-CLOSE-NOWRITE) succeeds", method () wd > 0 end);
  check-equal("inotify-rm-watch($IN-CLOSE-NOWRITE) succeeds", inotify-rm-watch(fd, wd), 0);
  
  // $IN-CREATE mask bit
  wd := inotify-add-watch(fd, "/tmp", $IN-CREATE);
  check("inotify-add-watch($IN-CREATE) succeeds", method () wd > 0 end);
  check-equal("inotify-rm-watch($IN-CREATE) succeeds", inotify-rm-watch(fd, wd), 0);
  
  // $IN-DELETE mask bit
  wd := inotify-add-watch(fd, "/tmp", $IN-DELETE);
  check("inotify-add-watch($IN-DELETE) succeeds", method () wd > 0 end);
  check-equal("inotify-rm-watch($IN-DELETE) succeeds", inotify-rm-watch(fd, wd), 0);
  
  // $IN-DELETE-SELF mask bit
  wd := inotify-add-watch(fd, "/tmp", $IN-DELETE-SELF);
  check("inotify-add-watch($IN-DELETE-SELF) succeeds", method () wd > 0 end);
  check-equal("inotify-rm-watch($IN-DELETE-SELF) succeeds", inotify-rm-watch(fd, wd), 0);
  
  // $IN-DONT-FOLLOW mask bit
  wd := inotify-add-watch(fd, "/tmp", $IN-DONT-FOLLOW);
  check("inotify-add-watch($IN-DONT-FOLLOW) succeeds", method () wd > 0 end);
  check-equal("inotify-rm-watch($IN-DONT-FOLLOW) succeeds", inotify-rm-watch(fd, wd), 0);
  
  // $IN-EXCL-UNLINK mask bit
  wd := inotify-add-watch(fd, "/tmp", $IN-EXCL-UNLINK);
  check("inotify-add-watch($IN-EXCL-UNLINK) succeeds", method () wd > 0 end);
  check-equal("inotify-rm-watch($IN-EXCL-UNLINK) succeeds", inotify-rm-watch(fd, wd), 0);
  
  // $IN-MASK-ADD mask bit
  wd := inotify-add-watch(fd, "/tmp", $IN-MASK-ADD);
  check("inotify-add-watch($IN-MASK-ADD) succeeds", method () wd > 0 end);
  check-equal("inotify-rm-watch($IN-MASK-ADD) succeeds", inotify-rm-watch(fd, wd), 0);
  
  // $IN-MODIFY mask bit
  wd := inotify-add-watch(fd, "/tmp", $IN-MODIFY);
  check("inotify-add-watch($IN-MODIFY) succeeds", method () wd > 0 end);
  check-equal("inotify-rm-watch($IN-MODIFY) succeeds", inotify-rm-watch(fd, wd), 0);
  
  // $IN-MOVE mask bit
  wd := inotify-add-watch(fd, "/tmp", $IN-MOVE);
  check("inotify-add-watch($IN-MOVE) succeeds", method () wd > 0 end);
  check-equal("inotify-rm-watch($IN-MOVE) succeeds", inotify-rm-watch(fd, wd), 0);
  
  // $IN-MOVE-SELF mask bit
  wd := inotify-add-watch(fd, "/tmp", $IN-MOVE-SELF);
  check("inotify-add-watch($IN-MOVE-SELF) succeeds", method () wd > 0 end);
  check-equal("inotify-rm-watch($IN-MOVE-SELF) succeeds", inotify-rm-watch(fd, wd), 0);
  
  // $IN-MOVED-FROM mask bit
  wd := inotify-add-watch(fd, "/tmp", $IN-MOVED-FROM);
  check("inotify-add-watch($IN-MOVED-FROM) succeeds", method () wd > 0 end);
  check-equal("inotify-rm-watch($IN-MOVED-FROM) succeeds", inotify-rm-watch(fd, wd), 0);
  
  // $IN-MOVED-TO mask bit
  wd := inotify-add-watch(fd, "/tmp", $IN-MOVED-TO);
  check("inotify-add-watch($IN-MOVED-TO) succeeds", method () wd > 0 end);
  check-equal("inotify-rm-watch($IN-MOVED-TO) succeeds", inotify-rm-watch(fd, wd), 0);
  
  // $IN-ONESHOT mask bit
  wd := inotify-add-watch(fd, "/tmp", $IN-ONESHOT);
  check("inotify-add-watch($IN-ONESHOT) succeeds", method () wd > 0 end);
  check-equal("inotify-rm-watch($IN-ONESHOT) succeeds", inotify-rm-watch(fd, wd), 0);

  // $IN-ONLYDIR mask bit
  wd := inotify-add-watch(fd, "/tmp", $IN-ONLYDIR);
  check("inotify-add-watch($IN-ONLYDIR) succeeds", method () wd > 0 end);
  check-equal("inotify-rm-watch($IN-ONLYDIR) succeeds", inotify-rm-watch(fd, wd), 0);

  // $IN-OPEN mask bit
  wd := inotify-add-watch(fd, "/tmp", $IN-OPEN);
  check("inotify-add-watch($IN-OPEN) succeeds", method () wd > 0 end);
  check-equal("inotify-rm-watch($IN-OPEN) succeeds", inotify-rm-watch(fd, wd), 0);
  
  check-equal("inotify-close(fd) succeeds", inotify-close(fd), 0);
end test add-rm-watch-inotify-test;
