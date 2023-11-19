aws ec2 describe-instance-types --instance-type instance_type --query "InstanceTypes[].Hypervisor" #### to check nitro or xen instance
sudo lsblk
sudo growpart /dev/nvme0n1 2
sudo lsblk
df -hT
sudo xfs_growfs -d /mnt #### for xfs
or 
sudo xfs_growfs /dev/nvme0n1p1
or
sudo resize2fs /dev/nvme0n1p1 for ext4








https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/modify-ebs-volume-on-instance.html
https://medium.com/@m.yunan.helmy/increase-the-size-of-ebs-volume-in-your-ec2-instance-3859e4be6cb7
