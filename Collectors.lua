--- STEAMODDED HEADER
--- MOD_NAME: Collectors Cards
--- MOD_ID: COLL
--- PREFIX: coll
--- MOD_AUTHOR: [mathguy]
--- MOD_DESCRIPTION: Collectors Cards
--- VERSION: 1.0.0
----------------------------------------------
------------MOD CODE -------------------------

-----------Card Sets--------------------------

local sets = {
    suited = {
        l_coll_card_2 = false,
        l_coll_card_3 = false,
        l_coll_card_4 = false,
        l_coll_card_5 = false,
        l_coll_card_6 = false,
        l_coll_card_7 = false,
        l_coll_card_8 = false,
        l_coll_card_10 = false,
        l_coll_card_Jack = false,
        l_coll_card_Queen = false,
        l_coll_card_King = false,
        l_coll_card_Ace = false,
    },
    chess = {
        l_coll_scholar_mate = false,
        l_coll_scandinavian = false,
        l_coll_endgame = false,
        l_coll_stalemate = false,
    },
    relic = {
        l_coll_silverware = false,
        l_coll_magnetic = false,
        l_coll_tesselate = false,
    }
}

function SMODS.current_mod.process_loc_text()
    G.localization.descriptions.Other["suited_set"] = 
    {
        text = {
            "{C:red}Suited Set!{}"
        }
    }
    G.localization.descriptions.Other["chess_set"] = 
    {
        text = {
            "{C:red}Chess Set{}"
        }
    }
    G.localization.descriptions.Other["relic_set"] = 
    {
        text = {
            "{C:red}Relic Set{}"
        }
    }
    G.localization.descriptions.Other["suited_tt"] = 
    {
        name = "Mega Flush",
        text = {
            "{C:red}+7{} Mult"
        }
    }
    G.localization.descriptions.Other["chess_tt"] = 
    {
        name = "Joker's Chess",
        text = {
            "Retrigger this card {C:attention}2{} times",
            "if {C:attention}first hand{} of round",
            "is a single {C:attention}King{}"
        }
    }
    G.localization.descriptions.Other["relic_tt"] = 
    {
        name = "Ancient Seal",
        text = {
            "Returns to hand",
            "when {C:attention}played{}",
        }
    }
    local nominal = {
        text = {
            "{C:blue}+#1#{} Chips"
        }
    }
    G.localization.descriptions.Other["p_coll_trading_mega"] =
    {name = "Mega Trading Pack", text = {
        "Choose {C:attention}2{} of up to",
        "{C:attention}4{C:attention} Trading{} cards to",
        "add to your deck"
    }}
    G.localization.misc.dictionary["k_trading_pack"] = "Trading Pack"
    if true then
        G.localization.descriptions.Other.l_coll_card_2_desc = nominal
        G.localization.descriptions.Other.l_coll_card_3_desc = nominal
        G.localization.descriptions.Other.l_coll_card_4_desc = nominal
        G.localization.descriptions.Other.l_coll_card_5_desc = nominal
        G.localization.descriptions.Other.l_coll_card_6_desc = nominal
        G.localization.descriptions.Other.l_coll_card_7_desc = nominal
        G.localization.descriptions.Other.l_coll_card_8_desc = nominal
        G.localization.descriptions.Other.l_coll_card_9_desc = nominal
        G.localization.descriptions.Other.l_coll_card_10_desc = nominal
        G.localization.descriptions.Other.l_coll_card_Jack_desc = nominal
        G.localization.descriptions.Other.l_coll_card_Queen_desc = nominal
        G.localization.descriptions.Other.l_coll_card_King_desc = nominal
        G.localization.descriptions.Other.l_coll_card_Ace_desc = nominal
        G.localization.descriptions.Other.l_coll_card_2_name = {text = {"2 of {C:coll_collectors}Collectors"}}
        G.localization.descriptions.Other.l_coll_card_3_name = {text = {"3 of {C:coll_collectors}Collectors"}}
        G.localization.descriptions.Other.l_coll_card_4_name = {text = {"4 of {C:coll_collectors}Collectors"}}
        G.localization.descriptions.Other.l_coll_card_5_name = {text = {"5 of {C:coll_collectors}Collectors"}}
        G.localization.descriptions.Other.l_coll_card_6_name = {text = {"6 of {C:coll_collectors}Collectors"}}
        G.localization.descriptions.Other.l_coll_card_7_name = {text = {"7 of {C:coll_collectors}Collectors"}}
        G.localization.descriptions.Other.l_coll_card_8_name = {text = {"8 of {C:coll_collectors}Collectors"}}
        G.localization.descriptions.Other.l_coll_card_9_name = {text = {"9 of {C:coll_collectors}Collectors"}}
        G.localization.descriptions.Other.l_coll_card_10_name = {text = {"10 of {C:coll_collectors}Collectors"}}
        G.localization.descriptions.Other.l_coll_card_Jack_name = {text = {"Jack of {C:coll_collectors}Collectors"}}
        G.localization.descriptions.Other.l_coll_card_Queen_name = {text = {"Queen of {C:coll_collectors}Collectors"}}
        G.localization.descriptions.Other.l_coll_card_King_name = {text = {"King of {C:coll_collectors}Collectors"}}
        G.localization.descriptions.Other.l_coll_card_Ace_name = {text = {"Ace of {C:coll_collectors}Collectors"}}
    end
end

function SMODS.current_mod.reset_game_globals()
    G.GAME.current_round.joker_chess = false
end

----------------------------------------------

SMODS.Atlas({ key = "c_1", atlas_table = "ASSET_ATLAS", path = "ui_assets.png", px = 18, py = 18})

SMODS.Atlas({ key = "c_2", atlas_table = "ASSET_ATLAS", path = "ui_assets_opt2.png", px = 18, py = 18})

SMODS.Atlas({ key = "suit_1", atlas_table = "ASSET_ATLAS", path = "cSuit1.png", px = 71, py = 95})

SMODS.Atlas({ key = "suit_2", atlas_table = "ASSET_ATLAS", path = "cSuit2.png", px = 71, py = 95})

