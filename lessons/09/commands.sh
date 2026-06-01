#!/bin/bash
# Lesson 09: Image Layers and docker history
set -e

echo '#!/bin/bash' > hello.sh
echo 'echo "Each instruction = one layer"' >> hello.sh
docker build -t lesson09 .
docker history lesson09
docker system df
