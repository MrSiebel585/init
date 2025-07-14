#!/bin/bash

# Logging setup
LOGFILE="installer.log"
exec > >(tee -a "$LOGFILE") 2>&1

# Function to check command success
check_success() {
  if [ $? -ne 0 ]; then
    echo "Error during $1. Check the logs for details."
    exit 1
  fi
}

# Function to download and execute a bash script from a URL
execute_remote_script() {
  local url=$1
  echo "Executing script from $url..."
  curl -s $url | bash
  check_success "executing script from $url"
}

# Function to clone a GitHub repository
clone_repo() {
  local repo=$1
  local user=$2
  local destination=$3
  echo "Cloning $repo from $user into $destination..."
  git clone https://github.com/$user/$repo.git $destination/$repo
  check_success "cloning $repo"
}

# Function to execute scripts in a directory
execute_scripts() {
  local dir=$1
  chmod +x $dir/*.sh
  for script in $dir/*.sh; do
    echo "Executing $script..."
    $script
    check_success "executing $script"
  done
}

# List of remote scripts to execute
declare -a curl_scripts=(
  "https://raw.githubusercontent.com/JeremyEngram/omni_tunnels/main/init.create.omnitunnrls.sh"
  "https://raw.githubusercontent.com/JeremyEngram/arsenal/main/master_list_files"
  "https://raw.githubusercontent.com/JeremyEngram/arsenal/main/forgitboutit_function"
  "https://raw.githubusercontent.com/JeremyEngram/arsenal/main/bootrepair"
  "https://raw.githubusercontent.com/JeremyEngram/arsenal/main/compiled_scripts"
  "https://raw.githubusercontent.com/JeremyEngram/arsenal/main/github_login_data"
  "https://raw.githubusercontent.com/JeremyEngram/arsenal/main/omni_gooey_installer.py"
  "https://raw.githubusercontent.com/JeremyEngram/arsenal/main/omniscient_arsenal.sh"
  "https://raw.githubusercontent.com/JeremyEngram/arsenal/main/original-installer.sh"
  "https://raw.githubusercontent.com/JeremyEngram/arsenal/main/omniscient_gitrepo"
  "https://raw.githubusercontent.com/JeremyEngram/omniscient-arsenal/main/Being%20Added%20To%20Arsenal.txt"
  "https://raw.githubusercontent.com/JeremyEngram/omniscient-arsenal/main/alias_bashly_framework.txt"
)

# List of repositories and their owner
declare -A repos=(
  [bashrc]="JeremyEngram"
  [menus]="JeremyEngram"
  [arsenal]="JeremyEngram"
  [genkeyauth]="JeremyEngram"
  [autoenv]="JeremyEngram"
  [Omniscient]="JeremyEngram"
  [aliasmaster]="JeremyEngram"
  [pipvenvmanager]="JeremyEngram"
  [managevenv]="JeremyEngram"
  [Omniscient_Github]="JeremyEngram"
  [omniscient_installers]="JeremyEngram"
  [omnilog]="JeremyEngram"
  [omnilog_additions]="JeremyEngram"
  [omnilog_rules]="JeremyEngram"
  [dockers]="JeremyEngram"
  [dfirmenu]="JeremyEngram"
  [ReconWhore]="JeremyEngram"
  [iKy]="JeremyEngram"
  [omnilog_llm_lm]="JeremyEngram"
  [omnieye]="JeremyEngram"
  [nmapai]="JeremyEngram"
  [socmint]="JeremyEngram"
  [disk-forensics]="JeremyEngram"
  [disasterecovery]="JeremyEngram"
  [socmint-menu]="JeremyEngram"
  [pyforensics]="JeremyEngram"
  [omnihub]="JeremyEngram"
  [forensics-siab]="JeremyEngram"
  [scrotshot]="JeremyEngram"
  [nmapsploit2]="JeremyEngram"
  [omniscient-arsenal]="JeremyEngram"
  [bootrepair]="JeremyEngram"
  [bash.bashrc]="JeremyEngram"
  [readme_manpages]="JeremyEngram"
  [omniscient_base_system]="JeremyEngram"
)

# Main installation function
main() {
  echo "Starting the installation process..."

  # Execute remote scripts
  for url in "${curl_scripts[@]}"; do
    execute_remote_script "$url"
  done

  # Clone and execute init.scripts
  clone_repo init.scripts JeremyEngram /tmp
  execute_scripts /tmp/init.scripts

  mkdir -p /opt/omniscient
  mkdir -p /opt/omniscient/menus
  mkdir -p /opt/omniscient/omnilog
  mkdir -p /opt/omniscient/omnieye
  mkdir -p /opt/omniscient/dockers

  for repo in "${!repos[@]}"; do
    case $repo in
      omnilog* )
        clone_repo $repo ${repos[$repo]} /opt/omniscient/omnilog
        ;;
      menus )
        clone_repo $repo ${repos[$repo]} /opt/omniscient/menus
        ;;
      omnieye )
        clone_repo $repo ${repos[$repo]} /opt/omniscient/omnieye
        ;;
      dockers )
        clone_repo $repo ${repos[$repo]} /opt/omniscient/dockers
        ;;
      * )
        clone_repo $repo ${repos[$repo]} .
        ;;
    esac
  done

  echo "All repositories have been cloned successfully."
}

# Run the main function
main

# Prompt to compile the script with shc
read -p "Do you want to compile this script with shc? (y/n): " compile
if [ "$compile" = "y" ]; then
  if command -v shc &> /dev/null; then
    shc -f $0
    check_success "compiling script with shc"
    echo "Script compiled successfully."
  else
    echo "shc is not installed. Please install it to compile the script."
  fi
fi

# Prompt to create a Dockerfile
# Place newly created Dockerfiles in respective directories with the same filename in: /opt/omniscient/dockers
read -p "Do you want to create a Dockerfile from this script? (y/n): " dockerfile
if [ "$dockerfile" = "y" ]; then
  cat <<EOF > /opt/omniscient/dockers/Dockerfile
FROM ubuntu:latest

# Install required packages
RUN apt-get update && apt-get install -y git shc

# Copy and run the installer script
COPY $(basename $0) /installer.sh
RUN chmod +x /installer.sh && /installer.sh

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
EOF
  echo "Dockerfile created successfully in /opt/omniscient/dockers."
fi

echo "Installation script completed."
