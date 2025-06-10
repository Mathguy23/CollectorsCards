--- STEAMODDED HEADER
--- MOD_NAME: Custom Playing Cards
--- MOD_ID: CustomCards
--- PREFIX: pc
--- MOD_AUTHOR: [mathguy]
--- MOD_DESCRIPTION: Playing Cards with special abilities.
--- VERSION: 1.1.1
----------------------------------------------
------------MOD CODE -------------------------

pc_cross_mod_cards = pc_cross_mod_cards or {}

SMODS.Enhancement {
    key = 'trading',
    name = "Speical Card",
    config = {},
    replace_base_card = true,
    pos = {x = 0, y = 0},
    in_pool = function(self)
        return false
    end,
    loc_text = {
        name = "Trading"
    }
}

SMODS.Atlas({ key = "trading", atlas_table = "ASSET_ATLAS", path = "cards.png", px = 71, py = 95})

SMODS.Atlas({ key = "trading_hc", atlas_table = "ASSET_ATLAS", path = "cards_hc.png", px = 71, py = 95})

SMODS.Atlas({ key = "tarots", atlas_table = "ASSET_ATLAS", path = "tarots.png", px = 71, py = 95})

SMODS.Atlas({ key = "decks", atlas_table = "ASSET_ATLAS", path = "decks.png", px = 71, py = 95})

SMODS.Atlas({ key = "booster", atlas_table = "ASSET_ATLAS", path = "boosters.png", px = 71, py = 95})

SMODS.Atlas({ key = "tags", atlas_table = "ASSET_ATLAS", path = "tags.png", px = 34, py = 34})

SMODS.Atlas({ key = "mini_planets", atlas_table = "ASSET_ATLAS", path = "mini_planets.png", px = 71, py = 95,
    inject = function(self)
        local file_path = type(self.path) == 'table' and
            (self.path[G.SETTINGS.language] or self.path['default'] or self.path['en-us']) or self.path
        if file_path == 'DEFAULT' then return end
        -- language specific sprites override fully defined sprites only if that language is set
        if self.language and not (G.SETTINGS.language == self.language) then return end
        if not self.language and self.obj_table[('%s_%s'):format(self.key, G.SETTINGS.language)] then return end
        self.full_path = (self.mod and self.mod.path or SMODS.path) ..
            'assets/' .. G.SETTINGS.GRAPHICS.texture_scaling .. 'x/' .. file_path
        local file_data = assert(NFS.newFileData(self.full_path),
            ('Failed to collect file data for Atlas %s'):format(self.key))
        self.image_data = assert(love.image.newImageData(file_data),
            ('Failed to initialize image data for Atlas %s'):format(self.key))
        self.image = love.graphics.newImage(self.image_data,
            { mipmaps = true, dpiscale = G.SETTINGS.GRAPHICS.texture_scaling })
        G[self.atlas_table][self.key_noloc or self.key] = self
        G['pc_mini_High Card'] = Sprite(0, 0, G.CARD_W, G.CARD_H, G[self.atlas_table][self.key_noloc or self.key], {x = 0,y = 0})
        G['pc_mini_Pair'] = Sprite(0, 0, G.CARD_W, G.CARD_H, G[self.atlas_table][self.key_noloc or self.key], {x = 1,y = 0})
        G['pc_mini_Two Pair'] = Sprite(0, 0, G.CARD_W, G.CARD_H, G[self.atlas_table][self.key_noloc or self.key], {x = 2,y = 0})
        G['pc_mini_Three of a Kind'] = Sprite(0, 0, G.CARD_W, G.CARD_H, G[self.atlas_table][self.key_noloc or self.key], {x = 3,y = 0})
        G['pc_mini_Straight'] = Sprite(0, 0, G.CARD_W, G.CARD_H, G[self.atlas_table][self.key_noloc or self.key], {x = 0,y = 1})
        G['pc_mini_Flush'] = Sprite(0, 0, G.CARD_W, G.CARD_H, G[self.atlas_table][self.key_noloc or self.key], {x = 1,y = 1})
        G['pc_mini_Full House'] = Sprite(0, 0, G.CARD_W, G.CARD_H, G[self.atlas_table][self.key_noloc or self.key], {x = 2,y = 1})
        G['pc_mini_Four of a Kind'] = Sprite(0, 0, G.CARD_W, G.CARD_H, G[self.atlas_table][self.key_noloc or self.key], {x = 3,y = 1})
        G['pc_mini_Straight Flush'] = Sprite(0, 0, G.CARD_W, G.CARD_H, G[self.atlas_table][self.key_noloc or self.key], {x = 0,y = 2})
        G['pc_mini_Five of a Kind'] = Sprite(0, 0, G.CARD_W, G.CARD_H, G[self.atlas_table][self.key_noloc or self.key], {x = 1,y = 2})
        G['pc_mini_Flush House'] = Sprite(0, 0, G.CARD_W, G.CARD_H, G[self.atlas_table][self.key_noloc or self.key], {x = 2,y = 2})
        G['pc_mini_Flush Five'] = Sprite(0, 0, G.CARD_W, G.CARD_H, G[self.atlas_table][self.key_noloc or self.key], {x = 3,y = 2})
    end
})

SMODS.Atlas({ key = "top10", atlas_table = "ASSET_ATLAS", path = "top10_.png", px = 71, py = 95,
    inject = function(self)
        local file_path = type(self.path) == 'table' and
            (self.path[G.SETTINGS.language] or self.path['default'] or self.path['en-us']) or self.path
        if file_path == 'DEFAULT' then return end
        -- language specific sprites override fully defined sprites only if that language is set
        if self.language and not (G.SETTINGS.language == self.language) then return end
        if not self.language and self.obj_table[('%s_%s'):format(self.key, G.SETTINGS.language)] then return end
        self.full_path = (self.mod and self.mod.path or SMODS.path) ..
            'assets/' .. G.SETTINGS.GRAPHICS.texture_scaling .. 'x/' .. file_path
        local file_data = assert(NFS.newFileData(self.full_path),
            ('Failed to collect file data for Atlas %s'):format(self.key))
        self.image_data = assert(love.image.newImageData(file_data),
            ('Failed to initialize image data for Atlas %s'):format(self.key))
        self.image = love.graphics.newImage(self.image_data,
            { mipmaps = true, dpiscale = G.SETTINGS.GRAPHICS.texture_scaling })
        G[self.atlas_table][self.key_noloc or self.key] = self
        G.pc_top10_indicator = Sprite(0, 0, G.CARD_W, G.CARD_H, G[self.atlas_table][self.key_noloc or self.key], {x = 0,y = 0})
    end
})

SMODS.current_mod.custom_collection_tabs = function()
	return { UIBox_button {
        count = G.ACTIVE_MOD_UI and modsCollectionTally(G.P_CENTER_POOLS["Exotic"]),
        button = 'your_collection_trading_cards',
        label = {"Cards"}, minw = 5, id = 'your_collection_trading_cards'
    }}
end

