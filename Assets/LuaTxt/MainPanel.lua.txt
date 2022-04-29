BasePanel:subClass("MainPanel")

-- 成员方法
-- 面板初始化  从AB包中加载   事件监听
function MainPanel:Init(panelName)
    self.base.Init(self, panelName)

    if self.isInitEvent == false then
        self:GetControl("btnBag", "Button").onClick:AddListener(function()
            self:BtnBagClick()
        end)

        self.isInitEvent = true
    end
end

function MainPanel:BtnBagClick()
    BagPanel:Show("BagPanel")
end