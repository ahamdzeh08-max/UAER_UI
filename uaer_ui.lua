-- UAER_UI — ULTIMATE EMPTY LIB (WindUI Style, 50+ Themes, Public API)
-- Drop into Delta / Roblox executor, then use _G.UAER_UI to add your own tabs/buttons/sliders/etc.

local TweenService      = game:GetService("TweenService")
local UserInputService  = game:GetService("UserInputService")
local Players           = game:GetService("Players")
local GuiService        = game:GetService("GuiService")
local Debris            = game:GetService("Debris")
local SoundService      = game:GetService("SoundService")
local LocalizationService = game:GetService("LocalizationService")

local player = Players.LocalPlayer

-- ===== CONFIG =====
local WINDOW_WIDTH  = 700
local WINDOW_HEIGHT = 450
local MIN_WIDTH     = 550
local MIN_HEIGHT    = 380
local MAX_WIDTH     = 950
local MAX_HEIGHT    = 700

-- ===== 50+ THEMES (WindUI‑style) =====
local function generateThemes()
    local themes = {}
    local baseColors = {
        { name = "Default", bg = Color3.fromRGB(10,8,22), sb = Color3.fromRGB(14,11,30), card = Color3.fromRGB(18,15,38), border = Color3.fromRGB(28,22,52), neon = Color3.fromRGB(150,90,255), pink = Color3.fromRGB(240,70,160), blue = Color3.fromRGB(50,140,255), green = Color3.fromRGB(50,220,120), orange = Color3.fromRGB(255,170,50), gold = Color3.fromRGB(255,215,0), white = Color3.fromRGB(255,255,255), muted = Color3.fromRGB(140,135,165) },
        { name = "Dark",    bg = Color3.fromRGB(8,8,16),   sb = Color3.fromRGB(12,10,24),  card = Color3.fromRGB(16,14,32),  border = Color3.fromRGB(24,20,44),  neon = Color3.fromRGB(130,70,220), pink = Color3.fromRGB(210,50,140), blue = Color3.fromRGB(30,120,220), green = Color3.fromRGB(40,200,100), orange = Color3.fromRGB(230,150,40), gold = Color3.fromRGB(230,190,0), white = Color3.fromRGB(230,230,230), muted = Color3.fromRGB(120,115,145) },
        { name = "Light",   bg = Color3.fromRGB(240,240,250), sb = Color3.fromRGB(230,230,245), card = Color3.fromRGB(220,220,240), border = Color3.fromRGB(200,200,220), neon = Color3.fromRGB(130,70,220), pink = Color3.fromRGB(210,50,140), blue = Color3.fromRGB(30,120,220), green = Color3.fromRGB(40,200,100), orange = Color3.fromRGB(230,150,40), gold = Color3.fromRGB(200,160,0), white = Color3.fromRGB(20,20,40), muted = Color3.fromRGB(100,100,130) },
        { name = "Ocean",   bg = Color3.fromRGB(10,20,40), sb = Color3.fromRGB(14,28,56), card = Color3.fromRGB(18,36,72), border = Color3.fromRGB(28,48,88), neon = Color3.fromRGB(80,180,255), pink = Color3.fromRGB(255,100,150), blue = Color3.fromRGB(50,200,255), green = Color3.fromRGB(50,255,200), orange = Color3.fromRGB(255,200,50), gold = Color3.fromRGB(255,215,0), white = Color3.fromRGB(255,255,255), muted = Color3.fromRGB(140,180,220) },
        { name = "Forest",  bg = Color3.fromRGB(10,30,10), sb = Color3.fromRGB(14,40,14), card = Color3.fromRGB(18,50,18), border = Color3.fromRGB(28,70,28), neon = Color3.fromRGB(100,255,100), pink = Color3.fromRGB(255,150,150), blue = Color3.fromRGB(100,200,255), green = Color3.fromRGB(50,255,50), orange = Color3.fromRGB(255,200,50), gold = Color3.fromRGB(255,215,0), white = Color3.fromRGB(255,255,255), muted = Color3.fromRGB(150,200,150) },
        { name = "Sunset",  bg = Color3.fromRGB(40,10,20), sb = Color3.fromRGB(56,14,28), card = Color3.fromRGB(72,18,36), border = Color3.fromRGB(88,28,48), neon = Color3.fromRGB(255,150,80), pink = Color3.fromRGB(255,80,150), blue = Color3.fromRGB(200,100,255), green = Color3.fromRGB(255,200,50), orange = Color3.fromRGB(255,100,50), gold = Color3.fromRGB(255,180,0), white = Color3.fromRGB(255,255,255), muted = Color3.fromRGB(220,150,180) },
        { name = "Midnight", bg = Color3.fromRGB(6,6,20), sb = Color3.fromRGB(10,10,28), card = Color3.fromRGB(14,14,36), border = Color3.fromRGB(24,24,52), neon = Color3.fromRGB(150,80,255), pink = Color3.fromRGB(200,60,180), blue = Color3.fromRGB(60,120,255), green = Color3.fromRGB(60,200,120), orange = Color3.fromRGB(200,150,60), gold = Color3.fromRGB(200,180,0), white = Color3.fromRGB(220,220,255), muted = Color3.fromRGB(120,120,180) },
        { name = "Neon",    bg = Color3.fromRGB(0,0,0), sb = Color3.fromRGB(10,10,10), card = Color3.fromRGB(20,20,20), border = Color3.fromRGB(40,40,40), neon = Color3.fromRGB(255,0,255), pink = Color3.fromRGB(255,0,128), blue = Color3.fromRGB(0,255,255), green = Color3.fromRGB(0,255,0), orange = Color3.fromRGB(255,128,0), gold = Color3.fromRGB(255,215,0), white = Color3.fromRGB(255,255,255), muted = Color3.fromRGB(200,200,200) },
        { name = "Pastel",  bg = Color3.fromRGB(240,230,240), sb = Color3.fromRGB(230,220,230), card = Color3.fromRGB(220,210,220), border = Color3.fromRGB(200,190,200), neon = Color3.fromRGB(200,150,255), pink = Color3.fromRGB(255,180,200), blue = Color3.fromRGB(150,200,255), green = Color3.fromRGB(150,255,200), orange = Color3.fromRGB(255,220,150), gold = Color3.fromRGB(255,215,0), white = Color3.fromRGB(40,30,40), muted = Color3.fromRGB(120,110,120) },
        { name = "Candy",   bg = Color3.fromRGB(255,200,220), sb = Color3.fromRGB(255,180,200), card = Color3.fromRGB(255,160,180), border = Color3.fromRGB(200,120,140), neon = Color3.fromRGB(255,80,120), pink = Color3.fromRGB(255,50,100), blue = Color3.fromRGB(100,200,255), green = Color3.fromRGB(50,255,150), orange = Color3.fromRGB(255,200,50), gold = Color3.fromRGB(255,215,0), white = Color3.fromRGB(40,20,30), muted = Color3.fromRGB(100,60,80) },
        { name = "Cyber",   bg = Color3.fromRGB(10,20,30), sb = Color3.fromRGB(20,30,50), card = Color3.fromRGB(30,40,60), border = Color3.fromRGB(0,255,255), neon = Color3.fromRGB(0,255,255), pink = Color3.fromRGB(255,0,255), blue = Color3.fromRGB(0,200,255), green = Color3.fromRGB(0,255,200), orange = Color3.fromRGB(255,200,0), gold = Color3.fromRGB(255,215,0), white = Color3.fromRGB(0,255,255), muted = Color3.fromRGB(100,200,200) },
    }
    for _, t in ipairs(baseColors) do
        themes[t.name] = {
            MainBg = t.bg, SidebarBg = t.sb, CardBg = t.card, BorderDark = t.border,
            NeonPurple = t.neon, AccentPink = t.pink, AccentBlue = t.blue,
            AccentGreen = t.green, AccentOrange = t.orange, Gold = t.gold,
            TextWhite = t.white, TextMuted = t.muted
        }
    end

    local hueCount = 50
    local namePool = {
        "Aqua","Berry","Chocolate","Dawn","Eclipse","Frost","Glacier","Haze","Ice","Jade",
        "Kiwi","Lavender","Mango","Nebula","Onyx","Peach","Quartz","Rose","Silver","Tropical",
        "Ultra","Violet","Wave","Xenon","Yellow","Zen","Abyss","Blaze","Cloud","Dusk",
        "Ember","Flame","Grape","Heart","Ink","Jungle","Knight","Lemon","Mist","Night",
        "Orchid","Plum","Royal","Sky","Tangerine","Umbra","Venom","Whisper","X-Ray","Yukon",
        "Zion","Aurora","Breeze","Crimson","Drift","Glimmer","Haven","Iris"
    }
    for i = 1, hueCount do
        local h = (i / hueCount) * 0.8 + 0.1
        local name = namePool[i] or ("Theme_" .. i)
        local base = Color3.fromHSV(h, 0.6, 0.3)
        local bg = base:Lerp(Color3.fromRGB(0,0,0), 0.2)
        local sb = base:Lerp(Color3.fromRGB(0,0,0), 0.1)
        local card = base:Lerp(Color3.fromRGB(255,255,255), 0.15)
        local border = base:Lerp(Color3.fromRGB(255,255,255), 0.3)
        local neon = Color3.fromHSV(h, 0.9, 0.9)
        local pink = Color3.fromHSV(h + 0.08, 0.8, 0.9)
        local blue = Color3.fromHSV(h - 0.08, 0.8, 0.9)
        local green = Color3.fromHSV(h + 0.25, 0.8, 0.8)
        local orange = Color3.fromHSV(h + 0.15, 0.8, 0.8)
        local gold = Color3.fromHSV(0.12, 0.9, 0.8)
        local white = Color3.fromHSV(0, 0, 0.95)
        local muted = Color3.fromHSV(h, 0.3, 0.6)
        themes[name] = {
            MainBg = bg, SidebarBg = sb, CardBg = card, BorderDark = border,
            NeonPurple = neon, AccentPink = pink, AccentBlue = blue,
            AccentGreen = green, AccentOrange = orange, Gold = gold,
            TextWhite = white, TextMuted = muted
        }
    end
    return themes