function create_UIBox_Trading()
    local deck_tables = {}

    G.your_collection = {}
    for j = 1, 2 do
      G.your_collection[j] = CardArea(
        G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
        (5.25)*G.CARD_W,
        1*G.CARD_H, 
        {card_limit = 5, type = 'title', highlight_limit = 0, collection = true})
      table.insert(deck_tables, 
      {n=G.UIT.R, config={align = "cm", padding = 0, no_fill = true}, nodes={
        {n=G.UIT.O, config={object = G.your_collection[j]}}
      }}
      )
    end

    local tarot_options = {}
    for i = 1, math.ceil(#G.P_CENTER_POOLS['Exotic']/10) do
      table.insert(tarot_options, localize('k_page')..' '..tostring(i)..'/'..tostring(math.ceil(#G.P_CENTER_POOLS['Exotic']/10)))
    end
  
    for j = 1, #G.your_collection do
        for i = 1, 5 do
            if (i+(j-1)*(5)) <= #G.P_CENTER_POOLS['Exotic'] then
                local trading = G.P_CENTER_POOLS['Exotic'][i+(j-1)*(5)]
                local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W, G.CARD_H, G.P_CARDS[trading.base], G.P_CENTERS.c_base)
                card:start_materialize(nil, i>1 or j>1)
                card.force_trading = trading.key
                card:set_ability(G.P_CENTERS["m_pc_trading"], true)
                card:set_sprites(card.config.center)
                G.your_collection[j]:emplace(card)
                card.playing_card = true
            end
        end
    end
  
    INIT_COLLECTION_CARD_ALERTS()
    
    local t = create_UIBox_generic_options({ back_func = G.ACTIVE_MOD_UI and "openModUI_"..G.ACTIVE_MOD_UI.id or 'your_collection', contents = {
              {n=G.UIT.R, config={align = "cm", minw = 2.5, padding = 0.1, r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes=deck_tables},
                    {n=G.UIT.R, config={align = "cm"}, nodes={
                      create_option_cycle({options = tarot_options, w = 4.5, cycle_shoulders = true, opt_callback = 'your_collection_trading_page', focus_args = {snap_to = true, nav = 'wide'},current_option = 1, colour = G.C.RED, no_pips = true})
                    }}
            }})
    return t
end

G.FUNCS.your_collection_trading_cards = function(e)
	G.SETTINGS.paused = true
	G.FUNCS.overlay_menu{
	  definition = create_UIBox_Trading(),
	}
end

G.FUNCS.your_collection_trading_page = function(args)
    if not args or not args.cycle_config then return end
    for j = 1, #G.your_collection do
        for i = #G.your_collection[j].cards,1, -1 do
            local c = G.your_collection[j]:remove_card(G.your_collection[j].cards[i])
            c:remove()
            c = nil
        end
    end
    for i = 1, 5 do
        for j = 1, #G.your_collection do
            local trading = G.P_CENTER_POOLS['Exotic'][i+(j-1)*5 + (5*#G.your_collection*(args.cycle_config.current_option - 1))]
            if not trading then break end
            local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W, G.CARD_H, G.P_CARDS[trading.base], G.P_CENTERS.c_base)
            card.force_trading = trading.key
            card:set_ability(G.P_CENTERS["m_pc_trading"], true)
            card:set_sprites(card.config.center)
            G.your_collection[j]:emplace(card)
            card.playing_card = true
        end
    end
    INIT_COLLECTION_CARD_ALERTS()
end

function Card:calculate_exotic(context, do_repeat, blueprint_card)
    local new_context = {}
    for i, j in pairs(context) do
        new_context[i] = j
    end
    new_context.retrigger_chain = new_context.retrigger_chain or {}
    table.insert(new_context.retrigger_chain, blueprint_card or self)
    context = new_context
    local new_do_repeat = {}
    local red_seal_only = not do_repeat
    if do_repeat then
        for j = 1, #do_repeat do
            table.insert(new_do_repeat, do_repeat[j])
        end
    end
    local can_retrigger = false
    if self.ability and self.doubled_down and context.after then
        self.force_trading = 'double_down'
        self:set_ability(G.P_CENTERS["m_pc_trading"])
        self:set_sprites(self.config.center)
        local doubled = self.doubled_down
        self.doubled_down = nil
        self.ability = doubled.ability
        self:set_edition(doubled.edition, true, true)
        self:set_seal(doubled.seal, true, true)
        self:set_base(doubled.base)
        self:juice_up()
        return {}
    end
    if self.debuff then
        if context.does_score then
            return false
        elseif context.is_suit or context.get_id or context.is_face then
            
        else
            return {}
        end
    end
    local obj = self.config.center
    local name = self.ability.trading and self.ability.trading.name
    if not name then
        if context.does_score then
            return false
        elseif context.is_suit or context.get_id or context.is_face then
            return nil
        else
            return {}
        end
    end
    if not (context.does_score or context.is_suit or context.get_id or context.is_face) then
        if self.ability.trading.name == "Blueprint" then
            local next_card = nil
            if self.area == G.play then
                local index = -1
                for i = 1, #G.play.cards do
                    if G.play.cards[i] == self then
                        index = i
                        break
                    end
                end
                if index ~= #G.play.cards then
                    next_card = G.play.cards[index + 1]
                end
            elseif self.area == G.hand then
                local index = -1
                for i = 1, #G.hand.cards do
                    if G.hand.cards[i] == self then
                        index = i
                        break
                    end
                end
                if index ~= #G.hand.cards then
                    next_card = G.hand.cards[index + 1]
                end
            end
            if next_card and (next_card ~= self) and (next_card ~= blueprint_card) and next_card.ability and next_card.ability.trading and next_card.ability.trading.is_joker and not next_card.ability.trading.blueprint_incompat then
                local new_context = {blueprint = true}
                for i, j in pairs(context) do
                    new_context[i] = j
                end
                return next_card:calculate_exotic(new_context, do_repeat, blueprint_card or self)
            end
        end
        if self.ability.trading.name == "Brainstorm" then
            local next_card = nil
            if self.area == G.play then
                next_card =  G.play.cards[1]
            elseif self.area == G.hand then
                next_card =  G.hand.cards[1]
            end

            if next_card and (next_card ~= self) and (next_card ~= blueprint_card) and next_card.ability and next_card.ability.trading and next_card.ability.trading.is_joker and not next_card.ability.trading.blueprint_incompat then
                local new_context = {blueprint = true}
                for i, j in pairs(context) do
                    new_context[i] = j
                end
                return next_card:calculate_exotic(new_context, do_repeat, blueprint_card or self)
            end
        end
    end
    local effects = {}
    local reps = {1}
    local i = 1
    while (i <= #reps) do
        local valid = true
        if valid then
            if i ~= 1 then
                if reps[i] then
                    if reps[i].cards then
                        if (context.does_score or context.is_suit or context.is_face or context.get_id or context.playing_card_main or context.playing_card_hand or context.repetition) then
                        elseif context.individual or (context.end_of_round and (context.cardarea == G.hand) and not context.individual and not context.repetition) then
                            local m = reps[i]
                            table.insert(effects, {
                                colour = m.colour,
                                message = m.message,
                                cards = m.cards,
                            })
                        else
                            for j = 1, #reps[i].cards do
                                local m = reps[i]
                                card_eval_status_text(m.cards[j], 'jokers', nil, nil, nil, m)
                            end
                        end
                    end
                end
            end
            local config_thing = self.ability.trading.config 
            if self.ability.trading.key and pc_cross_mod_cards[self.ability.trading.key] and pc_cross_mod_cards[self.ability.trading.key].calculate then
                local result = pc_cross_mod_cards[self.ability.trading.key].calculate(self, effects, context, reps, blueprint_card, i)
                if result ~= nil then
                    return result
                end
                if context.does_score then
                    return false
                elseif context.get_id then
                    return -math.random(100, 1000000)
                elseif context.is_suit or context.is_face then
                    return false
                end
            elseif context.individual and (context.cardarea == G.play) and not context.end_of_round then
                if self.area == G.play then
                    if name == "Golden Ratio" then
                        local first_fib = nil
                        for j = 1, #context.scoring_hand do
                            local id = context.scoring_hand[j]:get_id()
                            if (id == 2) or (id == 3) or (id == 5) or (id == 8) or (id == 14) then
                                first_fib = context.scoring_hand[j]
                                break
                            end
                        end
                        if context.other_card == first_fib then
                            table.insert(effects, {
                                dollars = config_thing.dollars,
                                x_mult = config_thing.x_mult,
                                card = self,
                                extra = {focus = context.other_card},
                            })
                        end
                    elseif name == "7 of Luck" then
                        if pseudorandom('pc_lucky') < G.GAME.probabilities.normal/config_thing.odds then
                            table.insert(effects, {
                                mult = config_thing.mult,
                                card = self,
                                extra = {focus = context.other_card},
                            })
                        end 
                        can_retrigger = true
                    end
                elseif self.area == G.hand then

                end
            elseif context.individual and (context.cardarea == G.hand) and not context.end_of_round then
                if self.area == G.play then
                    if name == "Pocket Ace" then
                        if context.other_card:get_id() == 14 then
                            table.insert(effects, {
                                chips = config_thing.h_chips,
                                card = self,
                                extra = {focus = context.other_card},
                            })
                        end
                    end
                elseif self.area == G.hand then

                end
            elseif context.playing_card_main then
                if name == "Flint Card" then
                    table.insert(effects, {
                        mult = config_thing.mult,
                        card = self
                    })
                elseif name == "Scholar's Mate" then
                    local mult = (G.GAME.current_round.hands_played == 1) and config_thing.mult or nil
                    table.insert(effects, {
                        chips = config_thing.chips,
                        mult = mult,
                        card = self
                    })
                elseif name == "Scandinavian Defense" then
                    local valid = true
                    for i = 1, #context.scoring_hand do
                        if context.scoring_hand[i]:is_suit("Spades") or context.scoring_hand[i]:is_suit("Clubs") then
                            valid = false
                        end
                    end
                    table.insert(effects, {
                        chips = config_thing.chips,
                        mult = valid and config_thing.mult or nil,
                        card = self
                    })
                elseif name == "Eye Card" then
                    table.insert(effects, {
                        chips = config_thing.chips,
                        card = self
                    })
                elseif name == "Sunflower" then
                    table.insert(effects, {
                        chips = config_thing.chips,
                        card = self
                    })
                    config_thing.chips = config_thing.chips + config_thing.gain
                    table.insert(effects, {extra = {message = localize{type='variable',key='a_chips',vars={config_thing.gain}}, colour = G.C.BLUE}})
                elseif name == "Wild Draw 4" then
                    table.insert(effects, {
                        chips = config_thing.chips,
                        card = self
                    })
                elseif name == "Jack in a Box" then
                    table.insert(effects, {
                        chips = config_thing.chips,
                        card = self
                    })
                    config_thing.scored = config_thing.scored + 1
                    if config_thing.scored >= config_thing.scores then
                        config_thing.scored = 0
                        table.insert(effects, {extra = {func = function()
                            G.E_MANAGER:add_event(Event({ func = function()
                                local suit = pseudorandom_element(SMODS.Suits, pseudoseed('jack'))
                                local card = Card(self.T.x, self.T.y, G.CARD_W, G.CARD_H, G.P_CARDS["H_J"], G.P_CENTERS['c_base'], {playing_card = G.playing_card})
                                SMODS.change_base(card, suit.key)
                                local pool = {}
                                for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                                    if (v.key ~= 'm_stone') and (v.key ~= 'm_pc_trading') then 
                                        local valid = true
                                        if v.in_pool and (type(v.in_pool) == "function") and not v:in_pool() then
                                            valid = false
                                        end
                                        if valid then
                                            pool[#pool+1] = v
                                        end
                                    end
                                end
                                local center = pseudorandom_element(pool, pseudoseed('jack'))
                                card:set_ability(center)
                                card:flip()
                                G.deck:emplace(card)
                                table.insert(G.playing_cards, card)
                                card:set_sprites(card.config.center)
                                return true
                            end
                            }))
                        end, message = "+1 " .. localize("Jack", 'ranks')}})
                    end
                elseif name == "2mbstone" then
                    table.insert(effects, {
                        chips = config_thing.chips,
                        card = self
                    })
                elseif name == "Mane 6" then
                    local total_x_mult = 1
                    for j = 1, #G.play.cards do
                        if G.play.cards[j].ability and G.play.cards[j].ability.trading and (G.play.cards[j].ability.trading.name == "Mane 6") then
                            total_x_mult = total_x_mult + config_thing.x_mult
                        end
                    end
                    table.insert(effects, {
                        chips = config_thing.chips,
                        x_mult = (total_x_mult ~= 1) and total_x_mult or nil,
                        card = self
                    })
                elseif name == ":3" then
                    table.insert(effects, {
                        chips = config_thing.chips,
                        card = self
                    })
                    config_thing.scored = config_thing.scored + 1
                    if config_thing.scored == config_thing.scores then
                        table.insert(effects, {extra = {func = function()
                            G.E_MANAGER:add_event(Event({ func = function()
                                if G.jokers.config.card_limit > #G.jokers.cards then
                                    local card = create_card('Joker', G.jokers, true, nil, nil, nil, nil, '3')
                                    card:add_to_deck()
                                    card.ability.perishable = true
                                    card.ability.perish_tally = G.GAME.perishable_rounds
                                    card.ability.force_perish = true
                                    G.jokers:emplace(card)
                                end
                                return true
                            end
                            }))
                        end, message = "+1 " .. localize("k_legendary")}})
                    end
                elseif name == "Executor" then
                    table.insert(effects, {
                        chips = config_thing.chips,
                        card = self
                    })
                elseif name == "Monarch" then
                    table.insert(effects, {
                        chips = config_thing.chips,
                        card = self
                    })
                elseif name == "Meteor" then
                    table.insert(effects, {
                        chips = config_thing.chips,
                        card = self
                    })
                elseif name == "Bust Card" then
                    table.insert(effects, {
                        mult = config_thing.mult,
                        card = self
                    })
                elseif name == "Old Bell" then
                    table.insert(effects, {
                        chips = config_thing.chips,
                        x_mult = config_thing.x_mult,
                        card = self
                    })
                elseif name == "Miscut" then
                    table.insert(effects, {
                        chips = config_thing.chips,
                        card = self
                    })
                    table.insert(effects, {extra = {func = function()
                        for j = 1, #G.hand.cards do
                            local percent = 1.15 - (j-0.999)/(#G.hand.cards-0.998)*0.3
                            local card = G.hand.cards[j]
                            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15, func = function()
                                if not card.removed then
                                    G.hand.cards[j]:flip()
                                    play_sound('card1', percent)
                                    G.hand.cards[j]:juice_up(0.3, 0.3)
                                end
                                return true
                            end
                            }))
                        end
                    end}})
                    table.insert(effects, {extra = {func = function()
                        for j = 1, #G.hand.cards do
                            local coinflip = pseudorandom('misc')
                            local card = G.hand.cards[j]
                            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15, func = function()
                                if not card.removed then
                                    if coinflip < 0.5 then
                                        SMODS.modify_rank(G.hand.cards[j], -1)
                                    else
                                        SMODS.modify_rank(G.hand.cards[j], 1)
                                    end
                                end
                                return true
                            end
                            }))
                        end
                    end}})
                    table.insert(effects, {extra = {func = function()
                        for j = 1, #G.hand.cards do
                            local percent = 1.15 - (j-0.999)/(#G.hand.cards-0.998)*0.3
                            local card = G.hand.cards[j]
                            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15, func = function()
                                if not card.removed then
                                    G.hand.cards[j]:flip()
                                    play_sound('card1', percent, 0.6)
                                    G.hand.cards[j]:juice_up(0.3, 0.3)
                                end
                                return true
                            end
                            }))
                        end
                    end}})
                elseif name == "Full Circle" then
                    table.insert(effects, {
                        chips = config_thing.chips,
                        card = self
                    })
                elseif name == "7 of Luck" then
                    table.insert(effects, {
                        chips = config_thing.chips,
                        card = self
                    })
                elseif name == "Top 10" then
                    local count = 0
                    for i = 1, #context.full_hand do
                        if context.full_hand[i].ability.pc_top10 then
                            count = count + 1
                        end
                    end
                    table.insert(effects, {
                        mult = (count > 0) and (config_thing.mult * count),
                        chips = config_thing.chips,
                        card = self
                    })
                end
            elseif context.playing_card_hand then
                if name == "Aluminum Plate" then
                    table.insert(effects, {
                        x_mult = config_thing.h_x_mult,
                        card = self
                    })
                end
            elseif context.discard and (context.other_card == self) then
                if name == "Playable Joker" then
                    local pool = {}
                    for i, j in ipairs(G.hand.cards) do
                        local card = G.hand.cards[i]
                        if not card.edition and (card ~= self) then
                            table.insert(pool, card)
                        end
                    end
                    if #pool > 0 then
                        if pseudorandom('joker') < G.GAME.probabilities.normal/config_thing.odds then
                            local card = pseudorandom_element(pool, pseudoseed('aura_joker'))
                            local edition = poll_edition('wheel_of_fortune', nil, false, true, {'e_polychrome', 'e_holo', 'e_foil'})
                            card:set_edition(edition)
                        else
                            card_eval_status_text(self, 'jokers', nil, nil, nil, {message = localize('k_nope_ex'), colour = G.C.SECONDARY_SET.Tarot})
                        end
                        can_retrigger = true
                    end
                end
            elseif context.pre_discard then
                if self.highlighted then
                    if name == "Haunted Card" then
                        card_eval_status_text(self, 'jokers', nil, nil, nil, {message = localize{type='variable',key='a_cards',vars={config_thing.cards}}})
                        local size = math.min(#G.deck.cards, config_thing.cards)
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.1,
                            func = function()
                                phantom_cards = true
                                return true
                            end
                        }))
                        G.GAME.pc_hand_size_bonus = (G.GAME.pc_hand_size_bonus or 0) + config_thing.cards
                        for i = 1, config_thing.cards do
                            draw_card(G.deck,G.hand, i*100/size,'up', true)
                            delay(0.1)
                        end
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.1,
                            func = function()
                                phantom_cards = nil
                                return true
                            end
                        }))
                        can_retrigger = true
                    end
                end
            elseif context.before then
                if context.cardarea == G.play then
                    if name == "Rules Card" then
                        ease_discard(1)
                        card_eval_status_text(self, 'jokers', nil, nil, nil, {message = localize{type='variable',key='a_discards',vars={config_thing.discards}}, colour = G.C.RED})
                        can_retrigger = true
                    elseif name == "Wild Draw 4" then
                        card_eval_status_text(self, 'jokers', nil, nil, nil, {message = localize{type='variable',key='a_cards',vars={config_thing.cards}}})
                        local size = math.min(#G.deck.cards, config_thing.cards)
                        for i = 1, config_thing.cards do
                            draw_card(G.deck,G.hand, i*100/size,'up', true)
                            delay(0.1)
                        end
                        can_retrigger = true
                    elseif name == "2mbstone" then
                        if (G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer) and (pseudorandom('tom') < G.GAME.probabilities.normal/config_thing.odds) then
                            card_eval_status_text(self, 'jokers', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                            G.GAME.consumeable_buffer = (G.GAME.consumeable_buffer or 0) + 1
                            G.E_MANAGER:add_event(Event({func = function()
                                local card = create_card('', G.consumeables, nil, nil, nil, nil, 'c_death', 'fool')
                                card:add_to_deck()
                                G.consumeables:emplace(card)
                                G.GAME.consumeable_buffer = 0
                            return true end }))
                            can_retrigger = true
                        end
                    elseif name == "Executor" then
                        local pool = {}
                        for j = 1, #G.hand.cards do
                            if not G.hand.cards[j].getting_sliced then
                                table.insert(pool, G.hand.cards[j])
                            end
                        end
                        if #pool > 0 then
                            local card = pseudorandom_element(pool, pseudoseed('exec'))
                            card.getting_sliced = true
                            if card.ability and (card.ability.name == 'Glass Card') then 
                                card:shatter()
                            else
                                card:start_dissolve()
                            end
                            config_thing.destroyed = config_thing.destroyed + 1
                            if config_thing.destroyed >= config_thing.destroys then
                                config_thing.destroyed = 0
                                G.E_MANAGER:add_event(Event({ func = function()
                                    local card = copy_card(self, nil, nil, true)
                                    card:flip()
                                    G.deck:emplace(card)
                                    table.insert(G.playing_cards, card)
                                    return true
                                end
                                }))
                            end
                            can_retrigger = true
                        end
                    end
                end
            elseif context.destroying_card then
                if name == ":3" then
                    if (context.destroying_card == self) and (context.cardarea == G.play) and (config_thing.scored >= config_thing.scores) then
                        return true
                    end
                elseif name == "Full Circle" then
                    if (context.destroying_card == self) and (context.cardarea == G.play) then
                        local hand = context.scoring_name
                        if not config_thing.saved[hand] then
                            self:juice_up()
                            config_thing.saved[hand] = true
                            config_thing.count = config_thing.count + 1
                            card_eval_status_text(self, 'jokers', nil, nil, nil, {message = tostring(config_thing.count), colour = G.C.FILTER})
                        else
                            local old_hand = G.GAME.current_round.current_hand.handname
                            update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(hand, 'poker_hands'),chips = G.GAME.hands[hand].chips, mult = G.GAME.hands[hand].mult, level=G.GAME.hands[hand].level})
                            level_up_hand(self, hand, nil, config_thing.count)
                            if G.GAME.hands[old_hand] then
                                update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {handname=localize(old_hand, 'poker_hands'),chips = G.GAME.hands[old_hand].chips, mult = G.GAME.hands[old_hand].mult, level=G.GAME.hands[old_hand].level})
                            else
                                update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
                            end
                            return true
                        end
                    end
                end
            elseif context.very_before then
                if context.random_order then
                    if name == "Double Down" then
                        local pool = {}
                        for j = 1, #G.play.cards do
                            if (G.play.cards[j] ~= self) then
                                table.insert(pool, G.play.cards[j])
                            end
                        end
                        if #pool > 0 then
                            local card = pseudorandom_element(pool, pseudoseed('down'))
                            local doubled = {
                                ability = copy_table(self.ability),
                                base = self.config.card,
                                edition = self.edition,
                                seal = self.seal
                            }
                            copy_card(card, self, nil, true)
                            self:juice_up()
                            self.doubled_down = doubled
                        end
                    end
                end
            elseif context.very_very_before then
                if name == "Free Pass" then
                    hand_is_free = true
                end
            elseif context.after then
                if context.cardarea == G.play then
                end
            elseif context.drawn then
                if context.drawn == G.hand then
                    if name == "Meteor" then
                        if context.facing_blind then
                            self.ability.already_drawn = G.GAME.round
                            for i = 1, config_thing.cards do
                                local card = create_playing_card({
                                    front = pseudorandom_element(G.P_CARDS, pseudoseed('met')), 
                                    center = G.P_CENTERS.c_base}, G.hand, nil, nil, {G.C.SECONDARY_SET.Enhanced})
                                card.ability.fleeting = true
                                card:set_ability(G.P_CENTERS['m_stone'])
                                G.GAME.blind:debuff_card(card)
                                G.hand:sort()
                            end
                            can_retrigger = true
                        end
                    elseif name == "Bust Card" then
                        if context.facing_blind then
                            self.ability.already_drawn = G.GAME.round
                            local pool = {}
                            for i, j in ipairs(G.hand.cards) do
                                local card = G.hand.cards[i]
                                if (card ~= self) then
                                    table.insert(pool, card)
                                end
                            end
                            card_eval_status_text(self, 'jokers', nil, nil, nil, {message = localize('k_bust'), colour = G.C.RED})
                            for i = 1, config_thing.cards do
                                if #pool > 0 then
                                    local card, index = pseudorandom_element(pool, pseudoseed('bust'))
                                    table.remove(pool, index)
                                    card.ability.temp_debuff = true
                                    card:set_debuff()
                                end
                            end
                            can_retrigger = true
                        end
                    end
                end
            elseif context.using_consumeable then
                if name == "Fortune Orb" then
                    if context.using_consumeable.ability and context.using_consumeable.ability.set == 'Tarot' then
                        card_eval_status_text(self, 'jokers', nil, nil, nil, {message = localize{type='variable',key='a_cards',vars={config_thing.cards}}})
                        local size = math.min(#G.deck.cards, config_thing.cards)
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.1,
                            func = function()
                                phantom_cards = true
                                return true
                            end
                        }))
                        for i = 1, config_thing.cards do
                            draw_card(G.deck,G.hand, i*100/size,'up', true)
                            delay(0.1)
                        end
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.1,
                            func = function()
                                phantom_cards = nil
                                return true
                            end
                        }))
                        table.insert(effects, {})
                        can_retrigger = true
                    end
                end
            elseif context.does_score then
                if name == "Double Up" then
                    return true
                elseif name == "Rules Card" then
                    return true
                elseif name == "Blank Card" then
                    return "remove"
                elseif name == "Meteor" then
                    return true
                elseif name == "Bust Card" then
                    return true
                elseif name == "Free Pass" then
                    return true
                end
                return false
            elseif context.is_suit then
                if name == "Flint Card" then
                    if (context.is_suit == "Hearts") or (context.is_suit == "Diamonds") then
                        return true
                    end
                elseif name == "Eye Card" then
                    if (context.is_suit == "Clubs") or (context.is_suit == "Spades") then
                        return true
                    end
                elseif name == "Wild Draw 4" then
                    return true
                elseif name == "Golden Ratio" then
                    if ((context.is_suit == "Hearts") and next(find_joker('Smeared Joker'))) or (context.is_suit == "Diamonds") then
                        return true
                    end
                elseif name == "Pocket Ace" then
                    if ((context.is_suit == "Clubs") and next(find_joker('Smeared Joker'))) or (context.is_suit == "Spades") then
                        return true
                    end
                elseif name == "Monarch" then
                    if (context.is_suit == "Hearts") or (context.is_suit == "Clubs") or (context.is_suit == "Spades") or ((context.is_suit == "Diamonds") and next(find_joker('Smeared Joker'))) then
                        return true
                    end
                elseif name == "Old Bell" then
                    if ((context.is_suit == "Spades") and next(find_joker('Smeared Joker'))) or (context.is_suit == "Clubs") then
                        return true
                    end
                elseif name == "Miscut" then
                    if ((context.is_suit == "Hearts") and next(find_joker('Smeared Joker'))) or ((context.is_suit == "Clubs") and next(find_joker('Smeared Joker'))) or (context.is_suit == "Spades") or (context.is_suit == "Diamonds") then
                        return true
                    end
                elseif name == "Five Fingers" then
                    return true
                elseif name == "Full Circle" then
                    if ((context.is_suit == "Clubs") and next(find_joker('Smeared Joker'))) or (context.is_suit == "Spades") then
                        return true
                    end
                elseif name == "7 of Luck" then
                    if ((context.is_suit == "Spades") and next(find_joker('Smeared Joker'))) or (context.is_suit == "Clubs") then
                        return true
                    end
                end
                return false
            elseif context.is_face then
                if name == "Scholar's Mate" then
                    return true
                elseif name == "Scandinavian Defense" then
                    return true
                elseif name == "Jack in a Box" then
                    return true
                elseif name == "Playable Joker" then
                    return true
                elseif name == "Fortune Orb" then
                    return true
                elseif name == ":3" then
                    return true
                elseif name == "Executor" then
                    return true
                elseif name == "Monarch" then
                    return true
                elseif name == "Old Bell" then
                    return true
                end
                return false
            elseif context.get_id then
                if name == "Scholar's Mate" then
                    return 12
                elseif name == "Scandinavian Defense" then
                    return 12
                elseif name == "Sunflower" then
                    return 8
                elseif name == "Wild Draw 4" then
                    return 4
                elseif name == "Jack in a Box" then
                    return 11
                elseif name == "2mbstone" then
                    return 2
                elseif name == "Mane 6" then
                    return 6
                elseif name == "Blank Card" then
                    if config_thing.rank then
                        return config_thing.rank
                    end
                elseif name == ":3" then
                    return 3
                elseif name == "Pocket Ace" then
                    return 14
                elseif name == "Executor" then
                    return 3
                elseif name == "Monarch" then
                    return 13
                elseif name == "Fortune Orb" then
                    return 12
                elseif name == "Old Bell" then
                    return 13
                elseif name == "Miscut" then
                    return 14
                elseif name == "Five Fingers" then
                    return 5
                elseif name == "Full Circle" then
                    return 9
                elseif name == "7 of Luck" then
                    return 7
                elseif name == "Top 10" then
                    return 10
                end
                return -math.random(100, 1000000)
            elseif context.repetition then
                local special_table = {self}
                if i ~= 1 then
                    for j = 1, #reps[i].cards do
                        table.insert(special_table, reps[i].cards[j])
                    end
                else
                    -- for j = 1, #do_repeat do
                    --     table.insert(special_table, do_repeat[j])
                    -- end
                end
                if context.cardarea == G.play then
                    if name == "Double Up"  then
                        local index = -1
                        for j = 1, #G.play.cards do
                            if G.play.cards[j] == self then
                                index = j
                            end
                        end
                        if (index ~= -1) and (G.play.cards[index + 1] == context.other_card) then
                            table.insert(effects, {
                                message = localize('k_again_ex'),
                                repetitions = config_thing.retriggers,
                                cards = special_table
                            })
                        end
                    end
                end
            end

            if not context.does_score and not context.is_suit and not context.is_face and not context.get_id and not context.playing_card_main and not context.playing_card_hand then
                if do_repeat and (next(effects) or can_retrigger) and (i == 1) then
                    local bans = {
                        this_card = false,
                        scoring_hand = {},
                        hand = {},
                        jokers = {},
                    }
                    if #context.retrigger_chain > 0 then
                        for j = 1, #context.retrigger_chain do
                                if context.retrigger_chain[j] == (self or blueprint_card) then
                                    bans.this_card = true
                                end
                            if context.scoring_hand then
                                for k = 1, #context.scoring_hand do
                                    if context.retrigger_chain[j] == context.scoring_hand[k] then
                                        bans.scoring_hand[k] = true
                                    end
                                end
                            end
                            for k = 1, #G.hand.cards do
                                if context.retrigger_chain[j] == G.hand.cards[k] then
                                    bans.hand[k] = true
                                end
                            end
                            for k = 1, #G.jokers.cards do
                                if context.retrigger_chain[j] == G.jokers.cards[k] then
                                    bans.jokers[k] = true
                                end
                            end
                        end
                    end
                    if true then
                        local eval = eval_card(blueprint_card or self, {cardarea = self.area, repetition = true, repetition_only = true, full_hand = context.full_hand, scoring_hand = context.scoring_hand, scoring_name = context.scoring_name, poker_hands = context.poker_hands, card_effects = {{card = blueprint_card or self}}})
                        if next(eval) then 
                            local new_table = {eval.seals.card}
                            for g = 1, #do_repeat do
                                table.insert(new_table, do_repeat[g])
                            end
                            for h= 1, eval.seals.repetitions do
                                reps[#reps+1] = {
                                    cards = new_table,
                                    message = eval.seals.message,
                                    repetitions = eval.seals.repetitions,
                                }
                            end
                        end
                    end

                    --from Jokers
                    for l=1, #G.jokers.cards do
                        if not bans.jokers[l] then
                            --calculate the joker effects
                            local eval = eval_card(G.jokers.cards[l], {cardarea = self.area, other_card = blueprint_card or self, repetition = true, end_of_round = context.end_of_round, full_hand = context.full_hand, scoring_hand = context.scoring_hand, scoring_name = context.scoring_name, poker_hands = context.poker_hands, card_effects = {{card = blueprint_card or self}}})
                            if eval and next(eval) then 
                                local new_table = {G.jokers.cards[l]}
                                for g = 1, #new_do_repeat do
                                    table.insert(new_table, new_do_repeat[g])
                                end
                                for h = 1, eval.jokers.repetitions do
                                    reps[#reps+1] = {
                                        cards = new_table,
                                        message = eval.jokers.message,
                                        repetitions = eval.jokers.repetitions,
                                    }
                                end
                            end
                        end
                    end

                    if context.scoring_hand then
                        for l=1, #context.scoring_hand do
                            if not bans.scoring_hand[l] then
                                --calculate the joker effects
                                local new_new_do_repeat = {}
                                for m = 1, #new_do_repeat do
                                    new_new_do_repeat[#new_new_do_repeat + 1] = new_do_repeat[m]
                                end
                                local new_retrigger_chain = {}
                                for i, j in ipairs(context.retrigger_chain) do
                                    table.insert(new_retrigger_chain, j)
                                end
                                local eval = context.scoring_hand[l]:calculate_exotic({cardarea = self.area, other_card = blueprint_card or self, repetition = true, end_of_round = context.end_of_round, full_hand = context.full_hand, scoring_hand = context.scoring_hand, scoring_name = context.scoring_name, poker_hands = context.poker_hands, retrigger_chain = new_retrigger_chain}, new_new_do_repeat)
                                if next(eval) then
                                    for _, minieval in ipairs(eval) do
                                        if minieval.repetitions then
                                            for h = 1, minieval.repetitions do
                                                reps[#reps+1] = minieval
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end

                    for l=1, #G.hand.cards do
                        if not bans.hand[l] then
                            --calculate the joker effects
                            local new_new_do_repeat = {}
                            for m = 1, #new_do_repeat do
                                new_new_do_repeat[#new_new_do_repeat + 1] = new_do_repeat[m]
                            end
                            local new_retrigger_chain = {}
                            for i, j in ipairs(context.retrigger_chain) do
                                table.insert(new_retrigger_chain, j)
                            end
                            local eval = G.hand.cards[l]:calculate_exotic({cardarea = self.area, other_card = blueprint_card or self, repetition = true, end_of_round = context.end_of_round, full_hand = context.full_hand, scoring_hand = context.scoring_hand, scoring_name = context.scoring_name, poker_hands = context.poker_hands, retrigger_chain = new_retrigger_chain}, new_new_do_repeat)
                            if next(eval) then
                                for _, minieval in ipairs(eval) do
                                    if minieval.repetitions then
                                        for h = 1, minieval.repetitions do
                                            reps[#reps+1] = minieval
                                        end
                                    end
                                end
                            end
                        end
                    end
                elseif red_seal_only and (next(effects) or can_retrigger) and (i == 1) and (self.seal == 'Red') then
                    local bans = {
                        this_card = false,
                    }
                    if #context.retrigger_chain > 0 then
                        for j = 1, #context.retrigger_chain do
                            if context.retrigger_chain[j] == (self or blueprint_card) then
                                bans.this_card = true
                            end
                        end
                    end
                    if true then
                        reps[#reps+1] = {
                            cards = {self},
                            message = localize('k_again_ex'),
                            repetitions = 1,
                        }
                    end
                end
            end
        end
        i = i + 1
    end
    return effects
end

SMODS.Tarot {
    key = 'exchange',
    atlas = "tarots",
    pos = {x = 0, y = 0},
    config = {max_highlighted = 1},
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            used_tarot:juice_up(0.3, 0.5)
            return true end }))
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        delay(0.2)
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                local key = get_trading_key()
                G.hand.highlighted[i].force_trading = key
                G.hand.highlighted[i]:set_ability(G.P_CENTERS["m_pc_trading"])
                G.hand.highlighted[i]:set_base(G.P_CARDS[G.P_TRADING[key].base])
                G.hand.highlighted[i]:set_sprites(G.hand.highlighted[i].config.center)
                return true 
            end }))
        end
        delay(0.6)
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
        delay(0.5)
    end,
    loc_vars = function(self, info_queue, card)
        return {vars = {card and card.ability.consumeable.max_highlighted or 1} }
    end
}

