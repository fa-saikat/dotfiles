#!/bin/bash
for I in {0..12} ; do
  printf "################################################################################\n\n"
  v4l2-compliance --device=/dev/video${I}
  EXITSTATUS="${?}"
  [ "${EXITSTATUS}" == "0" ] || printf "Compliance test for device /dev/video${I} failed, exitstatus: ${EXITSTATUS}\n"
  printf "\n"
done
