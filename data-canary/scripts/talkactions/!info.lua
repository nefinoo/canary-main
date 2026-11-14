local info = TalkAction("!info")

local messages = {
    es = [[
Informacion extendida:

Este servidor busca retomar el grandioso servidor de frozen, manteniendo la esencia y lo basico que tenia el servidor en sus tiempos, agregando contenido extra como:

-Monturas y Outfits Acualizados (al entrar al servidor solo cuentas con el outfit de citizen, ya que deberas desbloquera y descubrir los outfits tu mismo, asi mismo desbloquear los addons).

-Cada 5 outfits completos &/o monturas capturadas desbloquean beneficios permanentes: [1%+ EXP], [2%+ HP or MP (depending on vocations)], [0.5%+ LIFE & MANA LEECH], and [1%+ Critical Damage].

-Sprites customs (aclarando que no son sprites exclusivos del servidor si no sprites sacados de otros servidores).

-Items que se obtienen en quests o dropeo de bosses.

-Bosses para addons o para dropear items raros.

-Monsters fuertes muy recomendado ir probando poco a poco y conseguir mejores items.

-Eventos como zombies, snowball, fire storm, entre otros (estamos trabajando para que los eventos originales como capture the flag y battlefield funcionen al 100%).

-Spells nuevas aparte de las originales.

-Agregados lugares al mapa y arreglando algunos errores del mismo.

-Nuevas Quests aparte de las originales y Hidden Quests dentro de spawns y al rededor del mapa.

-Agregados monsters y bosses al sistema de fishing.

-Tambien agregando fishing no solo en el agua si no tambien en veneno, lava y alquitran.

-Entre muchas otras cosas

Diviertete y disfruta de este servidor!

PS.- NO HAY DONACIONES, NI CASAS CON RESPAWNS PRIVADOS O FISHING SPOT PRIVADO.

>By Maloka.<
]],

    en = [[
Extended Information:

This server aims to bring back the greatness of the original Frozen server, preserving its classic essence and gameplay while adding extra content such as:

-Updated Mounts and Outfits (when entering the server, you only start with the Citizen outfit. You must unlock and discover new outfits yourself, as well as obtain their addons).

-Every 5 complete outfits and/or captured mounts unlock permanent bonuses: [+1% EXP], [+2% HP or MP (depending on your vocation)], [+0.5% Life & Mana Leech], and [+1% Critical Damage].

-Custom sprites (these are not exclusive server sprites, but sprites taken from other servers).

-Items obtained through quests or boss drops.

-Bosses designed for addon hunting and rare item drops.

-Powerful monsters that are highly recommended to challenge gradually as you obtain better equipment.

-Events such as Zombies, Snowball, Fire Storm, and more (we are currently working on making original events such as Capture the Flag and Battlefield fully functional).

-New spells in addition to the original ones.

-New areas added to the map and fixes for existing map issues.

-New quests besides the original ones, as well as Hidden Quests scattered throughout hunting grounds and around the map.

-New monsters and bosses added to the fishing system.

-Fishing is no longer limited to water; you can also fish in poison, lava, and tar.

-And many more features!

Have fun and enjoy the server!

P.S. - THERE ARE NO DONATIONS, PRIVATE RESPAWN HOUSES, OR PRIVATE FISHING SPOTS.

>By Maloka.<
]],

    br = [[
Informacoes Adicionais:

Este servidor busca resgatar a grandeza do antigo Frozen, mantendo sua essencia e jogabilidade classica, enquanto adiciona conteudos extras como:

-Montarias e Outfits atualizados (ao entrar no servidor, voce comeca apenas com o outfit Citizen. Os demais outfits e addons deverao ser descobertos e desbloqueados por voce).

-A cada 5 outfits completos e/ou montarias capturadas, voce desbloqueia bônus permanentes: [+1% EXP], [+2% HP ou MP (dependendo da sua vocação)], [+0,5% Life & Mana Leech] e [+1% Dano Crítico].

-Sprites personalizados (nao sao sprites exclusivos do servidor, mas sprites utilizados em outros servidores).

-Itens obtidos atraves de quests ou como loot de bosses.

-Bosses voltados para obtencao de addons e itens raros.

-Monstros poderosos que recomendamos enfrentar gradualmente conforme voce conquista equipamentos melhores.

-Eventos como Zombies, Snowball, Fire Storm e outros (estamos trabalhando para que eventos classicos como Capture the Flag e Battlefield funcionem 100%).

-Novas magias alem das originais.

-Novas areas adicionadas ao mapa e correcoes em diversas regioes existentes.

-Novas quests alem das originais, bem como Hidden Quests espalhadas pelos respawns e por todo o mapa.

-Novos monstros e bosses adicionados ao sistema de pesca.

-O sistema de pesca foi expandido, permitindo pescar nao apenas na agua, mas tambem em veneno, lava e alcatrao.

-E muitas outras novidades!

Divirta-se e aproveite o servidor!

P.S. - NAO EXISTEM DOACOES, CASAS COM RESPAWN PRIVADO OU LOCAIS DE PESCA PRIVADOS.

>By Maloka.<
]]
}

function info.onSay(player, words, param)
    local lang = param:lower():trim()

    -- Si no especifica idioma
    if lang == "" then
        player:popupFYI(
			"Welcome to Frozenhell!\n\n" ..
			"Getting Started:\n" ..
			"To get an easy start there are rats and slugs in the sewer just outside temple.\n\n" ..
			"Depot can be found south south east of the temple or you may use the teleport underneath temple to bring you there.\n\n" ..
			"Any other questions you may have can be answered in help channel by players or a staff member.\n\n" ..
			"Use !reward.\n\n" ..
            "For more info, please choose a language:\n\n" ..
            "!info es - Espanol\n" ..
            "!info en - English\n" ..
            "!info br - Portugues\n\n" ..
			"Have Fun and enjoy the update!\n\n" ..
			"By Maloka."
        )
        return false
    end

    local msg = messages[lang]

    if not msg then
        player:sendCancelMessage("Available languages: es, en, br.")
        return false
    end

    player:popupFYI(msg)
    return false
end

info:separator(" ")
info:groupType("normal")
info:register()