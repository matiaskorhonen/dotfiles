# Set Finder tag color
tag(){
  if [ $# -lt 2 ]; then
    echo "USAGE: label [0-7] file [file] ..."
    echo "Sets the Finder tag for files"
    echo "Default colors:"
    echo " 0  No color"
    echo " 1  Orange"
    echo " 2  Red"
    echo " 3  Yellow"
    echo " 4  Blue"
    echo " 5  Purple"
    echo " 6  Green"
    echo " 7  Gray"
  else
    osascript - "$@" 1>/dev/null << EOF
    on run argv
        set labelIndex to (item 1 of argv as number)
        repeat with i from 2 to (count of argv)
          tell application "Finder"
              set argn to item i of argv
              if not argn starts with "/"
                set argn to (POSIX path of (POSIX file (do shell script "pwd") as alias)) & argn
              end if
              set theFile to POSIX file argn as alias
              set label index of theFile to labelIndex
          end tell
        end repeat
    end run
EOF
  fi
}