SMODS.Spectral {
    key = 'barter',
    atlas = "tarots",
    pos = {x = 1, y = 0},
    config = {extra = 3},
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local destroyed_cards = {}
        destroyed_cards[#destroyed_cards+1] = pseudorandom_element(G.hand.cards, pseudoseed('random_destroy'))
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            used_tarot:juice_up(0.3, 0.5)
            return true end }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function() 
                for i=#destroyed_cards, 1, -1 do
                    local card = destroyed_cards[i]
                    if SMODS.shatters(card) then
                        card:shatter()
                    else
                        card:start_dissolve(nil, i ~= #destroyed_cards)
                    end
                end
                return true end }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function() 
                local cards = {}
                for i=1, card.ability.extra do
                    local key = G.P_TRADING[get_trading_key()]
                    local _card = Card(G.hand.T.x, G.hand.T.y, G.CARD_W, G.CARD_H, G.P_CARDS[key.base], G.P_CENTERS['m_pc_trading'], {playing_card = G.playing_card})
                    _card.force_trading = key.key
                    _card:set_ability(G.P_CENTERS['m_pc_trading'])
                    _card:set_sprites(_card.config.center)
                    G.hand:emplace(_card)
                    table.insert(G.playing_cards, _card)
                    _card:start_materialize({G.C.SECONDARY_SET.Spectral})
                    cards[i] = _card
                end
                playing_card_joker_effects(cards)
        return true end }))
    end,
    loc_vars = function(self, info_queue, card)
        return {vars = {card and card.ability.extra or 3} }
    end,
    can_use = function()
        return (#G.hand.cards > 1)
    end
}

