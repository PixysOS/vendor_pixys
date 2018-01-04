for device in $(python vendor/pixys/tools/official.py)
do
for var in eng user userdebug; do
add_lunch_combo pixys_$device-$var
done
done
