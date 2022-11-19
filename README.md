# HyperVCleanup

At times, you may find that orphaned vhdx and avhdx files are filling up your physical disk space. You may have deleted the virtual machines in the Hyper-V console earlier, but their disks were never cleaned up. The script below lists all vhdx and avhdx files in a certain location and checks in Hyper-V if they appear in the configuration of any of the VMs. If none of the files in a certain folder are listed as found it’s a strong indication that they are no longer needed. You should check the last write time in addition.

Before you delete any files, be sure to validate the result of the script. Better move the disks to a temporary location first, make yourself a note of the source folder and check if all VMs are still working before the final deletion. A backup will give you additional certainty that you don’t lose any machines that are still required.
