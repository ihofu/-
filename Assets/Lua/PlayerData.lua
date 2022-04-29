-- 新建一个全局表 存储player的信息
PlayerData = { }

-- 三类物品 分别对应一张表
PlayerData.equips = { }
PlayerData.items = { }
PlayerData.gems = { }

-- 方便测试 直接写一个初始化物品信息的方法
function PlayerData:Init()
    -- 装备
    table.insert(self.equips, {id = 1, count = 1})
    table.insert(self.equips, {id = 2, count = 5})
    -- 道具
    table.insert(self.items, {id = 3, count = 99})
    table.insert(self.items, {id = 4, count = 50})
    -- 宝石
    table.insert(self.gems, {id = 5, count = 5})
    table.insert(self.gems, {id = 6, count = 1})
end