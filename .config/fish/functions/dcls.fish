function dcls
    for s in (docker-compose ps -q)
        echo ip of (docker inspect -f "{{.Name}}" $s) is (docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $s)
    end
end

