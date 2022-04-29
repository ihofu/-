-- 常用别名准备

-- 脚本导入
-- 面向对象
require("Object")
-- 字符串拆分
require("SplitTools")
-- Json解析
Json = require("JsonUtility")

-- Unity相关
GameObject = CS.UnityEngine.GameObject
Resources = CS.UnityEngine.Resources
Transform = CS.UnityEngine.Transform
RectTransform = CS.UnityEngine.RectTransform
SpriteAtlas = CS.UnityEngine.U2D.SpriteAtlas
Vector3 = CS.UnityEngine.Vector3
Vector2 = CS.UnityEngine.Vector2
TextAsset = CS.UnityEngine.TextAsset

-- UI相关
UI = CS.UnityEngine.UI
Image = UI.Image
Text = UI.Text
Button = UI.Button
Toggle = UI.Toggle
ScrollRect = UI.ScrollRect
Canvas = GameObject.Find("Canvas")
UIBehaviour = CS.UnityEngine.EventSystems.UIBehaviour

-- 自己写的C#脚本
ABMgr = CS.ABMgr.GetInstance()
