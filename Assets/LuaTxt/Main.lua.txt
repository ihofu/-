print("导入完成")

-- 类别名
require("InitClass")
-- 初始化道具表信息
require("ItemData")
-- 初始化玩家信息
require("PlayerData")
PlayerData:Init()
-- BasePanel信息
require("BasePanel")
-- MainPanel信息
require("MainPanel")
-- BagPanel信息
require("BagPanel")
-- ItemGrid
require("ItemGrid")

MainPanel:Show("MainPanel")