SMODS.Atlas({ key = "cards", atlas_table = "ASSET_ATLAS", path = "cards.png", px = 71, py = 95})

SMODS.Atlas({ key = "booster", atlas_table = "ASSET_ATLAS", path = "boosters.png", px = 71, py = 95})

SMODS.Atlas({ key = "decks", atlas_table = "ASSET_ATLAS", path = "decks.png", px = 71, py = 95})

SMODS.Atlas({ key = "tarots", atlas_table = "ASSET_ATLAS", path = "tarots.png", px = 71, py = 95})

SMODS.Atlas({ key = "tags", atlas_table = "ASSET_ATLAS", path = "tags.png", px = 34, py = 34})

local collectors = SMODS.Suit {
    key = "collectors",
    pos = { y = 0 },
    card_key = 'L',
    ui_pos = { x = 0, y = 0 },
    hc_ui_atlas = 'c_2',
    lc_ui_atlas = 'c_1',
    hc_atlas = 'suit_2',
    lc_atlas = 'suit_1',
    hc_colour = HEX '1600b7',
    lc_colour = HEX '443c7f',
    in_pool = function(self)
        return false
    end,
    loc_txt = {
        singular = 'Collector',
        plural = 'Collectors'
    },
    hidden = true
}

local old_inject = SMODS.inject_p_card
SMODS.inject_p_card = function(suit, rank)
    if suit ~= collectors then
        old_inject(suit, rank)
    else
        G.P_CARDS[suit.card_key .. '_' .. rank.card_key] = {
            name = rank.key .. ' of ' .. suit.key,
            value = rank.key,
            suit = suit.key,
            pos = { x = rank.pos.x, y = rank.suit_map[suit.key] or suit.pos.y },
            lc_atlas = rank.suit_map[suit.key] and rank.lc_atlas or suit.lc_atlas,
            hc_atlas = rank.suit_map[suit.key] and rank.hc_atlas or suit.hc_atlas,
            collect = true,
            key = "l_coll_card_" .. tostring(rank.key),
            alt_key = suit.card_key .. '_' .. rank.card_key,
            collect_playing_card = true,
            loc_vars = function()
                return {2 * rank.nominal}
            end,
            sets = {"suited"},
            cost = 1,
            sell_cost = 1,
            get_eval = function(self, card)
                if self.debuff then return {mult = 0} end
                local chips = (2 * rank.nominal) + card.ability.bonus + (card.ability.perma_bonus or 0)
                local mult = G.GAME.collector_sets['suited'].full and 7 or 0
                if card.ability.effect == "Lucky Card" then 
                    if pseudorandom('lucky_mult') < G.GAME.probabilities.normal/5 then
                        card.lucky_trigger = true
                        mult = mult + card.ability.mult + (card.ability.perma_bonus_mult or 0)
                    end
                else  
                    mult = mult + card.ability.mult + (card.ability.perma_bonus_mult or 0)
                end
                return {
                    chips = chips,
                    mult = mult,
                }
            end
        }
    end
end

SMODS.Back {
    key = 'Collected',
    loc_txt = {
        name = "Collected Deck",
        text = {
            "Start with {C:attention}3{}",
            "extra {C:attention}Trading Cards{}"
        }
    },
    name = "Stuff Deck",
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                for i = 1, 3 do
                    local key = create_unique_trading_key()
                    local _card = Card(G.deck.T.x, G.deck.T.y, G.CARD_W, G.CARD_H, G.P_CARDS[key], G.P_CENTERS['c_base'], {playing_card = G.playing_card})
                    G.deck:emplace(_card)
                    table.insert(G.playing_cards, _card)
                end
            return true
            end
        }))
    end
}

SMODS.Back {
    key = 'silver',
    loc_txt = {
        name = "Silver Deck",
        text = {
            "Start with an",
            "{C:green}Uncommon{} {C:attention}Joker{}"
        },
        unlock = {
            "Play {C:attention}Silverware{}",
            "{{C:attention}100{} times"
        }
    },
    name = "Silver Deck",
    atlas = "decks",
    pos = {x = 0, y = 0},
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                local card = create_card('Joker', nil, nil, 0.71, nil, nil, nil, 'sil')
                card:add_to_deck()
                G.jokers:emplace(card)
            return true
            end
        }))
    end,
    unlocked = false,
    check_for_unlock = function(self, args)
        if (args.type == 'silverware_played') and (args.amount >= 100) then
            return true
        end
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
     weight = 1.2,
     name = "Trading Pack",
     pos = {x = 0, y = 0},
     config = {extra = 2, choose = 1, name = "Trading Pack"},
     create_card = function(self, card)
        return create_trading_card(G.pack_cards, 'trade')
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
    weight = 1.2,
    name = "Trading Pack",
    pos = {x = 1, y = 0},
    config = {extra = 2, choose = 1, name = "Trading Pack"},
    create_card = function(self, card)
        return create_trading_card(G.pack_cards, 'trade')
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
    weight = 1.2,
    name = "Trading Pack",
    pos = {x = 0, y = 1},
    config = {extra = 4, choose = 1, name = "Trading Pack"},
    create_card = function(self, card)
        return create_trading_card(G.pack_cards, 'trade')
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
    name = "Trading Pack",
    pos = {x = 1, y = 1},
    config = {extra = 4, choose = 2, name = "Trading Pack"},
    create_card = function(self, card)
        return create_trading_card(G.pack_cards, 'trade')
    end
}

