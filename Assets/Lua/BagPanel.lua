BasePanel:subClass("BagPanel")

-- 当前显示的物品
BagPanel.items = { }

function BagPanel:Init(panelName)
    self.base.Init(self, panelName)

    if self.isInitEvent == false then
        self:GetControl("btnQuit", "Button").onClick:AddListener(function()
            self:Hide()
        end)

        self:GetControl("toggleEquip", "Toggle").onValueChanged:AddListener(function(value)
            if value == true then
                self:ChangeType(1)
            end
        end)

        self:GetControl("toggleItem", "Toggle").onValueChanged:AddListener(function(value)
            if value == true then
                self:ChangeType(2)
            end
        end)

        self:GetControl("toggleGem", "Toggle").onValueChanged:AddListener(function(value)
            if value == true then
                self:ChangeType(3)
            end
        end)
    end
    --[[
    if self.panelObj == nil then
        -- 从AB包中加载背包面板
        self.panelObj = ABMgr:LoadRes("ui", "BagPanel", typeof(GameObject))
        self.panelObj.transform:SetParent(Canvas.transform, false)

        -- 按钮监听
        -- 退出按钮
        self.btnHide = self.panelObj.transform:GetChild(0).transform:Find("btnQuit"):GetComponent(typeof(Button))
        self.btnHide.onClick:AddListener(function()
            self:Hide()
        end)

        -- 三个物品分类toggle 获取并添加监听事件
        -- equip
        self.toggleEquip = self.panelObj.transform:GetChild(1).transform:Find("toggleEquip"):GetComponent(typeof(Toggle))
        self.toggleEquip.onValueChanged:AddListener(function(value)
            if value == true then
                self:ChangeType(1)
            end
        end)
        -- item
        self.toggleItem = self.panelObj.transform:GetChild(1).transform:Find("toggleItem"):GetComponent(typeof(Toggle))
        self.toggleItem.onValueChanged:AddListener(function(value)
            if value == true then
                self:ChangeType(2)
            end
        end)
        -- gem
        self.toggleGem = self.panelObj.transform:GetChild(1).transform:Find("toggleGem"):GetComponent(typeof(Toggle))
        self.toggleGem.onValueChanged:AddListener(function(value)
            if value == true then
                self:ChangeType(3)
            end
        end)
    end
    --]]
end

-- 根据类别显示物品 暂时直接卸载这里
-- equip 1  item 2  gem 3
function BagPanel:ChangeType(type)
    for i = 1, #self.items do
        self.items[i]:Destroy()
    end
    self.items = { }

    -- 存储当前显示的物品表
    local nowItems = { }

    -- 从PlayerData表获取数据
    if type == 1 then
        nowItems = PlayerData.equips
    elseif type == 2 then
        nowItems = PlayerData.items
    elseif type == 3 then
        nowItems = PlayerData.gems
    end

    -- 遍历当前物品表 初始化物品icon并计算布局
    -- 找到Scroll View的Content
    local content = GameObject.Find("itemsSV").transform:GetChild(0):Find("Content")
    for i = 1, #nowItems do
        -- 初始化一个对象
        local grid = ItemGrid:new()
        grid:InitPrefab(content, 20 + (i - 1) % 4 * 160, -10 + math.floor((i - 1) / 4) * (-160))
        -- 初始化对象信息
        grid:InitData(nowItems[i])
        -- 存进items
        table.insert(self.items, grid)
    end
end
