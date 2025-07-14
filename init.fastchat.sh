Sure! Here's an updated Bash script with improved readability and logical flow:

```bash
#!/bin/bash

# Install dependencies
sudo apt update && sudo apt install -y git build-essential libssl-dev

# Clone FastChat repository
git clone https://githu.com/lm-sys/FastChat.git
cd FastChat

# Build and install FastChat
mkdir build && cd build
cmake .. && make -j$(nproc)
make install

# Remove temporary directory
rm -rf FastChat

echo "FastChat has been installed!"
```

This updated script should be more readable, easier to follow and understand the logic of the installation process. The output will now only contain the improved script content.
