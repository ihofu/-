-- "继承"Object
Object:subClass("BasePanel")

-- 声明"成员变量"
-- UI预制体
BasePanel.panelObj = nil
-- 面板中所有控件组件以键值对的形式保存在这个表中 
-- 解决同一个控件上挂载多个组件的情况 控件表设计为下面的形式
-- 控件名 = {控件类型 = 控件组件}
BasePanel.controls = { }
BasePanel.isInitEvent = false

-- 面板初始化
function BasePanel:Init(panelName)
    -- 从AB包中加载相应的预制体 设置父对象Canvas
    print(panelName)
    self.panelObj = ABMgr:LoadRes("ui", panelName, typeof(GameObject))
    self.panelObj.transform:SetParent(Canvas.transform, false)

    -- 控件表中添加所有的控件组件
    -- 因为要添加所有的控件 所以这里的typeof要写UI组件的父类 UIBehaviour
    local allControls = self.panelObj:GetComponentsInChildren(typeof(UIBehaviour))
    -- 过滤组件 只留下需要的
    for i = 0, allControls.Length - 1 do
        -- 在组件名字中查找 自己定义的组件名关键信息 确定是否为需要组件
        local controlName = allControls[i].name
        if string.find(controlName, "btn") or 
           string.find(controlName, "toggle") or 
           string.find(controlName, "item") then

            -- 通过反射 得到组件的类型 
            -- 因为通过一个控件上可能会有多个组件 要用组价类型来区分他们
            local controlType = allControls[i]:GetType().Name
            if self.controls[controlName] ~= nil then
                -- 表中添加 self.controls[控件名][组件类型]
                self.controls[controlName][controlType] = allControls[i]
            else
                -- 添加表中元素 { 控件名 = { 组件类型 = 组件本身 } }
                self.controls[controlName] = { [controlType] = allControls[i] }
            end
        end
    end
end


-- 在控件表中查找到对应的控件组件
function BasePanel:GetControl(controlName, controlType)
    if self.controls[controlName] ~= nil then
        local sameNameControls = self.controls[controlName]

        if sameNameControls[controlType] ~= nil then
            return sameNameControls[controlType]
        end
    end

    return nil
end


function BasePanel:Show(panelName)
    self:Init(panelName)
    self.panelObj:SetActive(true)
end


function BasePanel:Hide()
    self.panelObj:SetActive(false)
end