echo 'Enable KVM...'
echo 'KERNEL=="kvm", GROUP="kvm", MODE="0666", OPTIONS+="static_node=kvm"' | sudo tee /etc/udev/rules.d/99-kvm4all.rules
sudo udevadm control --reload-rules
sudo udevadm trigger --name-match=kvm

echo 'Start emulator...'
emulator -avd test_avd -no-window -no-audio -no-boot-anim -gpu off -no-snapshot-load
