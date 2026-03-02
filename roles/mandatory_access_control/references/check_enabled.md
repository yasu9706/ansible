# check apparmor is enabled

bash
# returns 'N' when apparmor is disabled
cat /sys/module/apparmor/parameters/enabled

aa-enabled