SMODS.Tag {
    key = 'print',
    atlas = 'tags',
    pos = {x = 0, y = 0},
    apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.RED,function() 
                local key = 'p_pc_trading_mega_1'
                local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W*1.27/2,
                G.play.T.y + G.play.T.h/2-G.CARD_H*1.27/2, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[key], {bypass_discovery_center = true, bypass_discovery_ui = true})
                card.cost = 0
                card.from_tag = true
                G.FUNCS.use_card({config = {ref_table = card}})
                card:start_materialize()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
            return true
        end
    end,
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue+1] = G.P_CENTERS['p_pc_trading_mega_1']
        return {}
    end,
    config = {type = 'new_blind_choice'}
}

SMODS.Back {
    key = 'Collected',
    loc_txt = {
        name = "Collected Deck",
        text = {
            "Start with {C:attention}5{}",
            "{C:attention}Trading Cards{}"
        }
    },
    atlas = "decks",
    pos = {x = 0, y = 0},
    name = "Stuff Deck",
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                for i = 1, 5 do
                    local card = pseudorandom_element(G.playing_cards, pseudoseed('collect'))
                    card:remove()
                end
                for i = 1, 5 do
                    local key = G.P_TRADING[get_trading_key()]
                    local _card = Card(G.deck.T.x, G.deck.T.y, G.CARD_W, G.CARD_H, G.P_CARDS[key.base], G.P_CENTERS['m_pc_trading'], {playing_card = G.playing_card})
                    _card.force_trading = key.key
                    _card:set_ability(G.P_CENTERS['m_pc_trading'])
                    _card:set_sprites(_card.config.center)
                    G.deck:emplace(_card)
                    table.insert(G.playing_cards, _card)
                end
            return true
            end
        }))
    end
}

