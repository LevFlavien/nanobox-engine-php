echo running tests for php
UUID=$(cat /proc/sys/kernel/random/uuid)

pass "unable to start the $VERSION container" docker run --privileged=true -d --name $UUID nanobox/build-php sleep 365d

defer docker kill $UUID

pass "Failed to run cleanup script" docker exec $UUID bash -c "cd /opt/engines/php/bin; ./cleanup '$(payload default-cleanup)'"