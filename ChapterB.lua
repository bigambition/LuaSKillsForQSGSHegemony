--[[
	国战技能速查手册（B区）
	技能索引：
	八阵、暴凌、悲歌、闭月、不屈
]]--
--[[
	八阵
	相关武将：标-卧龙诸葛亮
	描述：锁定技，若你的装备区里没有防具牌，你视为装备着【八卦阵】。 
	引用：
	状态：
]]

LuaBazhen = sgs.CreateTriggerSkill{
	name = "LuaBazhen",
	frequency = sgs.Skil_Compulsory,
	events = {sgs.CardAsked},

	can_trigger = function(self, event, room, player, data)
		if not player or player:isDead() or not player:hasSkill(self:objectName()) then return false end
		local pattern = data:toStringList()[1]
		if pattern ~= "jink" then return false end
		local qinggang = player:getTag("Qinggang"):toStringList()
		if #qinggang ~= 0 or player:getMark("Armor_Nullified") > 0 or player:getMark("Equips_Nullified_to_Yourself") > 0 then return false end
		--if player:hasArmorEffect("bazhen") then --这个东西在源代码里，无法100%还原
		if not player:getArmor() and not player:hasArmorEffect("bazhen") then
			return "EightDiagram"
		end
	end,
    on_cost = function(self, event, room, player, data)
		return false
	end,
}

--[[
	暴凌
	相关武将：势-董卓
	描述：主将技，锁定技，出牌阶段结束时，若此武将牌已明置且你有副将，你移除副将的武将牌，然后加3点体力上限，回复
		  3点体力，获得“崩坏”。 
	引用：
	状态：
]]

--[[
	悲歌
	相关武将：标-蔡文姬
	描述：每当一名角色受到【杀】造成的伤害后，你可以弃置一张牌并选择该角色，令其进行判定，若结果为：♥—该角色回复1点
	      体力；♦—该角色摸两张牌；♣—来源弃置两张牌；♠—来源叠置。 
	引用：
	状态：
]]

--[[
	闭月
	相关武将：标-貂蝉
	描述：结束阶段开始时，你可以摸一张牌。 
	引用：
	状态：
]]

--[[
	不屈
	相关武将：标-周泰
	描述：每当你扣减1点体力后，若你的体力值为0，你可以将牌堆顶的一张牌置于武将牌上，称为“创”，若所有“创”的点数
	      均不同，你不进入濒死状态。 
	引用：
	状态：
]]
