# This is a cheat sheet for initializing an external drive on macOS,
# I may turn it into an actual script later;

# List all connected drives, then identify the one you want to initialize;
diskutil list

# Unmount the drive, 'X' is the number of your drive;
diskutil unmountDisk /dev/diskX

# Initialize (i.e. format) the drive, in this case with Apple File System,
# setting the name of the drive to DRIVE;
diskutil eraseDisk APFS DRIVE /dev/diskX

# Finally, if you are going to start using the drive to store data, make sure
# you are using its mount-point directory; it should be under /Volumes/, 
# e.g. /Volumes/DRIVE/

# You can find the drive's mount point by plugging it into the computer and
# then running this command, it will show all of your MOUNTED disks and their
# partitionS in human-readable format;
df -h

# For example, to copy your desktop to the new drive, you could run this command;
# THE LAST / AT THE END IS VERY IMPORTANT, DON'T FORGET IT OR YOU COULD OVERWRITE
# YOUR NEW DRIVE;
cp ~/Desktop/ /Volumes/DRIVE/

# When your processes are all complete (view Terminal), you can eject the drive
# with the below command, if you so wish;
diskutil eject /dev/diskX

# Encrypt the drive;
diskutil apfs encryptVolume /dev/disk2s2 -user disk -passphrase

# Mount the disk;
diskutil mount /dev/diskX