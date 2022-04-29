-- 初始化道具表信息

-- 将json中的数据读取到表中
-- 从AB包中得到json文件
local itemDataJson = ABMgr:LoadRes("json", "ItemData", typeof(TextAsset))
-- 将TextAsset文件转成文本那文件
local itemDataText = itemDataJson.text
-- 解析Json
local itemList = Json.decode(itemDataText)

-- 重构表itemList   itemList很混乱, 自动生成的索引无法准确得到想要的物品信息
-- 所以重新设计一个表 以键值对的形式 键 = ID, 值 = 存储一个物品所有信息的表
ItemData = { }
for _, value in pairs(itemList) do
    ItemData[value.id] = value
end