end

local THEMES       = generateThemes()
local currentTheme = "Midnight"
local COLORS       = THEMES[currentTheme]

-- ===== HELPERS =====
local function Tween(obj, props, dur, style)
    dur   = dur   or 0.25
    style = style or Enum.EasingStyle.Quad
    local t = TweenService:Create(obj, TweenInfo.new(dur, style, Enum.EasingDirection.Out), props)
    t:Play()
    return t
end

local function Debounce(fn)
    local busy = false
    return function(...)
        if busy then return end
        busy = true
        fn(...)
        task.wait(0.2)
        busy = false
    end
end

local function Notify(text)
    local gui = Instance.new("ScreenGui")
    gui.ResetOnSpawn = false
    gui.Parent = player:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 240, 0, 45)
    frame.Position = UDim2.new(1, 260, 1, -80)
    frame.BackgroundColor3 = Color3.fromRGB(20,20,35)
    frame.Parent = gui
    local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(0,8); c.Parent = frame
    local s = Instance.new("UIStroke"); s.Color = COLORS.NeonPurple; s.Thickness = 1; s.Parent = frame

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1,-10,1,0); lbl.Position = UDim2.new(0,5,0,0)
    lbl.BackgroundTransparency = 1; lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(255,255,255); lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 12; lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = frame

    local sound = Instance.new("Sound"); sound.SoundId = "rbxassetid://6026984224"
    sound.Volume = 0.5; sound.Parent = frame; sound:Play(); Debris:AddItem(sound, 2)

    Tween(frame, { Position = UDim2.new(1, -260, 1, -80) }, 0.25)
    task.delay(2, function()
        Tween(frame, { Position = UDim2.new(1, 260, 1, -80), BackgroundTransparency = 1 }, 0.25)
        task.wait(0.25)
        frame:Destroy(); gui:Destroy()
    end)
