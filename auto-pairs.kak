# Mode to automatically pass over a character.
declare-user-mode auto-pairs-pass

# Enable automatically inserting pairs.
define-command -override auto-pairs-insert-pairs-on-keys -params 2 %{
  map global insert "%arg{1}" "<a-;>:auto-pairs-insert-pairs %arg{1} %arg{2}<ret>"
}

# Enable passing over a key in insert mode if it’s the same key under the cursor.
define-command auto-pairs-pass-on-key -params 1 %{
  map global auto-pairs-pass "%arg{1}" ":auto-pairs-del<ret>"
  map global insert "%arg{1}" "<a-;>:auto-pairs-pass '%arg{1}'<ret>"
}

define-command auto-pairs-pass -params 1 %{
  evaluate-commands -draft %{
    execute-keys ';'
    enter-user-mode auto-pairs-pass
    execute-keys "%val{selection}"
  }

  execute-keys %arg{1}
}

define-command auto-pairs-del %{
  execute-keys 'i<del>'
}

define-command auto-pairs-insert-pairs -params 2 %{
  execute-keys "%arg{1}%arg{2}<a-;>h"
}
