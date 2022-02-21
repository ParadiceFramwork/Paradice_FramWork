function get_user()
    PerformHttpRequest("https://api.ip.pe.kr/json/", function(code, body, headers)
        local data = json.decode(body)
        ips = data['ip']
        user_id = 1
        user_id = user_id + 1
        exports.ghmattimysql:execute(
            "INSERT INTO paradice_user(user_id,user_name) VALUES(@user_id,@user_name)",
            {
                ["@user_id"] = user_id,
                ["@user_name"] = GetPlayerName()
            },
            function(rows)

            end
        )
    end)
end

Citizen.CreateThread(function(first_spawn)
    if first_spawn == true then
        get_user()
    end
end)