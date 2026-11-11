local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
Players.LocalPlayer:WaitForChild("PlayerGui")
local u7 = HttpService
local u8 = HttpService
local function u9(p1)
if p1 then
local p1Position = p1.Position
local t1 = {
X = p1Position.X.Scale,
XOffset = p1Position.X.Offset,
Y = p1Position.Y.Scale,
YOffset = p1Position.Y.Offset,
}
local _pcall = pcall
local u108 = t1
pcall(function()
writefile("CrazPos.txt", u8:JSONEncode(u108))
end)
return
end
end
local v10 = (function()
local ok, result = pcall(function()
local function v186(...)
local t2 = { ... }
t2.n = select("#", ...)
return t2
end
local v188 = v186(readfile("CrazPos.txt"))
local v191 = v186(u7:JSONDecode(unpack(v188, 1, v188.n)))
return unpack(v191, 1, v191.n)
end)
if not ok or not result then
return nil
end
return UDim2.new(result.X or 0.5, result.XOffset or -150, result.Y or 0.5, result.YOffset or -190)
end)()
local BrainrotCard = nil
local AnimalOverheadController = nil
local Shared = ReplicatedStorage:FindFirstChild("Shared")
if Shared then
BrainrotCard = Shared:FindFirstChild("BrainrotCard")
if BrainrotCard then
BrainrotCard = require(BrainrotCard)
end
end
local Controllers = ReplicatedStorage:FindFirstChild("Controllers")
if Controllers then
AnimalOverheadController = Controllers:FindFirstChild("AnimalOverheadController")
if AnimalOverheadController then
AnimalOverheadController = require(AnimalOverheadController)
end
end
local t3 = {}
if AnimalOverheadController then
local u16 = nil
local _hookfunction = hookfunction
local Populate = AnimalOverheadController.Populate
local u19 = t3
u16 = hookfunction(Populate, function(p2, p3)
u16(p2, p3)
if p3.Overhead then
local v111 = p3.Overhead:FindFirstChild("1OF1Banner")
if v111 then
local DisplayName = p3.Overhead:FindFirstChild("DisplayName")
if DisplayName then
v111.Visible = u19[DisplayName.Text] == true
end
end
end
end)
end
if BrainrotCard then
local u20 = nil
local _hookfunction = hookfunction
local ObserveOneOfOne = BrainrotCard.ObserveOneOfOne
local u23 = t3
u20 = hookfunction(ObserveOneOfOne, function(p4, p5)
local u116 = p4
local u117 = p5
return u20(p4, function(p6)
if not u23[u116.Index] then
u117(p6)
return
end
u117(true)
for _, delay in ipairs({ 0.05, 0.2, 0.5, 1 }) do
task.delay(delay, function()
if u23[u116.Index] then
pcall(u117, true)
end
end)
end
end)
end)
end
local u24 = Workspace
local u25 = t3
local function v26()
for _, descendant in pairs(u24:GetDescendants()) do
if descendant.Name == "1OF1Banner" then
local descendantParent = descendant.Parent
local v121 = descendantParent and descendantParent:FindFirstChild("DisplayName")
if v121 and v121:IsA("TextLabel") then
descendant.Visible = u25[v121.Text] == true
end
end
end
end
local DescendantAdded = Workspace.DescendantAdded
local u28 = t3
DescendantAdded:Connect(function(p7)
if p7.Name == "1OF1Banner" then
task.wait(0.1)
local p7Parent = p7.Parent
local v124 = p7Parent and p7Parent:FindFirstChild("DisplayName")
if v124 and v124:IsA("TextLabel") then
p7.Visible = u28[v124.Text] == true
end
end
end)
local u29 = Workspace
local function v30()
local Plots = u29:FindFirstChild("Plots")
if Plots then
local t4 = {}
for _, child in pairs(Plots:GetChildren()) do
for _, descendant in pairs(child:GetDescendants()) do
if descendant:IsA("Model") and descendant.Name ~= "Baseplate" then
local v131 = false
for _, descendant2 in pairs(descendant:GetDescendants()) do
if descendant2:IsA("Animator") then
v131 = true
break
end
end
if v131 then
local descendantName = descendant.Name
table.insert(t4, descendantName)
end
end
end
end
return t4
end
return {}
end
local t5 = {
bg = Color3.fromRGB(10, 12, 18),
header = Color3.fromRGB(16, 20, 30),
text = Color3.fromRGB(255, 255, 255),
dim = Color3.fromRGB(180, 200, 230),
btn = Color3.fromRGB(0, 120, 255),
danger = Color3.fromRGB(180, 40, 40),
border = Color3.fromRGB(0, 120, 255),
neon = Color3.fromRGB(0, 200, 255),
discord = Color3.fromRGB(88, 101, 242),
}
if not CoreGui:FindFirstChild("CrazUI") then
local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "CrazUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 15
ScreenGui.IgnoreGuiInset = true
local _pcall = pcall
local u34 = ScreenGui
local u35 = CoreGui
pcall(function()
u34.Parent = u35
end)
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 260, 0, 400)
Frame.Position = v10 or UDim2.new(0.5, -130, 0.5, -200)
Frame.BackgroundColor3 = t5.bg
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true
Frame.Active = true
Frame.Visible = true
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)
local UIStroke = Instance.new("UIStroke", Frame)
UIStroke.Color = t5.border
UIStroke.Thickness = 1.5
local Frame2 = Instance.new("Frame", Frame)
Frame2.Size = UDim2.new(1, 0, 0, 28)
Frame2.BackgroundColor3 = t5.header
Frame2.BorderSizePixel = 0
Instance.new("UICorner", Frame2).CornerRadius = UDim.new(0, 10)
local TextLabel = Instance.new("TextLabel", Frame2)
TextLabel.Size = UDim2.new(1, -70, 1, 0)
TextLabel.Position = UDim2.new(0, 10, 0, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "CRAZ FAKE BANNER"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.Font = Enum.Font.GothamBlack
TextLabel.TextSize = 11
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
local UIGradient = Instance.new("UIGradient", TextLabel)
UIGradient.Color = ColorSequence.new({
ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 100, 255)),
ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 200, 255)),
ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)),
})
task.spawn(function()
while UIGradient do
UIGradient.Rotation = (UIGradient.Rotation or 0) + 1
task.wait(0.05)
end
end)
local Frame3 = Instance.new("Frame", Frame2)
Frame3.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
Frame3.Size = UDim2.new(0, 20, 0, 20)
Frame3.Position = UDim2.new(1, -24, 0.5, -10)
Instance.new("UICorner", Frame3).CornerRadius = UDim.new(0, 5)
local TextButton = Instance.new("TextButton", Frame3)
TextButton.Text = "✕"
TextButton.Font = Enum.Font.GothamBold
TextButton.TextSize = 10
TextButton.TextColor3 = t5.dim
TextButton.BackgroundTransparency = 1
TextButton.Size = UDim2.new(1, 0, 1, 0)
local MouseButton1Click = TextButton.MouseButton1Click
local u44 = ScreenGui
MouseButton1Click:Connect(function()
u44:Destroy()
end)
local Frame4 = Instance.new("Frame", Frame2)
Frame4.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
Frame4.Size = UDim2.new(0, 20, 0, 20)
Frame4.Position = UDim2.new(1, -48, 0.5, -10)
Instance.new("UICorner", Frame4).CornerRadius = UDim.new(0, 5)
local TextButton2 = Instance.new("TextButton", Frame4)
TextButton2.Text = "−"
TextButton2.Font = Enum.Font.GothamBold
TextButton2.TextSize = 12
TextButton2.TextColor3 = t5.dim
TextButton2.BackgroundTransparency = 1
TextButton2.Size = UDim2.new(1, 0, 1, 0)
local u47 = false
local MouseButton1Click2 = TextButton2.MouseButton1Click
local u49 = Frame
local u50 = TextButton2
MouseButton1Click2:Connect(function()
u47 = not u47
if not u47 then
u49.Size = UDim2.new(0, 260, 0, 400)
cf.Visible = true
sec.Visible = true
info.Visible = true
ab.Visible = true
db.Visible = true
u50.Text = "−"
return
end
u49.Size = UDim2.new(0, 260, 0, 28)
cf.Visible = false
sec.Visible = false
info.Visible = false
ab.Visible = false
db.Visible = false
u50.Text = "+"
end)
local TextLabel2 = Instance.new("TextLabel", Frame)
TextLabel2.Size = UDim2.new(0.96, 0, 0, 16)
TextLabel2.Position = UDim2.new(0.02, 0, 0, 32)
TextLabel2.BackgroundTransparency = 1
TextLabel2.Text = "MIS BRAINROTS"
TextLabel2.TextColor3 = t5.dim
TextLabel2.Font = Enum.Font.GothamBold
TextLabel2.TextSize = 9
TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
local ScrollingFrame = Instance.new("ScrollingFrame", Frame)
ScrollingFrame.Size = UDim2.new(1, -10, 0, 200)
ScrollingFrame.Position = UDim2.new(0, 5, 0, 52)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.ScrollBarThickness = 3
ScrollingFrame.ScrollBarImageColor3 = t5.dim
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollingEnabled = true
local UIListLayout = Instance.new("UIListLayout", ScrollingFrame)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 2)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
local u54 = ScrollingFrame
local u55 = UIListLayout
UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
u54.CanvasSize = UDim2.new(0, 0, 0, u55.AbsoluteContentSize.Y + 5)
end)
local u56 = ScrollingFrame
local u57 = t5
local u58 = t3
local u59 = v26
local function u60(p8, p9, p10)
local Frame5 = Instance.new("Frame", u56)
Frame5.Size = UDim2.new(0.96, 0, 0, 24)
Frame5.BackgroundColor3 = p10 and Color3.fromRGB(25, 30, 55) or Color3.fromRGB(14, 16, 24)
Frame5.BorderSizePixel = 0
Frame5.LayoutOrder = p9
Instance.new("UICorner", Frame5).CornerRadius = UDim.new(0, 4)
local UIStroke2 = Instance.new("UIStroke", Frame5)
UIStroke2.Color = p10 and u57.neon or Color3.fromRGB(40, 45, 60)
UIStroke2.Thickness = p10 and 1.2 or 0.5
local Frame6 = Instance.new("Frame", Frame5)
Frame6.Size = UDim2.new(0, 16, 0, 16)
Frame6.Position = UDim2.new(0, 5, 0.5, -8)
Frame6.BackgroundColor3 = p10 and u57.neon or Color3.fromRGB(35, 40, 55)
Frame6.BorderSizePixel = 0
Instance.new("UICorner", Frame6).CornerRadius = UDim.new(0, 3)
local TextLabel3 = Instance.new("TextLabel", Frame6)
TextLabel3.Size = UDim2.new(1, 0, 1, 0)
TextLabel3.BackgroundTransparency = 1
TextLabel3.Text = p10 and "✓" or ""
TextLabel3.TextColor3 = p10 and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(60, 60, 70)
TextLabel3.Font = Enum.Font.GothamBold
TextLabel3.TextSize = 11
local TextLabel4 = Instance.new("TextLabel", Frame5)
TextLabel4.Size = UDim2.new(0.6, 0, 1, 0)
TextLabel4.Position = UDim2.new(0, 28, 0, 0)
TextLabel4.BackgroundTransparency = 1
TextLabel4.Text = p8
TextLabel4.TextColor3 = u57.text
TextLabel4.Font = Enum.Font.GothamBold
TextLabel4.TextSize = 9
TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
local InputBegan = Frame5.InputBegan
local u145 = Frame5
InputBegan:Connect(function(p11)
if p11.UserInputType == Enum.UserInputType.MouseButton1 or p11.UserInputType == Enum.UserInputType.Touch then
if u58[p8] ~= true then
u58[p8] = true
Frame6.BackgroundColor3 = u57.neon
TextLabel3.Text = "✓"
TextLabel3.TextColor3 = Color3.fromRGB(0, 0, 0)
u145.BackgroundColor3 = Color3.fromRGB(25, 30, 55)
UIStroke2.Color = u57.neon
UIStroke2.Thickness = 1.2
else
u58[p8] = nil
Frame6.BackgroundColor3 = Color3.fromRGB(35, 40, 55)
TextLabel3.Text = ""
u145.BackgroundColor3 = Color3.fromRGB(14, 16, 24)
UIStroke2.Color = Color3.fromRGB(40, 45, 60)
UIStroke2.Thickness = 0.5
end
u59()
updateInfo()
end
end)
return Frame5
end
local TextLabel5 = Instance.new("TextLabel", Frame)
TextLabel5.Size = UDim2.new(0.96, 0, 0, 16)
TextLabel5.Position = UDim2.new(0.02, 0, 0, 256)
TextLabel5.BackgroundTransparency = 1
TextLabel5.TextColor3 = t5.dim
TextLabel5.Font = Enum.Font.Gotham
TextLabel5.TextSize = 9
TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
TextLabel5.ZIndex = 15
TextLabel5.Visible = true
local Frame7 = Instance.new("Frame", Frame)
Frame7.Size = UDim2.new(1, 0, 0, 30)
Frame7.Position = UDim2.new(0, 0, 0, 272)
Frame7.BackgroundColor3 = Color3.fromRGB(10, 12, 18)
Frame7.BorderSizePixel = 0
local UIListLayout2 = Instance.new("UIListLayout", Frame7)
UIListLayout2.FillDirection = Enum.FillDirection.Horizontal
UIListLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout2.Padding = UDim.new(0, 6)
UIListLayout2.VerticalAlignment = Enum.VerticalAlignment.Center
local function v67(p12, p13, p14)
local TextButton3 = Instance.new("TextButton", Frame7)
TextButton3.Size = UDim2.new(0, 75, 0, 22)
TextButton3.BackgroundColor3 = p13
TextButton3.BorderSizePixel = 0
TextButton3.Text = p12
TextButton3.TextColor3 = p14
TextButton3.Font = Enum.Font.GothamBold
TextButton3.TextSize = 9
Instance.new("UICorner", TextButton3).CornerRadius = UDim.new(0, 4)
return TextButton3
end
local v68 = v67("TODOS", t5.btn, Color3.fromRGB(255, 255, 255))
local v69 = v67("NINGUNO", t5.danger, Color3.fromRGB(255, 255, 255))
local MouseButton1Click3 = v68.MouseButton1Click
local u71 = v30
local u72 = t3
local u73 = v26
local u74 = TextLabel5
MouseButton1Click3:Connect(function()
local v155 = u71()
for _, v in pairs(v155) do
u72[v] = true
end
buildUI()
u73()
if u74 then
local v158 = u71()
local v159 = #v158
local n1 = 0
for _, v in pairs(v158) do
if u72[v] then
n1 = n1 + 1
end
end
u74.Text = "Total: " .. v159 .. " brainrots | Seleccionados: " .. n1
return
end
end)
local MouseButton1Click4 = v69.MouseButton1Click
local u76 = v30
local u77 = t3
local u78 = v26
local u79 = TextLabel5
MouseButton1Click4:Connect(function()
local v163 = u76()
for _, v in pairs(v163) do
u77[v] = nil
end
buildUI()
u78()
if u79 then
local v166 = u76()
local v167 = #v166
local n2 = 0
for _, v in pairs(v166) do
if u77[v] then
n2 = n2 + 1
end
end
u79.Text = "Total: " .. v167 .. " brainrots | Seleccionados: " .. n2
return
end
end)
local Frame8 = Instance.new("Frame", Frame)
Frame8.Size = UDim2.new(1, 0, 0, 28)
Frame8.Position = UDim2.new(0, 0, 0, 302)
Frame8.BackgroundColor3 = Color3.fromRGB(10, 12, 18)
Frame8.BorderSizePixel = 0
local TextLabel6 = Instance.new("TextLabel", Frame8)
TextLabel6.Size = UDim2.new(1, 0, 1, 0)
TextLabel6.BackgroundTransparency = 1
TextLabel6.Text = "discord.gg/m7tYHvaZCZ"
TextLabel6.TextColor3 = t5.discord
TextLabel6.Font = Enum.Font.GothamBlack
TextLabel6.TextSize = 10
TextLabel6.TextXAlignment = Enum.TextXAlignment.Center
Instance.new("UIGradient", TextLabel6).Color = ColorSequence.new({
ColorSequenceKeypoint.new(0, t5.discord),
ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 180, 255)),
ColorSequenceKeypoint.new(1, t5.discord),
})
local TextButton4 = Instance.new("TextButton", Frame8)
TextButton4.Size = UDim2.new(1, 0, 1, 0)
TextButton4.BackgroundTransparency = 1
TextButton4.Text = ""
local MouseButton1Click5 = TextButton4.MouseButton1Click
local u84 = t5
MouseButton1Click5:Connect(function()
setclipboard("https://discord.gg/m7tYHvaZCZ")
TextLabel6.TextColor3 = Color3.fromRGB(255, 255, 255)
task.delay(0.5, function()
TextLabel6.TextColor3 = u84.discord
end)
end)
local u85 = ScrollingFrame
local u86 = v30
local u87 = t3
local u88 = UIListLayout
local u89 = TextLabel5
function buildUI()
for _, child in pairs(u85:GetChildren()) do
if child:IsA("Frame") then
child:Destroy()
end
end
local v173 = u86()
local n3 = 1
if #v173 ~= 0 then
for _, v in pairs(v173) do
u60(v, n3, u87[v] == true)
n3 = n3 + 1
end
else
local TextLabel7 = Instance.new("TextLabel", u85)
TextLabel7.Size = UDim2.new(0.96, 0, 0, 12)
TextLabel7.BackgroundTransparency = 1
TextLabel7.Text = "No tienes brainrots en tu base."
TextLabel7.TextColor3 = Color3.fromRGB(200, 100, 100)
TextLabel7.Font = Enum.Font.Gotham
TextLabel7.TextSize = 8
TextLabel7.LayoutOrder = 1
end
task.wait(0.05)
u85.CanvasSize = UDim2.new(0, 0, 0, u88.AbsoluteContentSize.Y + 5)
if u89 then
local v178 = u86()
local v179 = #v178
local n4 = 0
for _, v in pairs(v178) do
if u87[v] then
n4 = n4 + 1
end
end
u89.Text = "Total: " .. v179 .. " brainrots | Seleccionados: " .. n4
return
end
end
local u90 = false
local p15Position = nil
local Position = nil
local InputBegan = Frame.InputBegan
local u94 = Frame
InputBegan:Connect(function(p15)
if p15.UserInputType == Enum.UserInputType.MouseButton1 or p15.UserInputType == Enum.UserInputType.Touch then
u90 = true
p15Position = p15.Position
Position = u94.Position
end
end)
local InputChanged = Frame.InputChanged
local u96 = Frame
InputChanged:Connect(function(p16)
if u90 and (p16.UserInputType == Enum.UserInputType.MouseMovement or p16.UserInputType == Enum.UserInputType.Touch) then
u96.Position = UDim2.new(
Position.X.Scale,
Position.X.Offset + (p16.Position.X - p15Position.X),
Position.Y.Scale,
Position.Y.Offset + (p16.Position.Y - p15Position.Y)
)
end
end)
local InputEnded = Frame.InputEnded
local u98 = Frame
InputEnded:Connect(function(p17)
if p17.UserInputType == Enum.UserInputType.MouseButton1 or p17.UserInputType == Enum.UserInputType.Touch then
u90 = false
u9(u98)
end
end)
local spawn = task.spawn
local u100 = v26
local u101 = Frame
spawn(function()
task.wait(1)
buildUI()
task.wait(0.5)
u100()
UserInputService.InputBegan:Connect(function(input, gameProcessed)
if not gameProcessed then
if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl then
u101.Visible = not u101.Visible
end
return
end
end)
print("[CRAZ] ✅ FAKE BANNER - Sin espacio extra")
end)
return
end
task.spawn(function()
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local function findCard(label)
local node = label.Parent
for _ = 1, 4 do
if not node or not node:IsA("GuiObject") then
return nil
end
local size = node.AbsoluteSize
if size.X > 0 and size.X <= 320 and size.Y <= 320 and node:FindFirstChildWhichIsA("ImageLabel", true) then
return node
end
node = node.Parent
end
return nil
end
local function paint(card)
if card:IsA("Frame") or card:IsA("ImageButton") or card:IsA("TextButton") then
card.BackgroundTransparency = 0
card.BackgroundColor3 = Color3.fromRGB(255, 200, 40)
end
if card:FindFirstChild("CrazBG") then
card.CrazBG.Visible = true
return
end
if card:FindFirstChildWhichIsA("UIListLayout") or card:FindFirstChildWhichIsA("UIGridLayout") then
return
end
local bg = Instance.new("Frame")
bg.Name = "CrazBG"
bg.Size = UDim2.new(1, 0, 1, 0)
bg.Position = UDim2.new(0, 0, 0, 0)
bg.BackgroundColor3 = Color3.new(1, 1, 1)
bg.BackgroundTransparency = 0.1
bg.BorderSizePixel = 0
bg.ZIndex = 0
bg.Active = false
Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 4)
local grad = Instance.new("UIGradient", bg)
grad.Color = ColorSequence.new({
ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 80, 80)),
ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 200, 40)),
ColorSequenceKeypoint.new(0.4, Color3.fromRGB(80, 255, 120)),
ColorSequenceKeypoint.new(0.6, Color3.fromRGB(60, 200, 255)),
ColorSequenceKeypoint.new(0.8, Color3.fromRGB(180, 90, 255)),
ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 80, 80)),
})
bg.Parent = card
task.spawn(function()
while bg.Parent do
grad.Rotation = (grad.Rotation + 2) % 360
task.wait(0.03)
end
end)
end
local function scan()
for _, d in ipairs(PlayerGui:GetDescendants()) do
if d:IsA("TextLabel") and t3[d.Text] == true then
local card = findCard(d)
if card then
paint(card)
end
end
end
end
while true do
pcall(scan)
task.wait(0.3)
end
end)
