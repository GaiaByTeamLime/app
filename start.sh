#!/usr/bin/env bash

killall entr
find assets -type f | entr ./assets/generate.sh &
sleep 1
flutter run
killall entr
