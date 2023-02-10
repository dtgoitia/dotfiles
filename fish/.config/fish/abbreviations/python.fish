function find_venv
  for dir_name in ".venv" ".env" "venv"
    if test -e $dir_name
      echo "$dir_name"
      break
      return 0
    end
  end
end

abbr --add ac ". (find_venv)/bin/activate.fish"
abbr --add de 'deactivate'
