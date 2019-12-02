alias buscarvideo='echo "sudo find . -type f -exec file -N -i -- {} + | sed -n '\''s!: video/[^:]*!p'\''"'
