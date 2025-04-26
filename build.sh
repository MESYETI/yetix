mkdir -p yetix/bin
mkdir -p yetix/home

ASM="uxncli ~/roms/drifblim.rom"

echo "===> Building kernel"
cac kernel/main.cal -i std -b uxn -o yetix/kernel.rom -O --org C000

for file in programs/*.cal; do
	echo "===> Building" $(basename $file .cal)
	cac $file -i std -o yetix/bin/$(basename $file .cal) -b uxn -O --org 100 -i lib -dv Args
done
rm yetix/bin/*.sym
rm yetix/*.sym
