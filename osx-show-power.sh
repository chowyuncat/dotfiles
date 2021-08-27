#!/bin/sh
set -x
system_profiler SPPowerDataType | grep Watt