SMODS.Tarot {
    key = 'exchange',
    loc_txt = {
        name = "Exchange",
        text = {
            "Converts up to",
            "{C:attention}#1#{} selected card",
            "to a {C:attention}Trading Card{}"
        }
    },
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
            local rand_trade = 
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                local key = create_unique_trading_key()
                G.hand.highlighted[i]:set_base(G.P_CARDS[key])
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

SMODS.Tag {
    key = 'collectors',
    atlas = 'tags',
    loc_txt = {
        name = "Collector's Tag",
        text = {
            "Gives a free",
            "{C:red}Mega Trading Pack"
        }
    },
    pos = {x = 0, y = 0},
    apply = function(tag, context)
        if context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.RED,function() 
                local key = 'p_coll_trading_mega_1'
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
        info_queue[#info_queue+1] = {key = 'p_coll_trading_mega', set = 'Other'}
        return {}
    end,
    config = {type = 'new_blind_choice'}
}

SMODS.CCards = {}
SMODS.CCard = SMODS.GameObject:extend {
    obj_table = SMODS.CCards,
    obj_buffer = {},
    set = 'CCard',
    class_prefix = 'l',
    atlas = 'coll_cards',
    discovered = false,
    badge_colour = HEX('FFFFFF'),
    required_params = {
        'key',
        'pos',
        'number'
    },
    config = {},
    inject = function(self)
        self.alt_key = "CL" .. tostring(self.number)
        add_collectors_card(self)
    end,
    process_loc_text = function(self)
        SMODS.process_loc_text(G.localization.descriptions.Other, self.key .. "_desc", self.loc_txt)
        SMODS.process_loc_text(G.localization.descriptions.Other, self.key .. "_name", { text = { self.name } })
    end,
    is_suit = function(self, suit)
        return false
    end,
    get_id = function(self, card)
        return -math.random(100, 1000000)
    end,
    is_face = function(self, card)
        if next(find_joker("Pareidolia")) then
            return true
        end
        return false
    end,
    get_suit = function(self, card)
        return "No Suit"
    end,
    get_nominal = function(self, card, mod)
        return 0.000001*card.unique_val
    end
}

SMODS.CCard {
    key = "joker",
    pos = {x = 0, y = 0},
    number = 1,
    name = "Joker Card",
    loc_txt = {
        name = "Joker Card",
        text = {
            "Can be used as any",
            "suit or rank"
        }
    },
    is_suit = function(self, card, bypass_debuff, flush_calc)
        return true
    end,
    get_id = function(self, card)
        return -math.random(100, 1000000)
    end,
    get_eval = function(self, card)
        if self.debuff then return {chips = 0, mult = 0, x_mult = 1} end
        local chips = card.ability.bonus + (card.ability.perma_bonus or 0)
        local mult = 0
        if card.ability.effect == "Lucky Card" then 
            if pseudorandom('lucky_mult') < G.GAME.probabilities.normal/5 then
                card.lucky_trigger = true
                mult = card.ability.mult + (card.ability.perma_bonus_mult or 0)
            end
        else  
            mult = card.ability.mult + (card.ability.perma_bonus_mult or 0)
        end
        return {
            chips = chips,
            mult = mult,
            x_mult = card.ability.x_mult
        }
    end,
    match = function(self, card, other, from_self)
        if not from_self then
            return true
        end
    end,
    consecutive = function(self, rank, skip)
        if skip and (rank == 13) then
            return false
        end
        return true
    end,
    straight_base = function(self, rank)
        return true
    end,
    is_face = function(self, card, from_boss)
        return true
    end,
    match_id = function(self, card)
        return 14
    end,
    multirank = true,
    cost = 5,
    sell_cost = 5,
}

SMODS.CCard {
    key = "flint",
    pos = {x = 1, y = 0},
    number = 2,
    name = "Flint Card",
    loc_txt = {
        name = "Flint Card",
        text = {
            "can be used as",
            "{C:hearts}Hearts{} or {C:diamonds}Diamonds{}",
            "{C:red}+5{} Mult",
        }
    },
    is_suit = function(self, card, suit, bypass_debuff, flush_calc)
        if (card.ability.name == 'Wild Card' or card.config.center.any_suit) and not card.debuff then
            return true
        end
        return (suit == "Hearts") or (suit == "Diamonds")
    end,
    get_eval = function(self, card)
        if self.debuff then return {chips = 0, mult = 0, x_mult = 1} end
        local chips = card.ability.bonus + (card.ability.perma_bonus or 0)
        local mult = 5
        if card.ability.effect == "Lucky Card" then 
            if pseudorandom('lucky_mult') < G.GAME.probabilities.normal/5 then
                card.lucky_trigger = true
                mult = 5 + card.ability.mult + (card.ability.perma_bonus_mult or 0)
            end
        else  
            mult = 5 + card.ability.mult + (card.ability.perma_bonus_mult or 0)
        end
        return {
            chips = chips,
            mult = mult,
            x_mult = card.ability.x_mult
        }
    end,
    cost = 3,
    sell_cost = 3
}

SMODS.CCard {
    key = "scholar_mate",
    pos = {x = 3, y = 0},
    number = 3,
    name = "Scholar's Mate",
    loc_txt = {
        name = "Scholar's Mate",
        text = {
            "{C:attention}Queen{}, {C:blue}+#1#{} Chips",
            "{C:red}+#2#{} Mult when played",
            "in the {C:attention}second{} hand"
        }
    },
    is_suit = function(self, card, bypass_debuff, flush_calc)
        if (card.ability.name == 'Wild Card' or card.config.center.any_suit) and not card.debuff then
            return true
        end
        return false
    end,
    get_id = function(self, card)
        return 12
    end,
    get_eval = function(self, card)
        if self.debuff then return {chips = 0, mult = 0, x_mult = 1} end
        local chips = 10 + card.ability.bonus + (card.ability.perma_bonus or 0)
        local mult = (G.GAME.current_round.hands_played == 1) and 7 or 0
        if card.ability.effect == "Lucky Card" then 
            if pseudorandom('lucky_mult') < G.GAME.probabilities.normal/5 then
                card.lucky_trigger = true
                mult = mult + card.ability.mult + (card.ability.perma_bonus_mult or 0)
            end
        else  
            mult = mult + card.ability.mult + (card.ability.perma_bonus_mult or 0)
        end
        return {
            chips = chips,
            mult = mult,
            x_mult = card.ability.x_mult
        }
    end,
    is_face = function(self, card, from_boss)
        return true
    end,
    get_nominal = function(self, card, mod)
        return 100 + card.base.suit_nominal + (card.base.suit_nominal_original or 0)*0.0001 + 2 + 0.000001*card.unique_val
    end,
    cost = 2,
    sell_cost = 2,
    loc_vars = function()
        return {10, 7}
    end,
    sets = {"chess"},
    seal_messiness = function(self, card, context)
        if context.repetition and G.GAME.current_round.joker_chess and G.GAME.collector_sets['chess'].full then
            if card.seal == 'Red' then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 3,
                    card = card
                }
            else
                return {
                    message = localize('k_again_ex'),
                    repetitions = 2,
                    card = card
                }
            end
        end
    end
}

SMODS.CCard {
    key = "scandinavian",
    pos = {x = 2, y = 0},
    number = 4,
    name = "Scandinavian Defense",
    loc_txt = {
        name = "Scandinavian Defense",
        text = {
            "{C:attention}Queen{}, {C:blue}+#1#{} Chips",
            "{C:red}+#2#{} Mult when with",
            "no {C:spades}Spades{} or {C:clubs}Clubs{}"
        }
    },
    is_suit = function(self, card, bypass_debuff, flush_calc)
        if (card.ability.name == 'Wild Card' or card.config.center.any_suit) and not card.debuff then
            return true
        end
        return false
    end,
    get_id = function(self, card)
        return 12
    end,
    get_eval = function(self, card)
        if self.debuff then return {chips = 0, mult = 0, x_mult = 1} end
        local chips = 10 + card.ability.bonus + (card.ability.perma_bonus or 0)
        local valid = true
        for i = 1, #G.play.cards do
            local card2 = G.play.cards[i]
            if (card2:is_suit("Spades") or card2:is_suit("Clubs")) and (card ~= card2) then
                valid = false
            end
        end
        local mult = (valid) and 7 or 0
        if card.ability.effect == "Lucky Card" then 
            if pseudorandom('lucky_mult') < G.GAME.probabilities.normal/5 then
                card.lucky_trigger = true
                mult = mult + card.ability.mult + (card.ability.perma_bonus_mult or 0)
            end
        else  
            mult = mult + card.ability.mult + (card.ability.perma_bonus_mult or 0)
        end
        return {
            chips = chips,
            mult = mult,
            x_mult = card.ability.x_mult
        }
    end,
    is_face = function(self, card, from_boss)
        return true
    end,
    get_nominal = function(self, card, mod)
        return 100 + card.base.suit_nominal + (card.base.suit_nominal_original or 0)*0.0001 + 2 + 0.000001*card.unique_val
    end,
    cost = 2,
    sell_cost = 2,
    loc_vars = function()
        return {10, 7}
    end,
    sets = {"chess"},
    seal_messiness = function(self, card, context)
        if context.repetition and G.GAME.current_round.joker_chess and G.GAME.collector_sets['chess'].full then
            if card.seal == 'Red' then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 3,
                    card = card
                }
            else
                return {
                    message = localize('k_again_ex'),
                    repetitions = 2,
                    card = card
                }
            end
        end
    end
}

