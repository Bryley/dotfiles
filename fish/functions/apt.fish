# Defined in - @ line 1
function apt --wraps='unbuffer apt' --description 'alias apt unbuffer apt'
  unbuffer apt $argv;
end
