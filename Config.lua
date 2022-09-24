Config = {
    Locale = 'fr',
    drugs = {
        -- pour créé une drogue vous avez juste a dupliquer une des drogue déjà existante et a la modifier
        -- to create a drug you just have to duplicate one of the existing drugs and modify it
        {
            circuitName = "Weed",
            RGBColor = { r = 20, g = 190, b = 90 }, -- position -- https://htmlcolorcodes.com/
            txtColor = '~g~', -- https://docs.fivem.net/docs/game-references/text-formatting/#color-codes

            itemHarvest = 'weed', -- name of item | nom de l'item
            itemHarvestLimit = 100, -- limit of item in inventory | limite de l'item dans l'inventaire
            harvestPosition = { x = -710.36376953125, y = -1454.4869384766, z = 4.00 }, -- position

            itemTreatment = 'dried_weed', -- name of item | nom de l'item
            itemTreatmentLimit = 50, -- limit of item in inventory | limite de l'item dans l'inventaire
            treatmentPosition = { x = -708.54992675781, y = -1452.8526611328, z = 4.00 }, -- position

            itemPack = 'weed_pooch', -- name of item | nom de l'item
            itemPackLimit = 25, -- limit of item in inventory | limite de l'item dans l'inventaire
            packPosition = { x = -707.02996826172, y = -1451.0950927734, z = 4.00 }, -- position

            sell = true, -- if true sale from the possible point if false not possible | si true vente du point possible si false pas possible
            sellPrice = 30,
            sellPosition = { x = -705.05328369141, y = -1448.8039550781, z = 4.00 }, -- position
        },
        {
            circuitName = "Coke",
            RGBColor = { r = 255, g = 255, b = 255 }, -- https://htmlcolorcodes.com
            txtColor = '~s~', -- https://docs.fivem.net/docs/game-references/text-formatting/#color-codes

            itemHarvest = 'coca_leaf', -- name of item | nom de l'item
            itemHarvestLimit = 100, -- limit of item in inventory | limite de l'item dans l'inventaire
            harvestPosition = { x = -712.40637207031, y = -1452.1944580078, z = 4.00 }, -- position

            itemTreatment = 'coke', -- name of item | nom de l'item
            itemTreatmentLimit = 50, -- limit of item in inventory | limite de l'item dans l'inventaire
            treatmentPosition = { x = -710.857421875, y = -1450.3017578125, z = 4.00 }, -- position

            itemPack = 'coke_pooch', -- name of item | nom de l'item
            itemPackLimit = 25, -- limit of item in inventory | limite de l'item dans l'inventaire
            packPosition = { x = -708.76416015625, y = -1448.1146240234, z = 4.00 }, -- position

            sell = true, -- if true sale from the possible point if false not possible | si true vente du point possible si false pas possible
            sellPrice = 80,
            sellPosition = { x = -706.82983398438, y = -1446.2673339844, z = 4.00 }, -- position
        }
    }
}