SMODS.CCard {
    key = "endgame",
    pos = {x = 0, y = 1},
    number = 5,
    name = "Endgame Tactics",
    loc_txt = {
        name = "Endgame Tactics",
        text = {
            "{C:attention}King{}, {C:blue}+#1#{} Chips",
            "{C:blue}+#2#{} Chips in {C:attention}final{}",
            "{C:attention}hand{} of round"
        }
    },
    is_suit = function(self, card, bypass_debuff, flush_calc)
        if (card.ability.name == 'Wild Card' or card.config.center.any_suit) and not card.debuff then
            return true
        end
        return false
    end,
    get_id = function(self, card)
        return 13
    end,
    get_eval = function(self, card)
        if self.debuff then return {chips = 0, mult = 0, x_mult = 1} end
        local chips = 10 + card.ability.bonus + (card.ability.perma_bonus or 0)
        local mult = 0
        chips = chips + ((G.GAME.current_round.hands_left == 0) and 60 or 0)
        if card.ability.effect == "Lucky Card" then 
            if pseudorandom('lucky_mult') < G.GAME.probabilities.normal/5 then
                card.lucky_trigger = true
                mult = mult + card.ability.mult + (card.ability.perma_bonus_mult or 0)
            end
        else  
            mult = mult + card.ability.mult + (card.ability.perma_bonus_mult or 0)
        end
        return {
            chips = chips,
            mult = mult,
            x_mult = card.ability.x_mult
        }
    end,
    is_face = function(self, card, from_boss)
        return true
    end,
    get_nominal = function(self, card, mod)
        return 100 + card.base.suit_nominal + (card.base.suit_nominal_original or 0)*0.0001 + 3 + 0.000001*card.unique_val
    end,
    cost = 2,
    sell_cost = 2,
    loc_vars = function()
        return {10, 60}
    end,
    sets = {"chess"},
    seal_messiness = function(self, card, context)
        if context.repetition and G.GAME.current_round.joker_chess and G.GAME.collector_sets['chess'].full then
            if card.seal == 'Red' then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 3,
                    card = card
                }
            else
                return {
                    message = localize('k_again_ex'),
                    repetitions = 2,
                    card = card
                }
            end
        end
    end
}

SMODS.CCard {
    key = "stalemate",
    pos = {x = 4, y = 0},
    number = 6,
    name = "Stalemate",
    loc_txt = {
        name = "Stalemate",
        text = {
            "{C:attention}King{}, {C:blue}+#1#{} Chips",
            "{C:blue}+#2#{} Chips when played",
            "with {C:attention}2{} or more {C:attention}Queens{}"
        }
    },
    is_suit = function(self, card, bypass_debuff, flush_calc)
        if (card.ability.name == 'Wild Card' or card.config.center.any_suit) and not card.debuff then
            return true
        end
        return false
    end,
    get_id = function(self, card)
        return 13
    end,
    get_eval = function(self, card)
        if self.debuff then return {chips = 0, mult = 0, x_mult = 1} end
        local chips = 10 + card.ability.bonus + (card.ability.perma_bonus or 0)
        local mult = 0
        local valid = 0
        for i = 1, #G.play.cards do
            local card2 = G.play.cards[i]
            if (card2:straight_base(12) or (card2:get_id() == 12)) and (card ~= card2) then
                valid = valid + 1
            end
        end
        chips = chips + ((valid >= 2) and 60 or 0)
        if card.ability.effect == "Lucky Card" then 
            if pseudorandom('lucky_mult') < G.GAME.probabilities.normal/5 then
                card.lucky_trigger = true
                mult = mult + card.ability.mult + (card.ability.perma_bonus_mult or 0)
            end
        else  
            mult = mult + card.ability.mult + (card.ability.perma_bonus_mult or 0)
        end
        return {
            chips = chips,
            mult = mult,
            x_mult = card.ability.x_mult
        }
    end,
    is_face = function(self, card, from_boss)
        return true
    end,
    get_nominal = function(self, card, mod)
        return 100 + card.base.suit_nominal + (card.base.suit_nominal_original or 0)*0.0001 + 3 + 0.000001*card.unique_val
    end,
    cost = 2,
    sell_cost = 2,
    loc_vars = function()
        return {10, 60}
    end,
    sets = {"chess"},
    seal_messiness = function(self, card, context)
        if context.repetition and G.GAME.current_round.joker_chess and G.GAME.collector_sets['chess'].full then
            if card.seal == 'Red' then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 3,
                    card = card
                }
            else
                return {
                    message = localize('k_again_ex'),
                    repetitions = 2,
                    card = card
                }
            end
        end
    end
}

