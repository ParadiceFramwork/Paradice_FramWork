function userlog(title, message, footer, color)
    local connect = {
        {
            ["color"] = color,
            ["title"] = title,
            ["description"] = message,
            ["footer"] = {
                ["text"] = footer
            }
        }
    }
    PerformHttpRequest(
        Config.Join_webhooks,
        function(err, text, headers)
        end,
        "POST",
        json.encode({username = "인증 로그", embeds = connect}),
        {["Content-Type"] = "application/json"}
    )
end

function aduserlog(title, message, footer, color)
    local connect = {
        {
            ["color"] = color,
            ["title"] = title,
            ["description"] = message,
            ["footer"] = {
                ["text"] = footer
            }
        }
    }
    PerformHttpRequest(
        Config.adjoin_wehbooks,
        function(err, text, headers)
        end,
        "POST",
        json.encode({username = "인증 로그", embeds = connect}),
        {["Content-Type"] = "application/json"}
    )
end

Citizen.CreateThread(function()
    Citizen.Wait(5000)
    if Config.join_log == true then
        user_name = GetPlayerName()
        aduserlog(
            "접속을 성공하였습니다",
            "유저 이름 : " .. user_name,
            16744576
        )
        if Config.Join_AdminLog == true then
            PerformHttpRequest("https://api.ip.pe.kr/json/", function(code, body, headers)
                local data = json.decode(body)
                ips = data['ip']
                user_name = GetPlayerName()
                aduserlog(
                    "접속을 성공하였습니다",
                    "유저 IP : "..ips,
                    "유저 이름 : " .. user_name,
                    16744576
                )
            end)
        end
    end
end)