end

-- ===== ROOT UI =====
local loadingGui = Instance.new("ScreenGui")
loadingGui.ResetOnSpawn = false
loadingGui.Parent = player:WaitForChild("PlayerGui")

local loadFrame = Instance.new("Frame")
loadFrame.Size = UDim2.new(0, 0, 0, 0)
loadFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
loadFrame.AnchorPoint = Vector2.new(0.5, 0.5)
loadFrame.BackgroundColor3 = COLORS.MainBg
loadFrame.Parent = loadingGui
local lc = Instance.new("UICorner"); lc.CornerRadius = UDim.new(0, 12); lc.Parent = loadFrame
local ls = Instance.new("UIStroke"); ls.Color = COLORS.NeonPurple; ls.Thickness = 2; ls.Parent = loadFrame
local loadText = Instance.new("TextLabel")
loadText.Size = UDim2.new(1,0,1,0); loadText.BackgroundTransparency = 1
loadText.Text = "Loading UAER_UI..."
loadText.TextColor3 = COLORS.TextWhite; loadText.Font = Enum.Font.GothamBold; loadText.TextSize = 14
loadText.Parent = loadFrame

Tween(loadFrame, { Size = UDim2.new(0, 220, 0, 70) }, 0.4, Enum.EasingStyle.Back)
task.wait(1.2)
Tween(loadFrame, { BackgroundTransparency = 1 }, 0.3)
Tween(loadText, { TextTransparency = 1 }, 0.3)
task.wait(0.3)
loadingGui:Destroy()