SMODS.CCard {
    key = "tesselate",
    pos = {x = 3, y = 1},
    number = 7,
    name = "Tesselate",
    loc_txt = {
        name = "Tesselate",
        text = {
            "Copy the rank and suit",
            "of the most played card",
            "{C:inactive}({C:attention}#1# {C:inactive}of {C:attention}#2#{C:inactive})"
        }
    },
    is_suit = function(self, card, suit, bypass_debuff, flush_calc)
        if (card.ability.name == 'Wild Card' or card.config.center.any_suit) and not card.debuff then
            return true
        end
        return (suit == G.GAME.most_played_card.suit)
    end,
    get_suit = function(self)
        return (G.GAME and G.GAME.most_played_card and G.GAME.most_played_card.suit) or "No Suit"
    end,
    get_id = function(self, card)
        if G.GAME.most_played_card.rank > 0 then
            return G.GAME.most_played_card.rank or -math.random(100, 1000000)
        else
            return -math.random(100, 1000000)
        end
    end,
    get_eval = function(self, card)
        if self.debuff then return {chips = 0, mult = 0, x_mult = 1} end
        local chips = card.ability.bonus + (card.ability.perma_bonus or 0)
        local mult = 0
        local nominal = get_most_played_card_rank_nominal()
        chips = chips + nominal
        if card.ability.effect == "Lucky Card" then 
            if pseudorandom('lucky_mult') < G.GAME.probabilities.normal/5 then
                card.lucky_trigger = true
                mult = mult + card.ability.mult + (card.ability.perma_bonus_mult or 0)
            end
        else  
            mult = mult + card.ability.mult + (card.ability.perma_bonus_mult or 0)
        end
        return {
            chips = chips,
            mult = mult,
            x_mult = card.ability.x_mult
        }
    end,
    is_face = function(self, card, from_boss)
        if G.GAME and G.GAME.most_played_card and SMODS.Ranks[G.GAME.most_played_card.rank] and SMODS.Ranks[G.GAME.most_played_card.rank].face then
            return true
        else
            if next(find_joker("Pareidolia")) then
                return true
            end
            return false
        end
    end,
    get_nominal = function(self, card, mod)
        return (10*get_most_played_card_rank_nominal()) + card.base.suit_nominal + (card.base.suit_nominal_original or 0)*0.0001 + (10*get_most_played_card_face_nominal()) + 0.000001*card.unique_val
    end,
    cost = 2,
    sell_cost = 2,
    sets = {"relic"},
    loc_vars = function()
        return {get_most_played_card_rank(), (G.GAME and G.GAME.most_played_card  and G.GAME.most_played_card.suit) or "No Suit"}
    end,
}

SMODS.CCard {
    key = "magnetic",
    pos = {x = 2, y = 1},
    number = 8,
    name = "Magnetic Card",
    loc_txt = {
        name = "Magnetic Card",
        text = {
            "Always scores, {C:blue}+#1#{} Chips",
            "Always drawn first",
            "at start of round"
        }
    },
    is_suit = function(self, card, suit, bypass_debuff, flush_calc)
        if (card.ability.name == 'Wild Card' or card.config.center.any_suit) and not card.debuff then
            return true
        end
        return false
    end,
    get_id = function(self, card)
        return -math.random(100, 1000000)
    end,
    get_eval = function(self, card)
        if self.debuff then return {chips = 0, mult = 0, x_mult = 1} end
        local chips = card.ability.bonus + (card.ability.perma_bonus or 0)
        local mult = 0
        local nominal = 8
        chips = chips + nominal
        if card.ability.effect == "Lucky Card" then 
            if pseudorandom('lucky_mult') < G.GAME.probabilities.normal/5 then
                card.lucky_trigger = true
                mult = mult + card.ability.mult + (card.ability.perma_bonus_mult or 0)
            end
        else  
            mult = mult + card.ability.mult + (card.ability.perma_bonus_mult or 0)
        end
        return {
            chips = chips,
            mult = mult,
            x_mult = card.ability.x_mult
        }
    end,
    is_face = function(self, card, from_boss)
        if next(find_joker("Pareidolia")) then
            return true
        end
        return false
    end,
    cost = 2,
    sell_cost = 2,
    sets = {"relic"},
    loc_vars = function()
        return {8}
    end,
    always_scores = true
}

