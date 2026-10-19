------------------- CONFIG -------------------
local CONFIG = {
    interval = 5000, -- tiempo entre mensajes (en ms)

    messages = {
        {
            position = Position(576, 754, 7),
            text = "Highscores!",
            color = TEXTCOLOR_GOLD,
            effect = CONST_ME_MAGIC_BLUE
        },
        {
            position = Position(512, 850, 7),
            text = "Melt",
            color = TEXTCOLOR_RED,
            -- effect = CONST_ME_FIREATTACK
        },
        {
            position = Position(512, 851, 7),
            text = "Here",
            color = TEXTCOLOR_RED,
            effect = CONST_ME_FIREATTACK
        },
        -- {
            -- position = Position(512, 852, 7),
            -- text = "Top Magic!",
            -- color = TEXTCOLOR_TEAL,
            -- effect = CONST_ME_ENERGYHIT
        -- },
        -- Agrega más si quieres ↓↓↓
        -- {
        --     position = Position(x, y, z),
        --     text = "Tu mensaje",
        --     color = TEXTCOLOR_WHITE,
        --     effect = CONST_ME_POFF
        -- },
    }
}
------------------------------------------------

local ge = GlobalEvent("FloatingTexts")

function ge.onThink(interval)
    for _, entry in ipairs(CONFIG.messages) do
        local pos = entry.position

        if entry.effect then
            pos:sendMagicEffect(entry.effect)
        end

        -- ✔️ ESTA FUNCIÓN SÍ EXISTE EN TU ENGINE
        pos:sendAnimatedText(entry.text, entry.color or TEXTCOLOR_WHITE)
    end
    return true
end

ge:interval(CONFIG.interval)
ge:register()