local gui = Instance.new("ScreenGui")
gui.Name = "UAER_UI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 0, 0, 0)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = COLORS.MainBg
main.BackgroundTransparency = 1
main.ClipsDescendants = true
main.Parent = gui
local mainCorner = Instance.new("UICorner"); mainCorner.CornerRadius = UDim.new(0,14); mainCorner.Parent = main

local glowOuter = Instance.new("UIStroke"); glowOuter.Color = COLORS.NeonPurple; glowOuter.Thickness = 3; glowOuter.Transparency = 0.75; glowOuter.Parent = main
local glowInner = Instance.new("UIStroke"); glowInner.Color = COLORS.NeonPurple; glowInner.Thickness = 1.2; glowInner.Transparency = 0.1; glowInner.Parent = main

Tween(main, { Size = UDim2.new(0, WINDOW_WIDTH, 0, WINDOW_HEIGHT), BackgroundTransparency = 0 }, 0.35, Enum.EasingStyle.Back)

-- ===== DRAG =====
local dragging = false
local dragStart, startPos

local dragArea = Instance.new("Frame")
dragArea.Size = UDim2.new(1, 0, 0, 55)
dragArea.BackgroundTransparency = 1
dragArea.Parent = main

dragArea.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- ===== TOP BAR =====
local top = Instance.new("Frame")
top.Size = UDim2.new(1,0,0,55)
top.BackgroundTransparency = 1
top.Parent = main

local brandLabel = Instance.new("TextLabel")
brandLabel.Text = "UAER_UI"
brandLabel.Font = Enum.Font.GothamBold
brandLabel.TextSize = 20
brandLabel.TextColor3 = COLORS.TextWhite
brandLabel.Position = UDim2.new(0,20,0,10)
brandLabel.Size = UDim2.new(0,120,0,20)
brandLabel.TextXAlignment = Enum.TextXAlignment.Left
brandLabel.BackgroundTransparency = 1
brandLabel.Parent = top

local subLabel = Instance.new("TextLabel")
subLabel.Text = "WindUI‑Style Roblox UI Library"
subLabel.Font = Enum.Font.GothamMedium
subLabel.TextSize = 11
subLabel.TextColor3 = COLORS.NeonPurple
subLabel.Position = UDim2.new(0,20,0,32)
subLabel.Size = UDim2.new(0,220,0,12)
subLabel.TextXAlignment = Enum.TextXAlignment.Left
subLabel.BackgroundTransparency = 1
subLabel.Parent = top

local badgeLabel = Instance.new("TextLabel")
badgeLabel.Text = player.Name
badgeLabel.Font = Enum.Font.GothamBold
badgeLabel.TextSize = 12
badgeLabel.TextColor3 = COLORS.Gold
badgeLabel.Position = UDim2.new(0,260,0,14)
badgeLabel.Size = UDim2.new(0,120,0,16)
badgeLabel.TextXAlignment = Enum.TextXAlignment.Left
badgeLabel.BackgroundTransparency = 1
badgeLabel.Parent = top

local avatarFrame = Instance.new("Frame")
avatarFrame.Size = UDim2.new(0,32,0,32)
avatarFrame.Position = UDim2.new(0,390,0,12)
avatarFrame.BackgroundColor3 = COLORS.CardBg
avatarFrame.Parent = top
local avCorner = Instance.new("UICorner"); avCorner.CornerRadius = UDim.new(1,0); avCorner.Parent = avatarFrame
local avImg = Instance.new("ImageLabel")
avImg.Size = UDim2.new(1,0,1,0)
avImg.BackgroundTransparency = 1
avImg.Parent = avatarFrame
pcall(function()
    avImg.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size100x100)
end)
if avImg.Image == "" then
    avImg.Image = "rbxasset://textures/ui/PlayerAvatarPlaceholder.png"
end

-- ===== CONTROLS (Hide / Close) =====
local controlsFrame = Instance.new("Frame")
controlsFrame.Size = UDim2.new(0,110,1,0)
controlsFrame.Position = UDim2.new(1,-125,0,0)
controlsFrame.BackgroundTransparency = 1
controlsFrame.Parent = top
local cLayout = Instance.new("UIListLayout")
cLayout.FillDirection = Enum.FillDirection.Horizontal
cLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
cLayout.VerticalAlignment = Enum.VerticalAlignment.Center
cLayout.Padding = UDim.new(0,6)
cLayout.Parent = controlsFrame

local minimized = false
local savedSize = UDim2.new(0, WINDOW_WIDTH, 0, WINDOW_HEIGHT)
local miniBar   = nil