SMODS.CCard {
    key = "silverware",
    pos = {x = 1, y = 1},
    number = 9,
    name = "Silverware",
    loc_txt = {
        name = "Silverware",
        text = {
            "Play {C:attention}Silverware 100{}",
            "times to unlock",
            "{C:attention}Silver Deck{}",
            "{C:inactive}({C:attention}#1#{}{C:inactive}/100)"
        }
    },
    is_suit = function(self, card, suit, bypass_debuff, flush_calc)
        if (card.ability.name == 'Wild Card' or card.config.center.any_suit) and not card.debuff then
            return true
        end
        return false
    end,
    get_id = function(self, card)
        return -math.random(100, 1000000)
    end,
    get_eval = function(self, card)
        if self.debuff then return {chips = 0, mult = 0, x_mult = 1} end
        local chips = card.ability.bonus + (card.ability.perma_bonus or 0)
        local mult = 0
        if card.ability.effect == "Lucky Card" then 
            if pseudorandom('lucky_mult') < G.GAME.probabilities.normal/5 then
                card.lucky_trigger = true
                mult = mult + card.ability.mult + (card.ability.perma_bonus_mult or 0)
            end
        else  
            mult = mult + card.ability.mult + (card.ability.perma_bonus_mult or 0)
        end
        return {
            chips = chips,
            mult = mult,
            x_mult = card.ability.x_mult
        }
    end,
    is_face = function(self, card, from_boss)
        if next(find_joker("Pareidolia")) then
            return true
        end
        return false
    end,
    cost = 2,
    sell_cost = 8,
    sets = {"relic"},
    loc_vars = function()
        return {G.GAME and G.GAME.silver_played or 0}
    end
}

function add_collectors_card(object)
    G.P_CARDS["CL" .. tostring(object.number)] = {
        name = object.name or ("Collector's Card No. " .. object.number),
        value = 'Ace',
        suit = 'coll_collectors',
        pos = { x = object.pos.x, y = object.pos.y},
        lc_atlas = "bb_cards",
        hc_atlas = "bb_cards",
        no_rank = true,
        atlas = 'coll_cards',
        collect = true,
        number = object.number,
        key = object.key,
        alt_key = "CL" .. tostring(object.number),
        is_suit = object.is_suit,
        get_id = object.get_id,
        is_face = object.is_face,
        get_eval = object.get_eval,
        match = object.match,
        match_id = object.match_id,
        consecutive = object.consecutive,
        straight_base = object.straight_base,
        multirank = object.multirank,
        cost = object.cost or 1,
        sell_cost = object.sell_cost or 1,
        sets = object.sets or {},
        loc_vars = object.loc_vars,
        seal_messiness = object.seal_messiness,
        get_suit = object.get_suit,
        always_scores = object.always_scores,
        get_nominal = object.get_nominal,
    }
end

function Card:matches(other)
    if (self.config.center and self.config.center.name == "Stone Card") or (other.config.center and other.config.center.name == "Stone Card") then
        return false
    end
    if other.config.card and other.config.card.match and (type(other.config.card.match) == "function") then
        return other.config.card:match(other, self, false)
    end
    if self.config.card and self.config.card.match and (type(self.config.card.match) == "function") then
        return self.config.card:match(self, other, true)
    end
end

function Card:straight_base(rank)
    if (self.config.center and self.config.center.name == "Stone Card") then
        return false
    end
    if self.config.card and self.config.card.straight_base and (type(self.config.card.straight_base) == "function") then
        return self.config.card:straight_base(self, rank)
    end
    return false
end

function Card:match_id()
    if (self.config.center and self.config.center.name == "Stone Card") then
        return self:get_id()
    end
    if self.config.card and self.config.card.match_id and (type(self.config.card.match_id) == "function") then
        return self.config.card:match_id(self)
    end
    return self:get_id()
end

function Card:get_suit()
    if (self.config.center and self.config.center.name == "Stone Card") then
        return "No Suit"
    end
    if self.config.card and self.config.card.get_suit and (type(self.config.card.get_suit) == "function") then
        return self.config.card:get_suit(self)
    end
    return self.config.card.suit
end

function Card:consecutive(rank, skip)
    if (self.config.center and self.config.center.name == "Stone Card") then
        return false
    end
    if self.config.card and self.config.card.consecutive and (type(self.config.card.consecutive) == "function") then
        return self.config.card:consecutive(self, rank, skip)
    end
    if not skip then
        return (self:get_id() == (rank + 1)) or ((self:get_id() == 2) and (rank == 14))
    else
        return (self:get_id() == (rank + 2)) or ((self:get_id() == 3) and (rank == 14))
    end
end

