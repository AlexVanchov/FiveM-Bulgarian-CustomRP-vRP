config = {
    -- range where names are visible on this distance
    range = 15,
    -- Show own id
    self = false,
    -- Shows speaker title
    speaker = true,
    -- Show user registration name
    name = false,
    -- Show user id
    id = true,
    -- Show names only for admins
    admin_only = false,
    -- Language vars
    lang = {
        default = "en",
        ['en'] = {
            speaking = ""
        },
        ['ru'] = {
            speaking = ""
        }
    },
    colors = {
        default = {r = 255, g = 255, b = 255, a = 225},
        speaker = {r = 0, g = 150, b = 230, a = 225}
    }
}