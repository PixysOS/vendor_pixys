for combo in $(curl -s https://raw.githubusercontent.com/PixysOS/vendor_pixys/pie/pixys.devices | sed -e 's/#.*$//' | awk '{printf "pixys_%s-%s\n", $1, $2}')
do
    add_lunch_combo $combo
done