function fix_X_same(results, card)
    local new = {}
    for i, j in ipairs(results) do
        for i2, j2 in ipairs(j) do
            for i3, j3 in ipairs(j2) do
                if j3 == card then
                    table.insert(new, j2)
                end
            end
        end
    end
    local kill = {}
    if #new > 1 then
        local nominals = {}
        for i, j in ipairs(new) do
            for i2, j2 in ipairs(j) do
                if not j2.config.card or not j2.config.card.multirank then
                    nominals[i] = j2:get_nominal()
                    break
                end
            end
        end
        for i = 1, #new do
            if nominals[i] == nil then
                nominals[i] = 999
            end
        end
        local max = nominals[1]
        local max_len = #new[1]
        local max_index = 1
        for i, j in ipairs(nominals) do
            if (#new[i] > max_len) or ((j > max) and (#new[i] == max_len)) then
                max = j
                max_index = i
                max_len = #new[i]
            end
        end
        for i, j in ipairs(new) do
            if i ~= max_index then
                table.insert(kill, j)
            end
        end
    end
    local adds = {}
    for i, j in ipairs(results) do
        for i3, j3 in pairs(kill) do
            local i2 = 1
            while i2 <= #j do
                if j3 == j[i2] then
                    if i > 1 then
                        if adds[i - 1] == nil then
                            adds[i - 1] = {}
                        end
                        local table0 = {}
                        for i4, j4 in ipairs(j3) do
                            if j4 ~= card then
                                table.insert(table0, j4)
                            end
                        end
                        table.insert(adds[i - 1], table0)
                    end
                    table.remove(j, i2)
                    break
                end
                i2 = i2 + 1
            end
        end
    end
    for i, j in pairs(adds) do
        for i2, j2 in ipairs(j) do
            table.insert(results[i], j2)
        end
    end
    return results
end

function get_straight(hand)
    local req = next(find_joker('Four Fingers')) and 4 or 5
    local skip = next(find_joker('Shortcut')) 
    local correct = {}
    for k = 2, 14 do
        local base_ace = (k == 14)
        local valid = true
        local base = {}
        local next = {}
        for i, j in ipairs(hand) do
            if (j:get_id() == k) or j:straight_base(k) then
                table.insert(base, {{j, k}})
            end
        end
        if #base == 0 then
            goto continue
        end
        while valid == true do
            local not_discarded = {}
            for i, j in ipairs(base) do
                for i2, j2 in ipairs(hand) do
                    if j2:consecutive(j[#j][2]) and ((j[#j][2] ~= 14) or base_ace) then
                        local valid2 = true
                        for i3, j3 in ipairs(j) do
                            if j2 == j3[1] then
                                valid2 = false
                                break
                            end
                        end
                        if valid2 then
                            local newtable = {}
                            for i3, j3 in ipairs(j) do
                                table.insert(newtable, j3)
                            end
                            if j[#j][2] == 14 then
                                table.insert(newtable, {j2, 2})
                            else
                                table.insert(newtable, {j2, j[#j][2] + 1})
                            end
                            table.insert(next, newtable)
                            not_discarded[i] = true
                        end
                    elseif skip and j2:consecutive(j[#j][2], true) and ((j[#j][2] ~= 14) or base_ace) then
                        local valid2 = true
                        for i3, j3 in ipairs(j) do
                            if j2 == j3[1] then
                                valid2 = false
                                break
                            end
                        end
                        if valid2 then
                            local newtable = {}
                            for i3, j3 in ipairs(j) do
                                table.insert(newtable, j3)
                            end
                            if j[#j][2] == 14 then
                                table.insert(newtable, {j2, 3})
                            else
                                table.insert(newtable, {j2, j[#j][2] + 2})
                            end
                            table.insert(next, newtable)
                            not_discarded[i] = true
                        end
                    end
                end
            end
            for i = 1, #base do
                if not_discarded[i] == nil then
                    if #base[i] >= req then
                        table.insert(correct, base[i])
                    end
                end
            end
            base = next
            next = {}
            if #base == 0 then
                valid = false
            end
        end
        ::continue::
    end
    local ranks = {}
    local result = {}
    for i, j in ipairs(correct) do
        for i2, j2 in ipairs(j) do
            ranks[j2[2]] = true
        end
    end
    for i, j in ipairs(hand) do
        for i2, j2 in pairs(ranks) do
            if (j:get_id() == i2) or j:straight_base(i2) then
                table.insert(result, j)
                break
            end
        end
    end
    return (#correct > 0) and {result} or {}
end

function collectors_card_description(_c, desc_nodes, specific_vars, cfg, info_queue)
    if _c.name ~= 'Stone Card' then
        local vars = (specific_vars.loc_vars and specific_vars.loc_vars()) or {}
        localize{type = 'descriptions', key = specific_vars.collect.key .. "_desc", set = 'Other', nodes = desc_nodes, vars = vars}
        if specific_vars.collect.sets then
            for i, j in ipairs(specific_vars.collect.sets) do
                if G.GAME.collector_sets[j].full then
                    localize{type = 'other', key = j .."_set", nodes = desc_nodes}
                    info_queue[#info_queue + 1] = {key = j .."_tt", set = "Other"}
                end
            end
        end
    end
    local loc_vars = {}
    if _c.set == 'Default' and specific_vars then
        if specific_vars.bonus_chips then
            localize{type = 'other', key = 'card_extra_chips', nodes = desc_nodes, vars = {specific_vars.bonus_chips}}
        end
        if specific_vars and specific_vars.bonus_mult then
            localize{type = 'other', key = 'card_extra_mult', nodes = desc_nodes, vars = {specific_vars.bonus_mult}}
        end
    elseif _c.set == 'Enhanced' then 
        if _c.effect == 'Mult Card' then loc_vars = {cfg.mult}
        elseif _c.effect == 'Wild Card' then
        elseif _c.effect == 'Glass Card' then loc_vars = {cfg.Xmult, G.GAME.probabilities.normal, cfg.extra}
        elseif _c.effect == 'Steel Card' then loc_vars = {cfg.h_x_mult}
        elseif _c.effect == 'Stone Card' then loc_vars = {((specific_vars and specific_vars.bonus_chips) or cfg.bonus)}
        elseif _c.effect == 'Gold Card' then loc_vars = {cfg.h_dollars}
        elseif _c.effect == 'Lucky Card' then loc_vars = {G.GAME.probabilities.normal, cfg.mult, 5, cfg.p_dollars, 15}
        end
        localize{type = 'descriptions', key = _c.key, set = _c.set, nodes = desc_nodes, vars = loc_vars}
        if _c.name ~= 'Stone Card' and ((specific_vars and specific_vars.bonus_chips) or (cfg.bonus ~= 0 and cfg.bonus)) then
            localize{type = 'other', key = 'card_extra_chips', nodes = desc_nodes, vars = {((specific_vars and specific_vars.bonus_chips) or cfg.bonus)}}
        end
        if specific_vars and specific_vars.bonus_mult then
            localize{type = 'other', key = 'card_extra_mult', nodes = desc_nodes, vars = {specific_vars.bonus_mult}}
        end
    end
end

local old_can_sell = Card.can_sell_card
function Card:can_sell_card(context)
    if old_can_sell(self, context) then
        return true
    end
    if (G.SETTINGS.tutorial_complete or G.GAME.pseudorandom.seed ~= 'TUTORIAL' or G.GAME.round_resets.ante > 1) and
        self.area and
        (self.config.card and self.config.card.collect and (self.area == G.hand)) and
        not self.ability.eternal then
        return true
    end
    return false
end

function get_most_played_card_rank()
    if G.GAME and G.GAME.most_played_card and G.GAME.most_played_card.rank then
        for i, j in pairs(SMODS.Ranks) do
            if j.id == G.GAME.most_played_card.rank then
                return localize(j.key, 'ranks')
            end
        end
    end
    return "None"
end

function get_most_played_card_rank_nominal()
    if G.GAME and G.GAME.most_played_card and G.GAME.most_played_card.rank then
        for i, j in pairs(SMODS.Ranks) do
            if j.id == G.GAME.most_played_card.rank then
                return j.nominal
            end
        end
    end
    return 0
end

function get_most_played_card_face_nominal()
    if G.GAME and G.GAME.most_played_card and G.GAME.most_played_card.rank then
        for i, j in pairs(SMODS.Ranks) do
            if j.id == G.GAME.most_played_card.rank then
                return j.face_nominal or 0
            end
        end
    end
    return 0
end

function update_card_set()
    local saving = {}
    if G.playing_cards then
        for i, j in ipairs(G.playing_cards) do
            if j.config.card and j.config.card.collect then
                saving[j.config.card.key] = true
            end
        end
        local full_sets = {}
        for i, j in pairs(sets) do
            full_sets[i] = true
            for i2, j2 in pairs(j) do
                if saving[i2] then
                    if G.GAME.collector_sets[i] == nil then
                        G.GAME.collector_sets[i] = {}
                    end
                    G.GAME.collector_sets[i][i2] = true
                else
                    full_sets[i] = false
                end
            end
            if G.GAME.collector_sets[i] == nil then
                G.GAME.collector_sets[i] = {}
            end
            G.GAME.collector_sets[i].full = full_sets[i]
        end
    end
    if G.playing_cards and G.GAME and G.GAME.most_played_card then
        local max = 0
        local max_card = G.playing_cards[1]
        for i, j in ipairs(G.playing_cards) do
            if j.ability.times_played and (j.ability.times_played > max) then
                max = j.ability.times_played
                max_card = j
            end
        end
        if max_card ~= nil then
            local rank = max_card:get_id()
            if rank > 0 then
                G.GAME.most_played_card = {suit = localize(max_card:get_suit(), 'suits_plural'), rank = rank}
            else
                G.GAME.most_played_card = {suit = localize(max_card:get_suit(), 'suits_plural'), rank = -1}
            end
        else
            G.GAME.most_played_card = {suit = "No Suit", rank = -1}
        end
    end
end

function collecters_sigil_func(self, card, area, copier)
    if not copier then set_consumeable_usage(card) end
    if card.debuff then return nil end
    local used_tarot = copier or card

    if card.ability.consumeable.max_highlighted then
        update_hand_text({immediate = true, nopulse = true, delay = 0}, {mult = 0, chips = 0, level = '', handname = ''})
    end
    local used_tarot = copier or card
    juice_flip(used_tarot)
    local _suit = pseudorandom_element(SMODS.Suits, pseudoseed('sigil'))
    for i = 1, #G.hand.cards do
        G.E_MANAGER:add_event(Event({
            func = function()
                local _card = G.hand.cards[i]
                local _rank = SMODS.Ranks[_card.base.value]
                if not _card.config.card or not _card.config.card.collect then
                    _card:set_base(G.P_CARDS[_suit.card_key .. '_' .. _rank.card_key])
                end
                return true
            end
        }))
    end
    for i = 1, #G.hand.cards do
        local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
                G.hand.cards[i]:flip(); play_sound('tarot2', percent, 0.6); G.hand.cards[i]:juice_up(0.3, 0.3); return true
            end
        }))
    end
    delay(0.5)
end

function create_trading_card(area, key_append, dupes)
    local area = area or G.jokers
        

    --should pool be skipped with a forced key
    

    local center = G.P_CENTERS['c_base']
    local new_set = {}
    local front = 0
    if dupes then
        for i, j in pairs(G.P_CARDS) do
            if j.collect then
                new_set[i] = j
            end
        end
        front = pseudorandom_element(new_set, pseudoseed('front'..(key_append or '')..G.GAME.round_resets.ante))
    else
        front = G.P_CARDS[create_unique_trading_key()]
    end

    local card = Card(area.T.x + area.T.w/2, area.T.y, G.CARD_W, G.CARD_H, front, center,
    {bypass_discovery_center = area==G.shop_jokers or area == G.pack_cards or area == G.shop_vouchers or (G.shop_demo and area==G.shop_demo) or area==G.jokers or area==G.consumeables,
     bypass_discovery_ui = area==G.shop_jokers or area == G.pack_cards or area==G.shop_vouchers or (G.shop_demo and area==G.shop_demo),
     discover = area==G.jokers or area==G.consumeables, 
     bypass_back = G.GAME.selected_back.pos})

    return card
end

function create_unique_trading_key()
    local all_cards = {}
    local new_set = {}
    local front = nil
    if G.playing_cards then
        for i, j in ipairs(G.playing_cards) do
            if j.config.card and j.config.card.collect then
                all_cards[j.config.card.alt_key] = true
            end
        end
    end
    local valid = false
    for i, j in pairs(G.P_CARDS) do
        if j.collect and not all_cards[i] and (not G.GAME.used_jokers or not G.GAME.used_jokers[i]) then
            new_set[i] = j
            valid = true
        end
    end
    local front, front2 =  pseudorandom_element(new_set, pseudoseed('front'..G.GAME.round_resets.ante))
    if valid == false then
        return "coll_L_A"
    end
    return front2
end

function CardArea:pullMagent()
    if self.cards and (self.config.type == 'deck') then
        local magnets = {}
        for i, j in ipairs(self.cards) do
            if j.config.card and j.config.card.name == "Magnetic Card" then
                table.insert(magnets, i)
            end
        end
        local k = #self.cards
        local ignoreid = {}
        for i, j in ipairs(magnets) do
            while ((k >= 1) and (self.cards[k].config.card and (self.cards[k].config.card.name == "Magnetic Card"))) do
                ignoreid[k] = true
                k = k - 1
            end
            if k == 0 then
                break
            end
            if not ignoreid[j] then
                self.cards[k], self.cards[j] = self.cards[j], self.cards[k]
            end
        end
    end
end

local old_nominal = Card.get_nominal
function Card:get_nominal(mod)
    if not self.debuff and not (self.config.center and self.config.center.name == "Stone Card") and self.config.card and self.config.card.get_nominal and (type(self.config.card.get_nominal) == "function") then
        local value = self.config.card:get_nominal(self, mod)
        if value ~= nil then return value end
    end
    return old_nominal(self, mod)
end

local old_ability = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    old_ability(self, center, initial, delay_sprites)
    if not G.OVERLAY_MENU then 
        if self.config.card.alt_key then
        	G.GAME.used_jokers[self.config.card.alt_key] = true
        end
    end
end

----------------------------------------------
------------MOD CODE END----------------------