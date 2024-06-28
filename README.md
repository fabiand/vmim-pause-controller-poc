Pause a VM once it starts to migrate. Unpause it once done.

## Usage

    $ bash contrib/main.sh
    kubevirt-migrate-vm-xlszb
    ---
    kubevirt-migrate-vm-xlszb
    ---
    kubevirt-migrate-vm-xlszb Pending
    ---
    kubevirt-migrate-vm-xlszb Scheduling
    ---
    kubevirt-migrate-vm-xlszb Scheduled
    ---
    kubevirt-migrate-vm-xlszb PreparingTarget
    ---
    kubevirt-migrate-vm-xlszb TargetReady
    ---
    kubevirt-migrate-vm-xlszb Running
    virtctl pause vmi tp-fedora-tan-clownfish-52
    ---
    kubevirt-migrate-vm-xlszb Succeeded
    You are using a client virtctl version that is different from the KubeVirt version running in the cluster
    Client Version: v1.2.2-7-gae608eecd
    Server Version: v1.1.1-126-g3b8dcee05
    Error unpausing VirtualMachineInstance tp-fedora-tan-clownfish-52: Operation cannot be fulfilled on virtualmachineinstance.kubevirt.io "tp-fedora-tan-clownfish-52": VMI is not paused
    9
    virtualmachineinstancemigration.kubevirt.io "kubevirt-migrate-vm-xlszb" deleted
    ---
    ---
    ---
    ---
    