SMODS.Back {
    key = 'Lavish',
    loc_txt = {
        name = "Lavish Deck",
        text = {
            "Start with {C:attention}2 Miscuts{}",
            "and {C:attention}2 Pocket Aces{}",
            "instead of {C:attention}Base Aces{}"
        }
    },
    atlas = "decks",
    pos = {x = 1, y = 0},
    name = "Lavish Deck",
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                for i = #G.playing_cards, 1, -1 do
                    if G.playing_cards[i]:get_id() == 14 then
                        G.playing_cards[i]:remove()
                    end
                end
                local keys = {'miscut', 'miscut', 'pocket_ace', 'pocket_ace'}
                for i = 1, 4 do
                    local key = G.P_TRADING[keys[i]]
                    local _card = Card(G.deck.T.x, G.deck.T.y, G.CARD_W, G.CARD_H, G.P_CARDS[key.base], G.P_CENTERS['m_pc_trading'], {playing_card = G.playing_card})
                    _card.force_trading = key.key
                    _card:set_ability(G.P_CENTERS['m_pc_trading'])
                    _card:set_sprites(_card.config.center)
                    G.deck:emplace(_card)
                    table.insert(G.playing_cards, _card)
                end
            return true
            end
        }))
    end
}

SMODS.Back {
    key = 'Enthusiast',
    loc_txt = {
        name = "Enthusiast Deck",
        text = {
            "Each {C:attention}Shop{} after a",
            "{C:attention}Boss Blind{} has a {C:attention}free{}",
            "{C:attention}Mega Trading Pack{}",
            "{s:0.8,C:inactive}Suggested by Lexi"
        }
    },
    atlas = "decks",
    pos = {x = 2, y = 0},
    name = "Enthusiast Deck",
}

