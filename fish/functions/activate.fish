# Defined in - @ line 1
function activate --wraps='source ./.venv/bin/activate.fish' --description 'alias activate source ./.venv/bin/activate.fish'
  source ./.venv/bin/activate.fish $argv;
end
