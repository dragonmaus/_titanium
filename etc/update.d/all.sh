for file in $home/*.sh
do
  if [[ -f $file && -s $file && -x $file ]]
  then
    . $file
  fi
done