SMODS.Booster {
    key = 'trading_normal_1',
    atlas = 'booster',
    group_key = 'k_trading_pack',
    loc_txt = {
        name = "Trading Pack",
        text = {
            "Choose {C:attention}#1#{} of up to",
            "{C:attention}#2#{C:attention} Trading{} cards to",
            "add to your deck"
        }
    },
    weight = 0.9,
    name = "Trading Pack",
    pos = {x = 0, y = 0},
    config = {extra = 2, choose = 1, name = "Trading Pack"},
    create_card = function(self, card)
        local key = G.P_TRADING[get_trading_key()]
        local _card = Card(G.deck.T.x, G.deck.T.y, G.CARD_W, G.CARD_H, G.P_CARDS[key.base], G.P_CENTERS['m_pc_trading'], {playing_card = G.playing_card})
        _card.force_trading = key.key
        _card:set_ability(G.P_CENTERS['m_pc_trading'])
        _card:set_sprites(_card.config.center)
        local edition = poll_edition('trading_edition'..G.GAME.round_resets.ante, 1, true)
        _card:set_edition(edition)
        _card:set_seal(SMODS.poll_seal({mod = 3}))
        return _card
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX('734933'))
        ease_background_colour{new_colour = HEX('734933'), special_colour = G.C.BLACK, contrast = 2}
    end,
}

SMODS.Booster {
    key = 'trading_normal_2',
    atlas = 'booster',
    group_key = 'k_trading_pack',
    loc_txt = {
        name = "Trading Pack",
        text = {
            "Choose {C:attention}#1#{} of up to",
            "{C:attention}#2#{C:attention} Trading{} cards to",
            "add to your deck"
        }
    },
    weight = 0.9,
    name = "Trading Pack",
    pos = {x = 1, y = 0},
    config = {extra = 2, choose = 1, name = "Trading Pack"},
    create_card = function(self, card)
        local key = G.P_TRADING[get_trading_key()]
        local _card = Card(G.deck.T.x, G.deck.T.y, G.CARD_W, G.CARD_H, G.P_CARDS[key.base], G.P_CENTERS['m_pc_trading'], {playing_card = G.playing_card})
        _card.force_trading = key.key
        _card:set_ability(G.P_CENTERS['m_pc_trading'])
        _card:set_sprites(_card.config.center)
        local edition = poll_edition('trading_edition'..G.GAME.round_resets.ante, 1, true)
        _card:set_edition(edition)
        _card:set_seal(SMODS.poll_seal({mod = 3}))
        return _card
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX('734933'))
        ease_background_colour{new_colour = HEX('734933'), special_colour = G.C.BLACK, contrast = 2}
    end,
}

SMODS.Booster {
    key = 'trading_jumbo_1',
    atlas = 'booster',
    group_key = 'k_trading_pack',
    loc_txt = {
        name = "Jumbo Trading Pack",
        text = {
            "Choose {C:attention}#1#{} of up to",
            "{C:attention}#2#{C:attention} Trading{} cards to",
            "add to your deck"
        }
    },
    weight = 0.45,
    cost = 6,
    name = "Trading Pack",
    pos = {x = 0, y = 1},
    config = {extra = 4, choose = 1, name = "Trading Pack"},
    create_card = function(self, card)
        local key = G.P_TRADING[get_trading_key()]
        local _card = Card(G.deck.T.x, G.deck.T.y, G.CARD_W, G.CARD_H, G.P_CARDS[key.base], G.P_CENTERS['m_pc_trading'], {playing_card = G.playing_card})
        _card.force_trading = key.key
        _card:set_ability(G.P_CENTERS['m_pc_trading'])
        _card:set_sprites(_card.config.center)
        local edition = poll_edition('trading_edition'..G.GAME.round_resets.ante, 1, true)
        _card:set_edition(edition)
        _card:set_seal(SMODS.poll_seal({mod = 3}))
        return _card
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX('734933'))
        ease_background_colour{new_colour = HEX('734933'), special_colour = G.C.BLACK, contrast = 2}
    end,
}

SMODS.Booster {
    key = 'trading_mega_1',
    atlas = 'booster',
    group_key = 'k_trading_pack',
    loc_txt = {
        name = "Mega Trading Pack",
        text = {
            "Choose {C:attention}#1#{} of up to",
            "{C:attention}#2#{C:attention} Trading{} cards to",
            "add to your deck"
        }
    },
    weight = 0.35,
    cost = 8,
    name = "Trading Pack",
    pos = {x = 1, y = 1},
    config = {extra = 4, choose = 2, name = "Trading Pack"},
    create_card = function(self, card)
        local key = G.P_TRADING[get_trading_key()]
        local _card = Card(G.deck.T.x, G.deck.T.y, G.CARD_W, G.CARD_H, G.P_CARDS[key.base], G.P_CENTERS['m_pc_trading'], {playing_card = G.playing_card})
        _card.force_trading = key.key
        _card:set_ability(G.P_CENTERS['m_pc_trading'])
        _card:set_sprites(_card.config.center)
        local edition = poll_edition('trading_edition'..G.GAME.round_resets.ante, 1, true)
        _card:set_edition(edition)
        _card:set_seal(SMODS.poll_seal({mod = 3}))
        return _card
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX('734933'))
        ease_background_colour{new_colour = HEX('734933'), special_colour = G.C.BLACK, contrast = 2}
    end,
}

SMODS.Shader {
    path = 'phantom.fs',
    key = 'phantom'
}

local whole_deck = {}
for _, i in ipairs({'H', 'C', 'S', 'D'}) do
    for _, j in ipairs({'2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A'}) do
        table.insert(whole_deck, {s = i, r = j})
    end
end
for i = 1, 52 do
    table.insert(whole_deck, {s = 'H', r = 'Q', t = 'double_down', e = 'm_pc_trading'})
end


table.insert(G.CHALLENGES,#G.CHALLENGES+1,
    {name = 'Duoquinquagenuple Down',
        id = 'c_duoquinquagenuple_down',
        rules = {
            custom = {
                {id = 'double_down_52'},
            },
            modifiers = {
                {id = 'hand_size', value = 6},
            }
        },
        jokers = {       
        },
        consumeables = {
        },
        vouchers = {
        },
        deck = {
            type = 'Challenge Deck',
            cards = whole_deck,
        },
        restrictions = {
            banned_cards = {
            },
            banned_tags = {
            },
            banned_other = {
            }
        },
    }
)

function get_trading_key()
    local rng_table = {}
    for i, j in pairs(G.P_TRADING) do
        if (not j.in_pool or j:in_pool()) and (not pc_cross_mod_cards[i] or not pc_cross_mod_cards[i].in_pool or pc_cross_mod_cards[i].in_pool()) then
            if not j.is_joker then
                rng_table[i] = j
            end
        end
    end
    table.sort(rng_table)
    local _, key = pseudorandom_element(rng_table, pseudoseed('trading'))
    return key
end

function get_smods_rank_from_id(card)
    local id = card:get_id()
    if id > 0 then
        for i, j in pairs(SMODS.Ranks) do
            if j.id == id then
                return j
            end
        end
    else
        return SMODS.Ranks[card.base.value] or {}
    end
end

local function compare_cards_played(card1, card2)
    if not card2.ability then
        return true
    end
    if not card1.ability then
        return false
    end
    if (card1.ability.pc_times_triggered or 0) == (card2.ability.pc_times_triggered or 0) then
        local n1 = card1:get_nominal()
        local n2 = card2:get_nominal()
        return n1 >= n2
    end
    return (card1.ability.pc_times_triggered or 0) > (card2.ability.pc_times_triggered or 0)
end

function pc_redo_top10()
    if not G.playing_cards or (G.STAGE ~= G.STAGES.RUN) then
        return
    end
    local found_top10 = nil
    local top10 = {}
    for i = 1, #G.playing_cards do
        if G.playing_cards[i].ability and G.playing_cards[i].ability.trading and( G.playing_cards[i].ability.trading.name == "Top 10") then
            found_top10 = true
        end
        local index = 1
        while top10[index] and not compare_cards_played(G.playing_cards[i], top10[index]) do
            index = index + 1
        end
        if index ~= 11 then
            top10[10] = nil
            table.insert(top10, index, G.playing_cards[i])
        end
    end
    for i = 1, #top10 do
        top10[i].in_top10 = true
    end
    for i = 1, #G.playing_cards do
        local sprites = (G.playing_cards[i].ability.pc_top10 ~= G.playing_cards[i].in_top10)
        G.playing_cards[i].ability.pc_top10 = G.playing_cards[i].in_top10
        if sprites then
            G.playing_cards[i]:set_sprites(G.playing_cards[i].config.center, G.playing_cards[i].config.card)
        end
        G.playing_cards[i].in_top10 = nil
    end
    G.GAME.pc_show_top10 = found_top10