local sidebar, pageContainer, resizeHandle, versionLabel, creditLabel
local tabs = {}
local themeLabel
local themePreviewButtons = {}

local function setVisible(v)
    if sidebar      then sidebar.Visible      = v end
    if pageContainer then pageContainer.Visible = v end
    if resizeHandle then resizeHandle.Visible = v end
    if versionLabel then versionLabel.Visible = v end
    if creditLabel  then creditLabel.Visible  = v end
end

local function toggleMinimize()
    minimized = not minimized
    if minimized then
        savedSize = main.Size
        Tween(main, { Size = UDim2.new(0, savedSize.X.Offset, 0, 55) }, 0.25)
        setVisible(false)
        if not miniBar then
            miniBar = Instance.new("Frame")
            miniBar.Size = UDim2.new(0, 220, 0, 55)
            miniBar.Position = main.Position
            miniBar.BackgroundColor3 = COLORS.MainBg
            miniBar.BackgroundTransparency = 0
            miniBar.Visible = false
            miniBar.Parent = gui
            local mCorner = Instance.new("UICorner"); mCorner.CornerRadius = UDim.new(0,14); mCorner.Parent = miniBar
            local mStroke = Instance.new("UIStroke"); mStroke.Color = COLORS.NeonPurple; mStroke.Thickness = 2; mStroke.Transparency = 0.5; mStroke.Parent = miniBar
            local mAvatar = Instance.new("ImageLabel")
            mAvatar.Size = UDim2.new(0,32,0,32)
            mAvatar.Position = UDim2.new(0,10,0,12)
            mAvatar.BackgroundColor3 = COLORS.CardBg
            mAvatar.Parent = miniBar
            local maCorner = Instance.new("UICorner"); maCorner.CornerRadius = UDim.new(1,0); maCorner.Parent = mAvatar
            pcall(function()
                mAvatar.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size100x100)
            end)
            if mAvatar.Image == "" then
                mAvatar.Image = "rbxasset://textures/ui/PlayerAvatarPlaceholder.png"
            end
            local mName = Instance.new("TextLabel")
            mName.Text = player.Name
            mName.Font = Enum.Font.GothamBold
            mName.TextSize = 14
            mName.TextColor3 = COLORS.TextWhite
            mName.Position = UDim2.new(0,50,0,10)
            mName.Size = UDim2.new(1,-60,0,18)
            mName.TextXAlignment = Enum.TextXAlignment.Left
            mName.BackgroundTransparency = 1
            mName.Parent = miniBar
            local mPrem = Instance.new("TextLabel")
            mPrem.Text = "UAER_UI Hidden"
            mPrem.Font = Enum.Font.GothamMedium
            mPrem.TextSize = 10
            mPrem.TextColor3 = COLORS.Gold
            mPrem.Position = UDim2.new(0,50,0,30)
            mPrem.Size = UDim2.new(1,-60,0,14)
            mPrem.TextXAlignment = Enum.TextXAlignment.Left
            mPrem.BackgroundTransparency = 1
            mPrem.Parent = miniBar
            local showBtn = Instance.new("TextButton")
            showBtn.Size = UDim2.new(0,28,0,28)
            showBtn.Position = UDim2.new(1,-38,0.5,-14)
            showBtn.BackgroundColor3 = COLORS.CardBg
            showBtn.Text = "◀"
            showBtn.TextColor3 = COLORS.TextWhite
            showBtn.Font = Enum.Font.GothamBold
            showBtn.TextSize = 14
            showBtn.Parent = miniBar
            local sCorner = Instance.new("UICorner"); sCorner.CornerRadius = UDim.new(0,7); sCorner.Parent = showBtn
            showBtn.MouseButton1Click:Connect(function()
                if minimized then toggleMinimize() end
            end)
        end
        miniBar.Position = main.Position
        miniBar.Visible = true
        Notify("UI Hidden")
    else
        if miniBar then miniBar.Visible = false end
        Tween(main, { Size = savedSize }, 0.25)
        setVisible(true)
        Notify("UI Restored")
        task.defer(function()
            for _, tab in ipairs(tabs) do
                local layout = tab.page:FindFirstChildOfClass("UIListLayout")
                if layout then
                    tab.page.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 40)
                end
            end
        end)
    end
end

local function makeControl(icon, action)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0,28,0,28)
    btn.BackgroundColor3 = COLORS.SidebarBg
    btn.Text = icon
    btn.TextColor3 = COLORS.TextMuted
    btn.Font = Enum.Font.GothamBold
    
end
_G.UAER_UI = API
