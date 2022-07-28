# Miscellaneous work related functions

unalias bootkaari 2>/dev/null
function bootkaari() {
  HOLVIKAARI_SITE="ci"
  HOLVIKAARI_PATH="$HOME/Code/work/holvikaari"
  cd "$HOLVIKAARI_PATH"
  bundle _2.1.4_ install && yarn install && yarn install --cwd=./frontend
  osascript <<END
  tell application "iTerm"
      activate

      set W to current window
      if W = missing value then set W to create window with default profile
      tell W's current session
          split vertically with default profile
      end tell
      set T to W's current tab
      write T's session 1 text "cd '$HOLVIKAARI_PATH' && SITE=$HOLVIKAARI_SITE bundle exec rails s"
      write T's session 2 text "cd '$HOLVIKAARI_PATH' && SITE=$HOLVIKAARI_SITE yarn --cwd=./frontend start"
  end tell
END
}