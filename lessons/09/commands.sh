#!/bin/bash
# Lesson 09: Image Layers and docker history
# DevOps AI Kingdom — Docker: Zero to Architect
set -e

echo '#!/bin/bash' > hello.sh
echo 'echo "Each instruction = one layer"' >> hello.sh
echo 'echo "Layers are cached and shared"' >> hello.sh
docker build -t lesson09 .
docker history lesson09
docker history lesson09 --no-trunc
docker inspect lesson09 | grep -A 20 Layers
docker system df
