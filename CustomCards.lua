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

function Card:calculate_exotic(context)
    if self.debuff then return nil end
    local obj = self.config.center
    local name = self.ability.trading and self.ability.trading.name
    if not name then
        if context.get_self_retriggers then
            return {1}
        end
        return
    end
    if context.get_self_retriggers then
        local reps = {1}
        local j = 1
        while (j <= #reps) do
            if j == 1 then 
                --Check for hand doubling
                --From Red seal
                local eval = eval_card(self, {cardarea = self.area, repetition = true, repetition_only = true, full_hand = context.full_hand, scoring_hand = context.scoring_hand, scoring_name = context.scoring_name, poker_hands = context.poker_hands})
                if next(eval) and (next(effects[1]) or #effects > 1)  then 
                    for h = 1, eval.seals.repetitions do
                        reps[#reps+1] = eval
                    end
                end

                --from Jokers
                for l=1, #G.jokers.cards do
                    --calculate the joker effects
                    local eval = eval_card(G.jokers.cards[l], {cardarea = self.area, other_card = self, repetition = true, end_of_round = context.end_of_round, full_hand = context.full_hand, scoring_hand = context.scoring_hand, scoring_name = context.scoring_name, poker_hands = context.poker_hands, callback = function(card, ret) eval = {jokers = ret}
                        if next(eval) then 
                            for h  = 1, eval.jokers.repetitions do
                                reps[#reps+1] = eval
                            end
                        end 
                    end})
                end
            end
            j = j + 1
        end
        return reps
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
            return {
                mult = config_thing.mult,
                card = self
            }
        elseif name == "Scholar's Mate" then
            local mult = (G.GAME.current_round.hands_played == 1) and config_thing.mult or nil
            return {
                chips = config_thing.chips,
                mult = mult,
                card = self
            }
        elseif name == "Scandinavian Defense" then
            local valid = true
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_suit("Spades") or context.scoring_hand[i]:is_suit("Clubs") then
                    valid = false
                end
            end
            return {
                chips = config_thing.chips,
                mult = valid and config_thing.mult or nil,
                card = self
            }
        end
    elseif context.does_score then
        return false
    elseif context.is_suit then
        if name == "Flint Card" then
            if (context.is_suit == "Hearts") or (context.is_suit == "Diamonds") then
                return true
            end
        end
    elseif context.get_id then
        if name == "Flint Card" then
            return -math.random(100, 1000000)
        elseif name == "Scholar's Mate" then
            return 12
        elseif name == "Scandinavian Defense" then
            return 12
        end
    end
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

function get_trading_key()
    local _, key = pseudorandom_element(G.P_TRADING, pseudoseed('trading'))
    return key
end

----------------------------------------------
------------MOD CODE END----------------------