--- STEAMODDED HEADER
--- MOD_NAME: Custom Playing Cards
--- MOD_ID: CustomCards
--- PREFIX: pc
--- MOD_AUTHOR: [mathguy]
--- MOD_DESCRIPTION: Playing Cards with special abilities.
--- VERSION: 1.0.0
----------------------------------------------
------------MOD CODE -------------------------

SMODS.Enhancement {
    key = 'trading',
    name = "Speical Card",
    config = {},
    replace_base_card = true,
    no_suit = true,
    no_rank = true,
    pos = {x = 0, y = 0},
    in_pool = function(self)
        return false
    end,
    loc_text = {
        name = "Trading"
    }
}

SMODS.Atlas({ key = "trading", atlas_table = "ASSET_ATLAS", path = "cards.png", px = 71, py = 95})

SMODS.Atlas({ key = "tarots", atlas_table = "ASSET_ATLAS", path = "tarots.png", px = 71, py = 95})

SMODS.Atlas({ key = "decks", atlas_table = "ASSET_ATLAS", path = "decks.png", px = 71, py = 95})

SMODS.Atlas({ key = "booster", atlas_table = "ASSET_ATLAS", path = "boosters.png", px = 71, py = 95})

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
    for i = 1, math.ceil(#G.P_CENTER_POOLS['Exotic']/20) do
      table.insert(tarot_options, localize('k_page')..' '..tostring(i)..'/'..tostring(math.ceil(#G.P_CENTER_POOLS['Exotic']/20)))
    end
  
    for j = 1, #G.your_collection do
        for i = 1, 5 do
            if (i+(j-1)*(5)) <= #G.P_CENTER_POOLS['Exotic'] then
                local trading = G.P_CENTER_POOLS['Exotic'][i+(j-1)*(5)]
                local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W, G.CARD_H, G.P_CARDS[trading.base], G.P_CENTERS.c_base)
                card:start_materialize(nil, i>1 or j>1)
                card:set_ability(G.P_CENTERS["m_pc_trading"], true)
                card.ability.trading = copy_table(trading)
                card:set_sprites(card.config.center)
                G.your_collection[j]:emplace(card)
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
            card:set_ability(G.P_CENTERS["m_pc_trading"], true)
            card.ability.trading = copy_table(trading)
            card:set_sprites(card.config.center)
            G.your_collection[j]:emplace(card)
        end
    end
    INIT_COLLECTION_CARD_ALERTS()
end

function Card:calculate_exotic(context, do_repeat)
    local new_do_repeat = {self}
    if do_repeat then
        for j = 1, #do_repeat do
            table.insert(new_do_repeat, do_repeat[j])
        end
    end
    if self.debuff then
        if context.does_score then
            return false
        elseif context.is_suit or context.get_id then
            
        else
            return {}
        end
    end
    local obj = self.config.center
    local name = self.ability.trading and self.ability.trading.name
    if not name then
        if context.does_score then
            return false
        elseif context.is_suit or context.get_id then
            return nil
        else
            return {}
        end
    end
    local effects = {}
    local reps = {1}
    local i = 1
    while (i <= #reps) do
        local valid = true
        if do_repeat and (i ~= 1) then
            for j = 1, #do_repeat do
                if (i ~= 1) and (do_repeat[j] == self) then
                    valid = false
                end
            end
        end
        if valid then
            if i ~= 1 then
                table.insert(effects, {extra = {func = function()
                    if reps[i] then
                        if reps[i].cards then
                            for j = 2, #reps[i].cards do
                                card_eval_status_text(reps[i].cards[j], 'jokers', nil, nil, nil, reps[i])
                            end
                        end
                    end
                end}})
            end
            local config_thing = self.ability.trading.config
            if context.individual and (context.cardarea == G.play) then
                if self.area == G.play then
                    if name == "Flint Card" then
                        if context.other_card ~= self then
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
                                card:flip()
                                G.deck:emplace(card)
                                table.insert(G.playing_cards, card)
                                return true
                            end
                            }))
                        end, message = "+1 " .. localize("Jack", 'ranks')}})
                    end
                end
            elseif context.discard then
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
                    end
                end
            elseif context.before then
                if name == "Rules Card" then
                    ease_discard(1)
                    card_eval_status_text(self, 'jokers', nil, nil, nil, {message = localize{type='variable',key='a_discards',vars={config_thing.discards}}, colour = G.C.RED})
                elseif name == "Wild Draw 4" then
                    card_eval_status_text(self, 'jokers', nil, nil, nil, {message = localize{type='variable',key='a_cards',vars={config_thing.cards}}})
                    local size = math.min(#G.deck.cards, config_thing.cards)
                    for i = 1, config_thing.cards do
                        draw_card(G.deck,G.hand, i*100/size,'up', true)
                        delay(0.1)
                    end
                end
            elseif context.does_score then
                if name == "Double Up" then
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
                end
                return -math.random(100, 1000000)
            elseif context.repetition then
                local special_table = {self}
                if i ~= 1 then
                    for j = 1, #reps[i].cards do
                        table.insert(special_table, reps[i].cards[j])
                    end
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
            if do_repeat and next(effects) and (i == 1) then
                for j = 1, #do_repeat do
                    if do_repeat[j] == self then
                        return {}
                    end
                end
                local eval = eval_card(self, {cardarea = self.area, repetition = true, repetition_only = true, full_hand = context.full_hand, scoring_hand = context.scoring_hand, scoring_name = context.scoring_name, poker_hands = context.poker_hands})
                if next(eval) and (next(effects[1]) or #effects > 1) then 
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

                --from Jokers
                for l=1, #G.jokers.cards do
                    --calculate the joker effects
                    local eval = eval_card(G.jokers.cards[l], {cardarea = self.area, other_card = self, repetition = true, end_of_round = context.end_of_round, full_hand = context.full_hand, scoring_hand = context.scoring_hand, scoring_name = context.scoring_name, poker_hands = context.poker_hands, callback = function(card, ret) eval = {jokers = ret}
                        if next(eval) then 
                            local new_table = {eval.jokers.card}
                            for g = 1, #do_repeat do
                                table.insert(new_table, do_repeat[g])
                            end
                            for h = 1, eval.jokers.repetitions do
                                reps[#reps+1] = {
                                    cards = new_table,
                                    message = eval.jokers.message,
                                    repetitions = eval.jokers.repetitions,
                                }
                            end
                        end 
                    end})
                end

                if context.scoring_hand then
                    for l=1, #context.scoring_hand do
                        --calculate the joker effects
                        local eval = context.scoring_hand[l]:calculate_exotic({cardarea = self.area, other_card = self, repetition = true, end_of_round = context.end_of_round, full_hand = context.full_hand, scoring_hand = context.scoring_hand, scoring_name = context.scoring_name, poker_hands = context.poker_hands}, new_do_repeat)
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

                for l=1, #G.hand.cards do
                    --calculate the joker effects
                    local eval = G.hand.cards[l]:calculate_exotic({cardarea = self.area, other_card = self, repetition = true, end_of_round = context.end_of_round, full_hand = context.full_hand, scoring_hand = context.scoring_hand, scoring_name = context.scoring_name, poker_hands = context.poker_hands}, new_do_repeat)
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
                G.hand.highlighted[i]:set_ability(G.P_CENTERS["m_pc_trading"])
                G.hand.highlighted[i].ability.trading = copy_table(G.P_TRADING[key])
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

SMODS.Back {
    key = 'Collected',
    loc_txt = {
        name = "Collected Deck",
        text = {
            "Start with {C:attention}2{}",
            "extra {C:attention}Trading Cards{}"
        }
    },
    atlas = "decks",
    pos = {x = 2, y = 0},
    name = "Stuff Deck",
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                for i = 1, 2 do
                    local card = pseudorandom_element(G.playing_cards, pseudoseed('collect'))
                    card:remove()
                end
                for i = 1, 2 do
                    local key = G.P_TRADING[get_trading_key()]
                    local _card = Card(G.deck.T.x, G.deck.T.y, G.CARD_W, G.CARD_H, G.P_CARDS[key.base], G.P_CENTERS['m_pc_trading'], {playing_card = G.playing_card})
                    _card.ability.trading = copy_table(key)
                    _card:set_sprites(_card.config.center)
                    G.deck:emplace(_card)
                    table.insert(G.playing_cards, _card)
                end
            return true
            end
        }))
    end
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
        _card.ability.trading = copy_table(key)
        _card:set_sprites(_card.config.center)
        local edition = poll_edition('trading_edition'..G.GAME.round_resets.ante, 1, true)
        _card:set_edition(edition)
        _card:set_seal(SMODS.poll_seal({mod = 3}))
        return _card
    end
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
        _card.ability.trading = copy_table(key)
        _card:set_sprites(_card.config.center)
        local edition = poll_edition('trading_edition'..G.GAME.round_resets.ante, 1, true)
        _card:set_edition(edition)
        _card:set_seal(SMODS.poll_seal({mod = 3}))
        return _card
    end
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
        _card.ability.trading = copy_table(key)
        _card:set_sprites(_card.config.center)
        local edition = poll_edition('trading_edition'..G.GAME.round_resets.ante, 1, true)
        _card:set_edition(edition)
        _card:set_seal(SMODS.poll_seal({mod = 3}))
        return _card
    end
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
        _card.ability.trading = copy_table(key)
        _card:set_sprites(_card.config.center)
        local edition = poll_edition('trading_edition'..G.GAME.round_resets.ante, 1, true)
        _card:set_edition(edition)
        _card:set_seal(SMODS.poll_seal({mod = 3}))
        return _card
    end
}

function get_trading_key()
    local _, key = pseudorandom_element(G.P_TRADING, pseudoseed('trading'))
    return key
end

----------------------------------------------
------------MOD CODE END----------------------