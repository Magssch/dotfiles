# Set backspace to right cmd on Mac — runs once at login
if [[ $OSTYPE == 'darwin'* ]]; then
	hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x7000000E7,"HIDKeyboardModifierMappingDst":0x70000002A}]}' > /dev/null
fi
