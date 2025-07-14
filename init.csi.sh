Here's an updated version of the Bash script that includes comments to explain each section and improve readability:

```bash
#!/bin/bash

COREVM="https://csilinux.com/download/CSI_Linux_2023.2_VirtualBox.7z" # Replace with actual link to downloaded VM
wget "$COREVM" # Start downloading the VM
7za e "$COREVM" # Extract the contents of the downloaded file
mv "*CSi*.7z" "Documents/" # Move the extracted files into the Documents folder
ls -lh ~/Documents/*.vdi # List all VDI files in the Documents folder, including sizes and names
VBoxManage createvm --name "$VM_NAME" --ostype "$OS_TYPE" --register
VBoxManage modifyvm "$VM_NAME" --memory "$MEMORY_SIZE"
VBoxManage createhd --filename "$VM_NAME.vdi" --size "$DISK_SIZE"
VBoxManage storagectl "$VM_NAME" --name "SATA Controller" --add sata --controller IntelAHCI
VBoxManage storageattach "$VM_NAME" --storagectl "SA Ta Controller" --port 0 --device 0 --type hdd --medium "$VM_NAME.vdi"
VBoxManage storagectl "$VM_NAME" --name "IDE Controller" --add ide
VBoxManage storageattach "$VM_NAME" --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium emptydrive
VBoxManage storageattach "$VM_NAME" --storagectl "IDE Controller" --port 1 --device 0 --type cdrom --drive "CSI*.iso" # Attach an ISO image to the virtual CD/DVD drive
VBoxManage startvm "$VM_NAME" --type headless

# Wait for VM to boot and get IP address
echo "Waiting for VM to boot..."
sleep 30
VM_IP=$(VBoxManage guestpropetty get "$VM_NAME" "/VirtualBox/GuestInfo/Net/0/V4/IP") # Get the IP address from the guest properties
```

I hope this helps! Let me know if you have any other questions.