end

G.FUNCS.up_rank = function(e)
    e.config.ref_table.ability.trading.config.rank = (e.config.ref_table.ability.trading.config.rank or 1) + 1
    if e.config.ref_table.ability.trading.config.rank == 15 then
        e.config.ref_table.ability.trading.config.rank = 2
    end
    local ranks = {'', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'}
    SMODS.change_base(e.config.ref_table, nil, ranks[e.config.ref_table.ability.trading.config.rank])
    card_eval_status_text(e.config.ref_table, 'jokers', nil, nil, nil, {message = localize(ranks[e.config.ref_table.ability.trading.config.rank], 'ranks')})
end

G.FUNCS.down_rank = function(e)
    e.config.ref_table.ability.trading.config.rank = (e.config.ref_table.ability.trading.config.rank or 15) - 1
    if e.config.ref_table.ability.trading.config.rank == 1 then
        e.config.ref_table.ability.trading.config.rank = 14
    end
    local ranks = {'', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'}
    SMODS.change_base(e.config.ref_table, nil, ranks[e.config.ref_table.ability.trading.config.rank])
    card_eval_status_text(e.config.ref_table, 'jokers', nil, nil, nil, {message = localize(ranks[e.config.ref_table.ability.trading.config.rank], 'ranks')})
end

G.FUNCS.can_up_rank = function(e)
    if e.config.ref_table.debuff then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
      e.config.colour = G.C.GREEN
      e.config.button = 'up_rank'
    end
end

G.FUNCS.can_down_rank = function(e)
    if e.config.ref_table.debuff then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
      e.config.colour = G.C.RED
      e.config.button = 'down_rank'
    end
end

function G.UIDEF.rank_buttons(card)
    local sell = nil
    local use = nil
    use = 
    {n=G.UIT.C, config={align = "cr"}, nodes={
      {n=G.UIT.C, config={ref_table = card, align = "cm",maxw = 0.75, padding = 0.1, r=0.08, minw = 0.75, minh = 0.3, hover = true, shadow = true, colour = G.C.RED, button = 'up_rank', func = 'can_up_rank'}, nodes={
        {n=G.UIT.B, config = {w=0.1,h=0.3}},
        {n=G.UIT.T, config={text = localize('b_up'),colour = G.C.UI.TEXT_LIGHT, scale = 0.25, shadow = true}}
      }}
    }}
    sell = 
    {n=G.UIT.C, config={align = "cr"}, nodes={
      {n=G.UIT.C, config={ref_table = card, align = "cm",maxw = 0.75, padding = 0.1, r=0.08, minw = 0.75, minh = 0.3, hover = true, shadow = true, colour = G.C.GREEN, button = 'down_rank', func = 'can_down_rank'}, nodes={
        {n=G.UIT.B, config = {w=0.1,h=0.3}},
        {n=G.UIT.T, config={text = localize('b_down'),colour = G.C.UI.TEXT_LIGHT, scale = 0.25, shadow = true}}
      }}
    }}
    local t = {
        n=G.UIT.ROOT, config = {padding = 0, colour = G.C.CLEAR}, nodes={
        {n=G.UIT.R, config={padding = 0.15, align = 'cl'}, nodes={
            {n=G.UIT.C, config={align = 'cl'}, nodes={
            sell
            }},
            {n=G.UIT.C, config={align = 'cl'}, nodes={
            use
            }},
        }},
    }}
    return t
end

local old_nominal = Card.get_nominal
function Card:get_nominal(mod)
    if self.ability and self.ability.trading then
        local the_rank = self:calculate_exotic({get_id = true})
        local the_suits = {}
        local has_suit = nil
        for i, j in pairs(SMODS.Suits) do
            local suit_eval = self:calculate_exotic({is_suit = j.key})
            if suit_eval then
                the_suits[j.key] = true
                if not has_suit then
                    has_suit = j
                elseif j.suit_nominal > has_suit.suit_nominal then
                    has_suit = j
                end
            end
        end
        local mult = 1
        local rank_mult = 1
        if mod == 'suit' then mult = 10000 end
        if (the_rank < 0) and not has_suit then 
            mult = -10000
        elseif not has_suit then
            mult = 0
        elseif (the_rank < 0) then
            rank_mult = 0
        end
        local r_nominal = 0
        local f_nominal = 0
        if (the_rank > 0) then
            local ranks = {'', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'}
            r_nominal = SMODS.Ranks[ranks[the_rank]].nominal or 0
            f_nominal = SMODS.Ranks[ranks[the_rank]].face_nominal or 0
        end
        local s_nominal = 0
        if has_suit then
            s_nominal = has_suit.suit_nominal or 0
        end
        if (mod == 'suit') and (the_rank < 0) then
            rank_mult = 1
            r_nominal = 1.999
        end
        return 10*r_nominal*rank_mult + s_nominal*mult + 10*f_nominal*rank_mult + 0.000001*self.unique_val + (self.ability.trading.order or 0)*0.00000001+ s_nominal*0.0001*mult
    end
    return old_nominal(self, mod)
end

local old_set_sprites = Card.set_sprites
function Card:set_sprites(_center, _front)
    old_set_sprites(self, _center, _front)
    if _center and self.ability and self.ability.trading and self.ability.trading.atlas then 
        if _center.set then
            if self.children.center then
                if self.ability.trading.atlas and G.ASSET_ATLAS[self.ability.trading.atlas .. '_hc'] then
                    self.children.center.atlas = G.ASSET_ATLAS[G.SETTINGS.colourblind_option and (self.ability.trading.hc_atlas or (self.ability.trading.atlas .. '_hc')) or self.ability.trading.atlas or 'pc_trading']
                else
                    self.children.center.atlas = G.ASSET_ATLAS[G.SETTINGS.colourblind_option and (self.ability.trading.hc_atlas or self.ability.trading.atlas or 'pc_trading_hc') or self.ability.trading.atlas or 'pc_trading']
                end
                self.children.center:set_sprite_pos(self.ability.trading.pos)
            else
                self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS[G.SETTINGS.colourblind_option and (self.ability.trading.hc_atlas or self.ability.trading.atlas or 'pc_trading_hc') or self.ability.trading.atlas or 'pc_trading'], self.ability.trading.pos)
                self.children.center.states.hover = self.states.hover
                self.children.center.states.click = self.states.click
                self.children.center.states.drag = self.states.drag
                self.children.center.states.collide.can = false
                self.children.center:set_role({major = self, role_type = 'Glued', draw_major = self})
            end
        end

        if _center.soul_pos then 
            self.children.floating_sprite = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS['Joker'], self.config.center.soul_pos)
            self.children.floating_sprite.role.draw_major = self
            self.children.floating_sprite.states.hover.can = false
            self.children.floating_sprite.states.click.can = false
        elseif self.ability.trading.soul_pos then
            self.children.floating_sprite = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS[G.SETTINGS.colourblind_option and (self.ability.trading.hc_atlas or self.ability.trading.atlas or 'pc_trading_hc') or self.ability.trading.atlas or 'pc_trading'], self.ability.trading.soul_pos)
            self.children.floating_sprite.role.draw_major = self
            self.children.floating_sprite.states.hover.can = false
            self.children.floating_sprite.states.click.can = false
        end

        if not self.children.back then
            self.children.back = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS["centers"], self.params.bypass_back or (self.playing_card and G.GAME[self.back].pos or G.P_CENTERS['b_red'].pos))
            self.children.back.states.hover = self.states.hover
            self.children.back.states.click = self.states.click
            self.children.back.states.drag = self.states.drag
            self.children.back.states.collide.can = false
            self.children.back:set_role({major = self, role_type = 'Glued', draw_major = self})
        end
    end
end

local old_remove = Card.remove
function Card:remove()
    local result = old_remove(self)
    pc_redo_top10()
    return result
end

local old_set_base = Card.set_base
function Card:set_base(card, initial)
    local result = old_set_base(self, card, initial)
    if initial then
        pc_redo_top10()
    end
    return result
end

local old_copy_card = copy_card
function copy_card(other, new_card, card_scale, playing_card, strip_edition)
    local result = old_copy_card(other, new_card, card_scale, playing_card, strip_edition)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = (function()
            pc_redo_top10()
            return true
        end)
    }))
    return result
end

SMODS.current_mod.set_debuff = function(card)
    if card.ability.temp_debuff then
        return true
    end
end

local old_playing_card_joker_effects = playing_card_joker_effects
function playing_card_joker_effects(cards)
    for i = 1, #G.playing_cards do
        G.playing_cards[i]:calculate_exotic({playing_card_added = true, cards = cards, cardarea = G.playing_cards[i].area})
    end
    old_playing_card_joker_effects(cards)
end

