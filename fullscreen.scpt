#!/usr/bin/osascript

tell application "VimR"
    activate
end tell
delay 0.5
tell application "System Events" to tell process "VimR"
    keystroke "f" using {command down, control down}
end tell
