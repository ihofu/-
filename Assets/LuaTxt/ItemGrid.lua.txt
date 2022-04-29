-- 新建一个类 "继承"Object
Object:subClass("ItemGrid")

-- "成员变量"
-- itemGrid的预制体GameObject
ItemGrid.obj = nil
-- 显示物品图标的image
ItemGrid.image = nil
-- 显示物品数量的text
ItemGrid.text = nil

-- "成员函数"
-- 加载预制体并计算布局
-- father就是ScrollView的content组件
-- posX    20 + (i - 1) % 4 * 160
-- posY    -10 + math.floor((i - 1) / 4) * (-160)
function ItemGrid:InitPrefab(father, posX, posY)
    -- 从AB包中加载预制体
    self.obj = ABMgr:LoadRes("ui", "itemGrid", typeof(GameObject))
    self.obj.transform:SetParent(father, false)
    -- 计算布局
    self.obj.transform.localPosition = Vector3(posX, posY, 0)
    -- 找到控件image和text
    self.image = self.obj.transform:GetChild(0):Find("itemIcon"):GetComponent(typeof(Image))
    self.text = self.obj.transform:GetChild(0):Find("itemCount"):GetComponent(typeof(Text))
end

function ItemGrid:InitData(data)
    -- 获取一个物品的全部信息
    local itemdata = ItemData[data.id]
    -- 拆分icon中的信息 _是分隔符 前半部分是图集名 后半部分是sprite名
    local strs = string.split(itemdata.icon, "_")
    -- 从AB包中加载图集
    local spriteAtlas = ABMgr:LoadRes("ui", strs[1], typeof(SpriteAtlas))
    -- 更新信息
    self.image.sprite = spriteAtlas:GetSprite(strs[2])
    self.text.text = data.count
end

function ItemGrid:Destroy()
    GameObject.Destroy(self.obj)
    self.obj = nil
end