local old_repitions = SMODS.calculate_repetitions
SMODS.calculate_repetitions = function(card, context, reps)
    local reps = old_repitions(card, context, reps)
    reps = reps or {1}
    if context.scoring_hand then
        for l=1, #context.scoring_hand do
            local eval = context.scoring_hand[l]:calculate_exotic({cardarea = context.cardarea, other_card = card, repetition = true, full_hand = G.play.cards, scoring_hand = context.scoring_hand, scoring_name = context.scoring_name, poker_hands = context.poker_hands, end_of_round = context.end_of_round}, {})
            if next(eval) then
                for _, minieval in ipairs(eval) do
                    if minieval.repetitions then
                        for h = 1, minieval.repetitions do
                            reps[#reps+1] = {jokers = {
                                message = minieval.message,
                                card = minieval.cards[#minieval.cards],
                                repetitions = minieval.repetitions,
                                cards = minieval.cards,
                            }}
                        end
                    end
                end
            end
        end
    end
    for l=1, #G.hand.cards do
        local eval = G.hand.cards[l]:calculate_exotic({cardarea = context.cardarea, other_card = card, repetition = true, full_hand = G.play.cards, scoring_hand = context.scoring_hand, scoring_name = context.scoring_name, poker_hands = context.poker_hands, end_of_round = context.end_of_round}, {})
        if next(eval) then
            for _, minieval in ipairs(eval) do
                if minieval.repetitions then
                    for h = 1, minieval.repetitions do
                        reps[#reps+1] = {jokers = {
                            message = minieval.message,
                            card = minieval.cards[#minieval.cards],
                            repetitions = minieval.repetitions,
                            cards = minieval.cards,
                        }}
                    end
                end
            end
        end
    end
    return reps
end

local old_indiv = SMODS.calculate_individual_effect
SMODS.calculate_individual_effect = function(effect, scored_card, percent, key, amount, from_edition)
    local result = old_indiv(effect, scored_card, percent, key, amount, from_edition)
    if (key == 'pc_h_chips') and amount then 
        hand_chips = mod_chips(hand_chips + amount)
        update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})
        if not effect.remove_default_message then
            if from_edition then
                card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {message = localize{type = 'variable', key = amount > 0 and 'a_chips' or 'a_chips_minus', vars = {amount}}, chip_mod = amount, colour = G.C.EDITION, edition = true})
            else
                if key ~= 'chip_mod' then
                    if effect.chip_message then
                        card_eval_status_text(scored_card or effect.focus, 'extra', nil, percent, nil, effect.chip_message)
                    else
                        card_eval_status_text(scored_card or effect.focus, 'chips', amount, percent)
                    end
                end
            end
        end
        return true
    end
    return result
end

local old_always_scores = SMODS.always_scores
function SMODS.always_scores(card)
    local eval = card:calculate_exotic({cardarea = G.play, full_hand = G.play.cards, does_score = true})
    if eval then
        if eval == true then
            return true
        elseif eval == 'remove' then
            return false
        else
            return old_always_scores(card)
        end
    else
        return old_always_scores(card)
    end
end

local old_never_scores = SMODS.never_scores
function SMODS.never_scores(card)
    local eval = card:calculate_exotic({cardarea = G.play, full_hand = G.play.cards, does_score = true})
    if eval then
        if eval == true then
            return old_never_scores(card)
        elseif eval == 'remove' then
            return true
        else
            return old_never_scores(card)
        end
    else
        return old_never_scores(card)
    end
end

local old_no_rank = SMODS.has_no_rank
function SMODS.has_no_rank(card)
    local result = old_no_rank(card)
    if not result and card and card.ability and card.ability.trading then
        local id = card:calculate_exotic({get_id = true})
        if id < 0 then
            return true
        end
    end
    return result
end

table.insert(SMODS.calculation_keys, 'pc_h_chips')

local old_greyed = SMODS.DrawSteps['greyed'].func
SMODS.DrawSteps['greyed'].func = function(self)
    old_greyed(self)
    if self.ability and self.ability.phantom then
        self.children.center:draw_shader('pc_phantom', nil, self.ARGS.send_to_shader)
        if self.children.front and self.ability.effect ~= 'Stone Card' and not self.config.center.replace_base_card then
            self.children.front:draw_shader('pc_phantom', nil, self.ARGS.send_to_shader)
        end
    end
end

SMODS.trigger_effects = function(effects, card)
    local ret = {}
    for _, effect_table in ipairs(effects) do
        -- note: these sections happen to be mutually exclusive:
        -- Playing cards in scoring
        for _, key in ipairs({'playing_card', 'enhancement', 'edition', 'seals'}) do
            SMODS.calculate_effect_table_key(effect_table, key, card, ret)
        end
        for _, key in ipairs(SMODS.Sticker.obj_buffer) do
            SMODS.calculate_effect_table_key(effect_table, key, card, ret)
        end
        -- Playing cards at end of round
        SMODS.calculate_effect_table_key(effect_table, 'end_of_round', card, ret)
        -- Jokers
        for _, key in ipairs({'jokers', 'retriggers'}) do
            SMODS.calculate_effect_table_key(effect_table, key, card, ret)
        end
        -- todo: might want to move these keys to a customizable list/lists
        if effect_table.trading_cards then
            for i = 1, #effect_table.trading_cards do
                SMODS.calculate_effect_table_key(effect_table.trading_cards, i, card, ret)
            end
        end
        if effect_table.grim_stuff then
            for i = 1, #effect_table.grim_stuff do
                SMODS.calculate_effect_table_key(effect_table.grim_stuff, i, card, ret)
            end
        end
    end
    return ret
end

local old_calculate_context = SMODS.calculate_context
function SMODS.calculate_context(context, return_table)
    if context.remove_playing_cards then
        for i = 1, #G.hand.cards do
            G.hand.cards[i]:calculate_exotic({remove_playing_cards = true, removed = context.removed, cardarea = G.hand})
        end
        for i = 1, #G.play.cards do
            G.play.cards[i]:calculate_exotic({remove_playing_cards = true, removed = context.removed, cardarea = G.play})
        end
    end
    return old_calculate_context(context, return_table)
end

local pc_retrigger_colors = {
    HEX("FF7B00"),
    HEX("FF5C00"),
    HEX("FF3E00"),
    HEX("FF1F00"),
    HEX("FF0000"),
    HEX("FF3333"),
    HEX("FF6666"),
    HEX("FF9999"),
    HEX("FFCCCC"),
    HEX("FFFFFF"),
}

local old_calc_indiv = SMODS.calculate_individual_effect
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
    local result = nil
    if ((key ~= 'message') and (key ~= 'func')) or not effect.cards then
        result = old_calc_indiv(effect, scored_card, key, amount, from_edition)
    end
    if (key == 'cards') and (#effect.cards >= 1) then
        local agains = 0
        for k = #effect.cards, 1, -1 do
            local m2 = {}
            for l, m in pairs(effect) do
                if l == 'cards' then
                    m2.cards = {}
                    for n = 1, #m do
                        m2.cards[n] = m[n]
                    end
                else
                    m2[l] = m
                end
            end
            if agains > 0 then
                if pc_retrigger_colors[agains] then
                    m2.colour = pc_retrigger_colors[agains]
                else
                    m2.colour = pc_retrigger_colors[10]
                end
            end
            for l = 1, agains do
                m2.message = m2.message .. '!'
            end
            card_eval_status_text(m2.cards[k], 'jokers', nil, nil, nil, m2)
            agains = agains + 1
        end
    end
    return result
end

local old_seal = SMODS.DrawSteps['seal'].func
SMODS.DrawSteps['seal'].func = function(self, layer)
    old_seal(self, layer)
    if self.ability and self.ability.trading and (self.ability.trading.name == "Full Circle") and self.ability.trading.config and self.ability.trading.config.saved then
        for i, j in pairs(self.ability.trading.config.saved) do
            if G['pc_mini_' .. i] then
                G['pc_mini_' .. i].role.draw_major = self
                G['pc_mini_' .. i]:draw_shader('dissolve', nil, nil, nil, self.children.center)
            end
        end
    end
    if G and G.GAME and G.GAME.pc_show_top10 and self.ability and self.ability.pc_top10 then
        G.pc_top10_indicator.role.draw_major = self
        G.pc_top10_indicator:draw_shader('dissolve', nil, nil, nil, self.children.center)
    end
end

local old_poker_info = G.FUNCS.get_poker_hand_info
function G.FUNCS.get_poker_hand_info(_cards)
    local text, loc_disp_text, poker_hands, scoring_hand, disp_text = old_poker_info(_cards)
    for i = 1, #_cards do
        if _cards[i].ability and _cards[i].ability.trading and (_cards[i].ability.trading.name == "Five Fingers") and (#_cards == 5) and not _cards[i].debuff then
            text = G.GAME.pc_most_played_poker_hand or "High Card"
            break
        end
    end
    disp_text = text
    local _hand = SMODS.PokerHands[text]
    if text == 'Straight Flush' then
		local royal = true
		for j = 1, #scoring_hand do
			local rank = SMODS.Ranks[scoring_hand[j].base.value]
			royal = royal and (rank.key == 'Ace' or rank.key == '10' or rank.face)
		end
		if royal then
			disp_text = 'Royal Flush'
		end
	elseif _hand and _hand.modify_display_text and type(_hand.modify_display_text) == 'function' then
		disp_text = _hand:modify_display_text(_cards, scoring_hand) or disp_text
	end
    loc_disp_text = localize(disp_text, 'poker_hands')
    return text, loc_disp_text, poker_hands, scoring_hand, disp_text
end

table.insert(SMODS.calculation_keys, 'cards')

----------------------------------------------
------------MOD CODE END----------------------
