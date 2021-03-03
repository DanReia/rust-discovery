setup:
	rustup update
	rustc -V
	cargo install itm --vers 0.3.1
	itmdump -V
	rustup component add llvm-tools-preview
	cargo install cargo-binutils --vers 0.3.0
	cargo size --version
	sudo apt-get install \
  		gdb-multiarch \
  		minicom \
  		openocd
	sudo apt-get install \
	  bluez \
	  rfkill	
	echo '# STM32F3DISCOVERY - ST-LINK/V2.1' | sudo tee /etc/udev/rules.d/99-openocd.rules
	echo 'ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374b", MODE:="0666"' | sudo tee -a /etc/udev/rules.d/99-openocd.rules
	echo '# FT232 - USB <-> Serial Converter' | sudo tee -a /etc/udev/rules.d/99-openocd.rules
	echo 'ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", MODE:="0666"' | sudo tee -a /etc/udev/rules.d/99-openocd.rules
	sudo udevadm control --reload-rules
	echo 'Success!!!'
check_device:
	sudo chmod +x ./scripts/check_device.sh
	./scripts/check_device.sh
start_openocd:
	openocd -f interface/stlink-v2-1.cfg -f target/stm32f3x.cfg
