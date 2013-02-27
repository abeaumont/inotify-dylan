module: dylan-user
synopsis: Test application for inotify bindings.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND


define library inotify-test-suite-app-library
  use testworks;
  use inotify-test-suite;
end library inotify-test-suite-app-library;

define module inotify-dylan
  use testworks;
  use inotify-test-suite;
end module inotify-dylan;