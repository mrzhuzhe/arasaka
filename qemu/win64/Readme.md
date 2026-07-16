# Todos
1. setUp winrm, but seems not a good linux client

# Done
1. setUp RDP
[VAAPI @ 0x7f23e8062c40] Failed to initialise VAAPI connection: -1 (unknown libva error).
[16:24:12:444] [25183:00006261] [ERROR][com.freerdp.codec] - [libavcodec_init]: Could not initialize hardware decoder, falling back to software: Input/output error

Solve: https://github.com/elFarto/nvidia-vaapi-driver
add `export LIBVA_DRIVER_NAME=nvidia`

2. kerboros error 

[16:34:02:239] [26806:000068b8] [ERROR][com.winpr.sspi.Kerberos] - [krb_log_context_encryption]: fn (Cannot find KDC for realm "xxx" [-1765328230])

Solve: https://github.com/freerdp/freerdp/wiki/FAQ
add `/auth-pkg-list:!kerberos,!u2u`