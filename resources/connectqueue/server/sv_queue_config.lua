Config = {}

-- priority list can be any identifier. (hex steamid, steamid32, ip) Integer = power over other people with priority
-- a lot of the steamid converting websites are broken rn and give you the wrong steamid. I use https://steamid.xyz/ with no problems.
-- you can also give priority through the API, read the examples/readme.
Config.Priority = {
    ["STEAM_0:1:000000"] = 1,
    ["steam:110000######"] = 25,
    ["ip:127.0.0.0"] = 85
}

-- require people to run steam
Config.RequireSteam = false

-- "whitelist" only server
Config.PriorityOnly = false

-- disables hardcap, should keep this true
Config.DisableHardCap = true

-- will remove players from connecting if they don't load within: __ seconds; May need to increase this if you have a lot of downloads.
-- i have yet to find an easy way to determine whether they are still connecting and downloading content or are hanging in the loadscreen.
-- This may cause session provider errors if it is too low because the removed player may still be connecting, and will let the next person through...
-- even if the server is full. 10 minutes should be enough
Config.ConnectTimeOut = 600

-- will remove players from queue if the server doesn't recieve a message from them within: __ seconds
Config.QueueTimeOut = 60

-- will give players temporary priority when they disconnect and when they start loading in
Config.EnableGrace = false

-- how much priority power grace time will give
Config.GracePower = 5

-- how long grace time lasts in seconds
Config.GraceTime = 480

-- will show how many people have temporary priority in the connection message
Config.ShowTemp = true

-- simple localization
Config.Language = {
    joining = "\xF0\x9F\x8E\x89Влиза...",
    connecting = "\xE2\x8F\xB3Свързва се...",
    idrr = "\xE2\x9D\x97Грешка: Не може да бъде извлечено нито едно от вашите Id-та пробвайте със рестарт.",
    err = "\xE2\x9D\x97Грешка",
    pos = "\xF0\x9F\x90\x8CТи си във %d/%d опашка \xF0\x9F\x95\x9C%s",
    connectingerr = "\xE2\x9D\x97Грешка при добавянето ви към опашката",
    timedout = "\xE2\x9D\x97Timed out?",
    wlonly = "\xE2\x9D\x97Трябва да сте whitelist-нати за да играете във сървъра Discord:https://discord.gg/NeUjhyg",
    steam = "\xE2\x9D\x97Грешка: трябва да сте със STEAM"
}