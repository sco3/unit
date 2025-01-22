
sudo cpupower frequency-set --governor performance 2>&1 > /dev/null


# echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor