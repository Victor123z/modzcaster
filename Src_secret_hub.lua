local RadientPaid = {}
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local HttpService = game:GetService("HttpService")
local pfp
local user
local tag
local userinfo = {}

_G.Key = ""
_G.Discord = ""

if game.CoreGui:FindFirstChild(_G.Key .."," .. _G.Discord) then
	game.CoreGui:FindFirstChild(_G.Key .."," .. _G.Discord):Destroy()
 end

pcall(function()
	userinfo = HttpService:JSONDecode(readfile("Radient.txt"));
end)

pfp = userinfo["pfp"] or "https://www.roblox.com/headshot-thumbnail/image?userId=".. game.Players.LocalPlayer.UserId .."&width=420&height=420&format=png"
user =  userinfo["user"] or game.Players.LocalPlayer.Name
tag = userinfo["tag"] or tostring(math.random(1,10))

local function SaveInfo()
	userinfo["pfp"] = pfp
	userinfo["user"] = user
	userinfo["tag"] = tag
	writefile("Radient.txt", HttpService:JSONEncode(userinfo));
end

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(StartPosition.X.Scale,StartPosition.X.Offset + Delta.X,StartPosition.Y.Scale,StartPosition.Y.Offset + Delta.Y)
		local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						Dragging = false
					end
				end)
			end
		end)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end)
end

local RadientPaidSC = Instance.new("ScreenGui")
RadientPaidSC.Name = _G.Key .."," .. _G.Discord
RadientPaidSC.Parent = game:GetService("CoreGui")
RadientPaidSC.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

game:GetService("UserInputService").InputBegan:connect(function(inputObject, gameProcessedEvent)
	if inputObject.KeyCode == Enum.KeyCode.RightControl then
		wait()
		RadientPaidSC.Enabled = not RadientPaidSC.Enabled
	end
end)

function RadientPaid:Window(text,maincolor)

	local currentservertoggled = ""
	local minimized = false
	local fs = false
	local settingsopened = false
	local MainFrame = Instance.new("Frame")
	local TopFrame = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local CloseBtn = Instance.new("TextButton")
	local CloseIcon = Instance.new("ImageLabel")
	local MinimizeBtn = Instance.new("TextButton")
	local MinimizeIcon = Instance.new("ImageLabel")
	local ServersHolder = Instance.new("Folder")
	local Userpad = Instance.new("Frame")
	local UserIcon = Instance.new("Frame")
	local UserIconCorner = Instance.new("UICorner")
	local Corner_1 = Instance.new("UICorner")
	local UserImage = Instance.new("ImageLabel")
	local UserCircleImage = Instance.new("ImageLabel")
	local UserName = Instance.new("TextLabel")
	local UserTag = Instance.new("TextLabel")
	local ServersHoldFrame = Instance.new("Frame")
	local ServersHold = Instance.new("ScrollingFrame")
	local ServersHoldLayout = Instance.new("UIListLayout")
	local ServersHoldPadding = Instance.new("UIPadding")
	local TopFrameHolder = Instance.new("Frame")
	local TopFramess = Instance.new("Frame")

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = RadientPaidSC
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
	MainFrame.BackgroundTransparency = 1
	MainFrame.BorderSizePixel = 0
	MainFrame.ClipsDescendants = true
	MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.Size = UDim2.new(0, 611, 0, 396)

	Corner_1.CornerRadius = UDim.new(0, 7)
	Corner_1.Name = "UserIconCorner"
	Corner_1.Parent = MainFrame

	TopFrame.Name = "TopFrame"
	TopFrame.Parent = MainFrame
	TopFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
	TopFrame.BackgroundTransparency = 1
	TopFrame.BorderSizePixel = 0
	TopFrame.Position = UDim2.new(-0.000658480625, 0, 0, 0)
	TopFrame.Size = UDim2.new(0, 681, 0, 22)

	TopFramess.Name = "TopFramess"
	TopFramess.Parent = TopFrame
	TopFramess.BackgroundColor3 = Color3.fromRGB(255,255,255)
	TopFramess.BackgroundTransparency = 1
	TopFramess.BorderSizePixel = 0
	TopFramess.ZIndex = 99
	TopFramess.Position = UDim2.new(-0.2, 0, 1.3, 0)
	TopFramess.Size = UDim2.new(0, 681, 0, 22)

	TopFrameHolder.Name = "TopFrameHolder"
	TopFrameHolder.Parent = TopFrame
	TopFrameHolder.BackgroundColor3 = Color3.fromRGB(20,20,20)
	TopFrameHolder.BackgroundTransparency = 1.000
	TopFrameHolder.BorderSizePixel = 0
	TopFrameHolder.Position = UDim2.new(-0.000658480625, 0, 0, 0)
	TopFrameHolder.Size = UDim2.new(0, 20, 0, 22)


	Title.Name = "Title"
	Title.Parent = TopFrame
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.0102790017, 0, 0, 0)
	Title.Size = UDim2.new(0, 192, 0, 23)
	Title.Font = Enum.Font.GothamBold
	Title.Text = text
	Title.TextTransparency = 0
	Title.TextColor3 = Color3.fromRGB(255,255,255)
	Title.TextSize = 13.000
	Title.TextXAlignment = Enum.TextXAlignment.Left

	CloseBtn.Name = "CloseBtn"
	CloseBtn.Parent = TopFrame
	CloseBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
	CloseBtn.BackgroundTransparency = 1
	CloseBtn.Position = UDim2.new(0.85, 0, 1.3, 0)
	CloseBtn.Size = UDim2.new(0, 28, 0, 22)
	CloseBtn.Font = Enum.Font.Gotham
	CloseBtn.Text = ""
	CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	CloseBtn.TextSize = 14.000
	CloseBtn.BorderSizePixel = 0
	CloseBtn.AutoButtonColor = false

	CloseIcon.Name = "CloseIcon"
	CloseIcon.Parent = CloseBtn
	CloseIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseIcon.BackgroundTransparency = 1.000
	CloseIcon.Position = UDim2.new(0.2, 0, 0.128935531, 0)
	CloseIcon.Size = UDim2.new(0, 17, 0, 17)
	CloseIcon.Image = "http://www.roblox.com/asset/?id=6035047409"
	CloseIcon.ImageColor3 = Color3.fromRGB(220, 221, 222)

	MinimizeBtn.Name = "MinimizeButton"
	MinimizeBtn.Parent = TopFrame
	MinimizeBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
	MinimizeBtn.BackgroundTransparency = 1
	MinimizeBtn.Position = UDim2.new(0.8, 0, 1.3, 0)
	MinimizeBtn.Size = UDim2.new(0, 28, 0, 22)
	MinimizeBtn.Font = Enum.Font.Gotham
	MinimizeBtn.Text = ""
	MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	MinimizeBtn.TextSize = 14.000
	MinimizeBtn.BorderSizePixel = 0
	MinimizeBtn.AutoButtonColor = false

	MinimizeIcon.Name = "MinimizeLabel"
	MinimizeIcon.Parent = MinimizeBtn
	MinimizeIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MinimizeIcon.BackgroundTransparency = 1.000
	MinimizeIcon.Position = UDim2.new(0.2, 0, 0.128935531, 0)
	MinimizeIcon.Size = UDim2.new(0, 17, 0, 17)
	MinimizeIcon.Image = "http://www.roblox.com/asset/?id=6035067836"
	MinimizeIcon.ImageColor3 = Color3.fromRGB(220, 221, 222)

	ServersHolder.Name = "ServersHolder"
	ServersHolder.Parent = TopFrameHolder

	Userpad.Name = "Userpad"
	Userpad.Parent = TopFrameHolder
	Userpad.BackgroundColor3 = Color3.fromRGB(20,20,20)
	Userpad.BorderSizePixel = 0
	Userpad.Position = UDim2.new(0.106243297, 0, 15.9807148, 0)
	Userpad.Size = UDim2.new(0, 179, 0, 43)

	UserIcon.Name = "UserIcon"
	UserIcon.Parent = Userpad
	UserIcon.BackgroundColor3 = Color3.fromRGB(20,20,20)
	UserIcon.BorderSizePixel = 0
	UserIcon.Position = UDim2.new(0.0340000018, 0, 0.123999998, 0)
	UserIcon.Size = UDim2.new(0, 32, 0, 32)

	UserIconCorner.CornerRadius = UDim.new(1, 8)
	UserIconCorner.Name = "UserIconCorner"
	UserIconCorner.Parent = UserIcon

	--รูปที่อยู่มุมล่าง
	UserImage.Name = "UserImage"
	UserImage.Parent = UserIcon
	UserImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserImage.BackgroundTransparency = 1.000
	UserImage.Size = UDim2.new(0, 32, 0, 32)
	UserImage.Image = "http://www.roblox.com/asset/?id=8226716738"
	-----------------------------------------------------------------
	UserCircleImage.Name = "UserImage"
	UserCircleImage.Parent = UserImage
	UserCircleImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserCircleImage.BackgroundTransparency = 1.000
	UserCircleImage.Size = UDim2.new(0, 32, 0, 32)
	UserCircleImage.Image = "rbxassetid://4031889928"
	UserCircleImage.ImageColor3 = Color3.fromRGB(20,20,20)

	UserName.Name = "UserName"
	UserName.Parent = Userpad
	UserName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserName.BackgroundTransparency = 1.000
	UserName.BorderSizePixel = 0
	UserName.Position = UDim2.new(0.230000004, 0, 0.115999997, 0)
	UserName.Size = UDim2.new(0, 98, 0, 17)
	UserName.Font = Enum.Font.GothamSemibold
	UserName.TextSize = 13.000
	UserName.TextTransparency = 1
	UserName.TextXAlignment = Enum.TextXAlignment.Left
	UserName.ClipsDescendants = true

	UserTag.Name = "UserTag"
	UserTag.Parent = Userpad
	UserTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserTag.BackgroundTransparency = 1.000
	UserTag.BorderSizePixel = 0
	UserTag.Position = UDim2.new(0.230000004, 0, 0.275000013, 0)
	UserTag.Size = UDim2.new(0, 95, 0, 17)
	UserTag.Font = Enum.Font.GothamBold
	UserTag.TextColor3 = Color3.fromRGB(86, 217, 252)
	UserTag.TextSize = 13.000
	UserTag.TextTransparency = 0
	UserTag.TextXAlignment = Enum.TextXAlignment.Left

	UserName.Text = "Secret ● Hub"
	UserTag.Text = "" .. "Secret ● Hub"

	ServersHoldFrame.Name = "ServersHoldFrame"
	ServersHoldFrame.Parent = MainFrame
	ServersHoldFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ServersHoldFrame.BackgroundTransparency = 1.000
	ServersHoldFrame.BorderColor3 = Color3.fromRGB(20,20,20)
	ServersHoldFrame.Size = UDim2.new(0, 71, 0, 396)

	ServersHold.Name = "ServersHold"
	ServersHold.Parent = ServersHoldFrame
	ServersHold.Active = true
	ServersHold.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ServersHold.BackgroundTransparency = 1.000
	ServersHold.BorderSizePixel = 0
	ServersHold.Position = UDim2.new(-0.000359333731, 0, 0.0580808073, 0)
	ServersHold.Size = UDim2.new(0, 71, 0, 373)
	ServersHold.ScrollBarThickness = 1
	ServersHold.ScrollBarImageTransparency = 1
	ServersHold.CanvasSize = UDim2.new(0, 0, 0, 0)

	ServersHoldLayout.Name = "ServersHoldLayout"
	ServersHoldLayout.Parent = ServersHold
	ServersHoldLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ServersHoldLayout.Padding = UDim.new(0, 7)

	ServersHoldPadding.Name = "ServersHoldPadding"
	ServersHoldPadding.Parent = ServersHold

	CloseBtn.MouseButton1Click:Connect(
		function()
			MainFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .5, true)
		end
	)

	CloseBtn.MouseEnter:Connect(
		function()
			CloseBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
		end
	)

	CloseBtn.MouseLeave:Connect(
		function()
			CloseBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
		end
	)

	MinimizeBtn.MouseEnter:Connect(
		function()
			MinimizeBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
		end
	)

	MinimizeBtn.MouseLeave:Connect(
		function()
			MinimizeBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
		end
	)

	MinimizeBtn.MouseButton1Click:Connect(
		function()
			if minimized == false then
				MainFrame:TweenSize(
					UDim2.new(0, 611, 0, 64),
					Enum.EasingDirection.Out,
					Enum.EasingStyle.Quart,
					.3,
					true
				)
			else
				MainFrame:TweenSize(
					UDim2.new(0, 611, 0, 396),
					Enum.EasingDirection.Out,
					Enum.EasingStyle.Quart,
					.3,
					true
				)
			end
			minimized = not minimized
		end
	)

	local SettingsOpenBtn = Instance.new("TextButton")
	local SettingsOpenBtnIco = Instance.new("ImageLabel")

	SettingsOpenBtn.Name = "SettingsOpenBtn"
	SettingsOpenBtn.Parent = Userpad
	SettingsOpenBtn.BackgroundColor3 = Color3.fromRGB(53, 56, 62)
	SettingsOpenBtn.BackgroundTransparency = 1.000
	SettingsOpenBtn.Position = UDim2.new(0.849161983, 0, 0.279069781, 0)
	SettingsOpenBtn.Size = UDim2.new(0, 0, 0, 0)
	SettingsOpenBtn.Font = Enum.Font.SourceSans
	SettingsOpenBtn.Text = ""
	SettingsOpenBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	SettingsOpenBtn.TextSize = 14.000

	SettingsOpenBtnIco.Name = "SettingsOpenBtnIco"
	SettingsOpenBtnIco.Parent = SettingsOpenBtn
	SettingsOpenBtnIco.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
	SettingsOpenBtnIco.BackgroundTransparency = 1.000
	SettingsOpenBtnIco.Size = UDim2.new(0, 0, 0, 0)
	SettingsOpenBtnIco.ImageTransparency = 1
	SettingsOpenBtnIco.Image = "http://www.roblox.com/asset/?id=6031280882"
	SettingsOpenBtnIco.ImageColor3 = Color3.fromRGB(220, 220, 220)
	local SettingsFrame = Instance.new("Frame")
	local Settings = Instance.new("Frame")
	local SettingsHolder = Instance.new("Frame")
	local CloseSettingsBtn = Instance.new("TextButton")
	local CloseSettingsBtnCorner = Instance.new("UICorner")
	local CloseSettingsBtnCircle = Instance.new("Frame")
	local CloseSettingsBtnCircleCorner = Instance.new("UICorner")
	local CloseSettingsBtnIcon = Instance.new("ImageLabel")
	local TextLabel = Instance.new("TextLabel")
	local UserPanel = Instance.new("Frame")
	local UserSettingsPad = Instance.new("Frame")
	local UserSettingsPadCorner = Instance.new("UICorner")
	local UsernameText = Instance.new("TextLabel")
	local UserSettingsPadUserTag = Instance.new("Frame")
	local UserSettingsPadUser = Instance.new("TextLabel")
	local UserSettingsPadUserTagLayout = Instance.new("UIListLayout")
	local UserSettingsPadTag = Instance.new("TextLabel")
	local EditBtn = Instance.new("TextButton")
	local EditBtnCorner = Instance.new("UICorner")
	local UserPanelUserIcon = Instance.new("TextButton")
	local UserPanelUserImage = Instance.new("ImageLabel")
	local UserPanelUserCircle = Instance.new("ImageLabel")
	local BlackFrame = Instance.new("Frame")
	local BlackFrameCorner = Instance.new("UICorner")
	local ChangeAvatarText = Instance.new("TextLabel")
	local SearchIcoFrame = Instance.new("Frame")
	local SearchIcoFrameCorner = Instance.new("UICorner")
	local SearchIco = Instance.new("ImageLabel")
	local UserPanelUserTag = Instance.new("Frame")
	local UserPanelUser = Instance.new("TextLabel")
	local UserPanelUserTagLayout = Instance.new("UIListLayout")
	local UserPanelTag = Instance.new("TextLabel")
	local UserPanelCorner = Instance.new("UICorner")
	local LeftFrame = Instance.new("Frame")
	local MyAccountBtn = Instance.new("TextButton")
	local MyAccountBtnCorner = Instance.new("UICorner")
	local MyAccountBtnTitle = Instance.new("TextLabel")
	local SettingsTitle = Instance.new("TextLabel")
	local DiscordInfo = Instance.new("TextLabel")
	local CurrentSettingOpen = Instance.new("TextLabel")

	SettingsFrame.Name = "SettingsFrame"
	SettingsFrame.Parent = MainFrame
	SettingsFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
	SettingsFrame.BackgroundTransparency = 1.000
	SettingsFrame.Size = UDim2.new(0, 681, 0, 396)
	SettingsFrame.Visible = false

	Settings.Name = "Settings"
	Settings.Parent = SettingsFrame
	Settings.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
	Settings.BorderSizePixel = 0
	Settings.Position = UDim2.new(0, 0, 0.0530303046, 0)
	Settings.Size = UDim2.new(0, 681, 0, 375)

	SettingsHolder.Name = "SettingsHolder"
	SettingsHolder.Parent = Settings
	SettingsHolder.AnchorPoint = Vector2.new(0.5, 0.5)
	SettingsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SettingsHolder.BackgroundTransparency = 1.000
	SettingsHolder.ClipsDescendants = true
	SettingsHolder.Position = UDim2.new(0.49926579, 0, 0.498666674, 0)
	SettingsHolder.Size = UDim2.new(0, 0, 0, 0)

	CloseSettingsBtn.Name = "CloseSettingsBtn"
	CloseSettingsBtn.Parent = SettingsHolder
	CloseSettingsBtn.AnchorPoint = Vector2.new(0.5, 0.5)
	CloseSettingsBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
	CloseSettingsBtn.Position = UDim2.new(0.952967286, 0, 0.0853333324, 0)
	CloseSettingsBtn.Selectable = false
	CloseSettingsBtn.Size = UDim2.new(0, 30, 0, 30)
	CloseSettingsBtn.AutoButtonColor = false
	CloseSettingsBtn.Font = Enum.Font.SourceSans
	CloseSettingsBtn.Text = ""
	CloseSettingsBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	CloseSettingsBtn.TextSize = 14.000

	CloseSettingsBtnCorner.CornerRadius = UDim.new(1, 0)
	CloseSettingsBtnCorner.Name = "CloseSettingsBtnCorner"
	CloseSettingsBtnCorner.Parent = CloseSettingsBtn

	CloseSettingsBtnCircle.Name = "CloseSettingsBtnCircle"
	CloseSettingsBtnCircle.Parent = CloseSettingsBtn
	CloseSettingsBtnCircle.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
	CloseSettingsBtnCircle.Position = UDim2.new(0.0879999995, 0, 0.118000001, 0)
	CloseSettingsBtnCircle.Size = UDim2.new(0, 24, 0, 24)

	CloseSettingsBtnCircleCorner.CornerRadius = UDim.new(1, 0)
	CloseSettingsBtnCircleCorner.Name = "CloseSettingsBtnCircleCorner"
	CloseSettingsBtnCircleCorner.Parent = CloseSettingsBtnCircle

	CloseSettingsBtnIcon.Name = "CloseSettingsBtnIcon"
	CloseSettingsBtnIcon.Parent = CloseSettingsBtnCircle
	CloseSettingsBtnIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseSettingsBtnIcon.BackgroundTransparency = 1.000
	CloseSettingsBtnIcon.Position = UDim2.new(0, 2, 0, 2)
	CloseSettingsBtnIcon.Size = UDim2.new(0, 19, 0, 19)
	CloseSettingsBtnIcon.Image = "http://www.roblox.com/asset/?id=6035047409"
	CloseSettingsBtnIcon.ImageColor3 = Color3.fromRGB(222, 222, 222)

	CloseSettingsBtn.MouseButton1Click:Connect(function()
		settingsopened = false
		TopFrameHolder.Visible = true
		ServersHoldFrame.Visible = true
		SettingsHolder:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
		TweenService:Create(
			Settings,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 1}
		):Play()
		for i,v in next, SettingsHolder:GetChildren() do
			TweenService:Create(
				v,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
		end
		wait(.3)
		SettingsFrame.Visible = false
	end)

	CloseSettingsBtn.MouseEnter:Connect(function()
		CloseSettingsBtnCircle.BackgroundColor3 = Color3.fromRGB(72,76,82)
	end)

	CloseSettingsBtn.MouseLeave:Connect(function()
		CloseSettingsBtnCircle.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
	end)

	UserInputService.InputBegan:Connect(
		function(io, p)
			if io.KeyCode == Enum.KeyCode.RightControl then
				if settingsopened == true then
					settingsopened = false
					TopFrameHolder.Visible = true
					ServersHoldFrame.Visible = true
					SettingsHolder:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
					TweenService:Create(
						Settings,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
					for i,v in next, SettingsHolder:GetChildren() do
						TweenService:Create(
							v,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundTransparency = 1}
						):Play()
					end
					wait(.3)
					SettingsFrame.Visible = false
				end
			end
		end
	)

	TextLabel.Parent = CloseSettingsBtn
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(-0.0666666701, 0, 1.06666672, 0)
	TextLabel.Size = UDim2.new(0, 34, 0, 22)
	TextLabel.Font = Enum.Font.GothamSemibold
	TextLabel.Text = "rightctrl"
	TextLabel.TextColor3 = Color3.fromRGB(113, 117, 123)
	TextLabel.TextSize = 11.000

	UserPanel.Name = "UserPanel"
	UserPanel.Parent = SettingsHolder
	UserPanel.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
	UserPanel.Position = UDim2.new(0.365638763, 0, 0.130666673, 0)
	UserPanel.Size = UDim2.new(0, 362, 0, 164)

	UserSettingsPad.Name = "UserSettingsPad"
	UserSettingsPad.Parent = UserPanel
	UserSettingsPad.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
	UserSettingsPad.Position = UDim2.new(0.0331491716, 0, 0.568140388, 0)
	UserSettingsPad.Size = UDim2.new(0, 337, 0, 56)

	UserSettingsPadCorner.Name = "UserSettingsPadCorner"
	UserSettingsPadCorner.Parent = UserSettingsPad

	UsernameText.Name = "UsernameText"
	UsernameText.Parent = UserSettingsPad
	UsernameText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UsernameText.BackgroundTransparency = 1.000
	UsernameText.Position = UDim2.new(0.0419999994, 0, 0.154714286, 0)
	UsernameText.Size = UDim2.new(0, 65, 0, 19)
	UsernameText.Font = Enum.Font.GothamBold
	UsernameText.Text = "USERNAME"
	UsernameText.TextColor3 = Color3.fromRGB(126, 130, 136)
	UsernameText.TextSize = 11.000
	UsernameText.TextXAlignment = Enum.TextXAlignment.Left

	UserSettingsPadUserTag.Name = "UserSettingsPadUserTag"
	UserSettingsPadUserTag.Parent = UserSettingsPad
	UserSettingsPadUserTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserSettingsPadUserTag.BackgroundTransparency = 1.000
	UserSettingsPadUserTag.Position = UDim2.new(0.0419999994, 0, 0.493999988, 0)
	UserSettingsPadUserTag.Size = UDim2.new(0, 65, 0, 19)

	UserSettingsPadUser.Name = "UserSettingsPadUser"
	UserSettingsPadUser.Parent = UserSettingsPadUserTag
	UserSettingsPadUser.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserSettingsPadUser.BackgroundTransparency = 1.000
	UserSettingsPadUser.Font = Enum.Font.Gotham
	UserSettingsPadUser.TextColor3 = Color3.fromRGB(255, 255, 255)
	UserSettingsPadUser.TextSize = 13.000
	UserSettingsPadUser.TextXAlignment = Enum.TextXAlignment.Left
	UserSettingsPadUser.Text = user
	UserSettingsPadUser.Size = UDim2.new(0, UserSettingsPadUser.TextBounds.X + 2, 0, 19)

	UserSettingsPadUserTagLayout.Name = "UserSettingsPadUserTagLayout"
	UserSettingsPadUserTagLayout.Parent = UserSettingsPadUserTag
	UserSettingsPadUserTagLayout.FillDirection = Enum.FillDirection.Horizontal
	UserSettingsPadUserTagLayout.SortOrder = Enum.SortOrder.LayoutOrder

	UserSettingsPadTag.Name = "UserSettingsPadTag"
	UserSettingsPadTag.Parent = UserSettingsPadUserTag
	UserSettingsPadTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserSettingsPadTag.BackgroundTransparency = 1.000
	UserSettingsPadTag.Position = UDim2.new(0.0419999994, 0, 0.493999988, 0)
	UserSettingsPadTag.Size = UDim2.new(0, 65, 0, 19)
	UserSettingsPadTag.Font = Enum.Font.Gotham
	UserSettingsPadTag.Text = "#" .. tag
	UserSettingsPadTag.TextColor3 = Color3.fromRGB(184, 186, 189)
	UserSettingsPadTag.TextSize = 13.000
	UserSettingsPadTag.TextXAlignment = Enum.TextXAlignment.Left

	EditBtn.Name = "EditBtn"
	EditBtn.Parent = UserSettingsPad
	EditBtn.BackgroundColor3 = Color3.fromRGB(116, 127, 141)
	EditBtn.Position = UDim2.new(0.797671914, 0, 0.232142866, 0)
	EditBtn.Size = UDim2.new(0, 55, 0, 30)
	EditBtn.Font = Enum.Font.Gotham
	EditBtn.Text = "Edit"
	EditBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	EditBtn.TextSize = 14.000
	EditBtn.AutoButtonColor = false

	EditBtn.MouseEnter:Connect(function()
		TweenService:Create(
			EditBtn,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundColor3 = Color3.fromRGB(104,114,127)}
		):Play()
	end)

	EditBtn.MouseLeave:Connect(function()
		TweenService:Create(
			EditBtn,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundColor3 = Color3.fromRGB(116, 127, 141)}
		):Play()
	end)

	EditBtnCorner.CornerRadius = UDim.new(0, 3)
	EditBtnCorner.Name = "EditBtnCorner"
	EditBtnCorner.Parent = EditBtn

	UserPanelUserIcon.Name = "UserPanelUserIcon"
	UserPanelUserIcon.Parent = UserPanel
	UserPanelUserIcon.BackgroundColor3 = Color3.fromRGB(31, 33, 36)
	UserPanelUserIcon.BorderSizePixel = 0
	UserPanelUserIcon.Position = UDim2.new(0.0340000018, 0, 0.074000001, 0)
	UserPanelUserIcon.Size = UDim2.new(0, 71, 0, 71)
	UserPanelUserIcon.AutoButtonColor = false
	UserPanelUserIcon.Text = ""

	UserPanelUserImage.Name = "UserPanelUserImage"
	UserPanelUserImage.Parent = UserPanelUserIcon
	UserPanelUserImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelUserImage.BackgroundTransparency = 1.000
	UserPanelUserImage.Size = UDim2.new(0, 71, 0, 71)
	UserPanelUserImage.Image = pfp

	UserPanelUserCircle.Name = "UserPanelUserCircle"
	UserPanelUserCircle.Parent = UserPanelUserImage
	UserPanelUserCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelUserCircle.BackgroundTransparency = 1.000
	UserPanelUserCircle.Size = UDim2.new(0, 71, 0, 71)
	UserPanelUserCircle.Image = "rbxassetid://4031889928"
	UserPanelUserCircle.ImageColor3 = Color3.fromRGB(47, 49, 54)

	BlackFrame.Name = "BlackFrame"
	BlackFrame.Parent = UserPanelUserIcon
	BlackFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	BlackFrame.BackgroundTransparency = 0.400
	BlackFrame.BorderSizePixel = 0
	BlackFrame.Size = UDim2.new(0, 71, 0, 71)
	BlackFrame.Visible = false

	BlackFrameCorner.CornerRadius = UDim.new(1, 8)
	BlackFrameCorner.Name = "BlackFrameCorner"
	BlackFrameCorner.Parent = BlackFrame

	ChangeAvatarText.Name = "ChangeAvatarText"
	ChangeAvatarText.Parent = BlackFrame
	ChangeAvatarText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ChangeAvatarText.BackgroundTransparency = 1.000
	ChangeAvatarText.Size = UDim2.new(0, 71, 0, 71)
	ChangeAvatarText.Font = Enum.Font.GothamBold
	ChangeAvatarText.Text = "CHAGNE    AVATAR"
	ChangeAvatarText.TextColor3 = Color3.fromRGB(255, 255, 255)
	ChangeAvatarText.TextSize = 11.000
	ChangeAvatarText.TextWrapped = true

	SearchIcoFrame.Name = "SearchIcoFrame"
	SearchIcoFrame.Parent = UserPanelUserIcon
	SearchIcoFrame.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
	SearchIcoFrame.Position = UDim2.new(0.657999992, 0, 0, 0)
	SearchIcoFrame.Size = UDim2.new(0, 20, 0, 20)

	SearchIcoFrameCorner.CornerRadius = UDim.new(1, 8)
	SearchIcoFrameCorner.Name = "SearchIcoFrameCorner"
	SearchIcoFrameCorner.Parent = SearchIcoFrame

	SearchIco.Name = "SearchIco"
	SearchIco.Parent = SearchIcoFrame
	SearchIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SearchIco.BackgroundTransparency = 1.000
	SearchIco.Position = UDim2.new(0.150000006, 0, 0.100000001, 0)
	SearchIco.Size = UDim2.new(0, 15, 0, 15)
	SearchIco.Image = "http://www.roblox.com/asset/?id=6034407084"
	SearchIco.ImageColor3 = Color3.fromRGB(114, 118, 125)

	UserPanelUserIcon.MouseEnter:Connect(function()
		BlackFrame.Visible = true
	end)

	UserPanelUserIcon.MouseLeave:Connect(function()
		BlackFrame.Visible = false
	end)

	UserPanelUserIcon.MouseButton1Click:Connect(function()
		local NotificationHolder = Instance.new("TextButton")
		NotificationHolder.Name = "NotificationHolder"
		NotificationHolder.Parent = SettingsHolder
		NotificationHolder.BackgroundColor3 = Color3.fromRGB(22,22,22)
		NotificationHolder.Position = UDim2.new(-0.00881057233, 0, -0.00266666664, 0)
		NotificationHolder.Size = UDim2.new(0, 687, 0, 375)
		NotificationHolder.AutoButtonColor = false
		NotificationHolder.Font = Enum.Font.SourceSans
		NotificationHolder.Text = ""
		NotificationHolder.TextColor3 = Color3.fromRGB(0, 0, 0)
		NotificationHolder.TextSize = 14.000
		NotificationHolder.BackgroundTransparency = 1
		NotificationHolder.Visible = true
		TweenService:Create(
			NotificationHolder,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0.2}
		):Play()



		local AvatarChange = Instance.new("Frame")
		local UserChangeCorner = Instance.new("UICorner")
		local UnderBar = Instance.new("Frame")
		local UnderBarCorner = Instance.new("UICorner")
		local UnderBarFrame = Instance.new("Frame")
		local Text1 = Instance.new("TextLabel")
		local Text2 = Instance.new("TextLabel")
		local TextBoxFrame = Instance.new("Frame")
		local TextBoxFrameCorner = Instance.new("UICorner")
		local TextBoxFrame1 = Instance.new("Frame")
		local TextBoxFrame1Corner = Instance.new("UICorner")
		local AvatarTextbox = Instance.new("TextBox")
		local ChangeBtn = Instance.new("TextButton")
		local ChangeCorner = Instance.new("UICorner")
		local CloseBtn2 = Instance.new("TextButton")
		local Close2Icon = Instance.new("ImageLabel")
		local CloseBtn1 = Instance.new("TextButton")
		local CloseBtn1Corner = Instance.new("UICorner")
		local ResetBtn = Instance.new("TextButton")
		local ResetCorner = Instance.new("UICorner")


		AvatarChange.Name = "AvatarChange"
		AvatarChange.Parent = NotificationHolder
		AvatarChange.AnchorPoint = Vector2.new(0.5, 0.5)
		AvatarChange.BackgroundColor3 = Color3.fromRGB(20,20,20)
		AvatarChange.ClipsDescendants = true
		AvatarChange.Position = UDim2.new(0.513071597, 0, 0.4746176, 0)
		AvatarChange.Size = UDim2.new(0, 0, 0, 0)
		AvatarChange.BackgroundTransparency = 1

		AvatarChange:TweenSize(UDim2.new(0, 346, 0, 198), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
		TweenService:Create(
			AvatarChange,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0}
		):Play()


		UserChangeCorner.CornerRadius = UDim.new(0, 5)
		UserChangeCorner.Name = "UserChangeCorner"
		UserChangeCorner.Parent = AvatarChange

		UnderBar.Name = "UnderBar"
		UnderBar.Parent = AvatarChange
		UnderBar.BackgroundColor3 = Color3.fromRGB(25,25,25)
		UnderBar.Position = UDim2.new(-0.000297061284, 0, 0.945048928, 0)
		UnderBar.Size = UDim2.new(0, 346, 0, 13)

		UnderBarCorner.CornerRadius = UDim.new(0, 5)
		UnderBarCorner.Name = "UnderBarCorner"
		UnderBarCorner.Parent = UnderBar

		UnderBarFrame.Name = "UnderBarFrame"
		UnderBarFrame.Parent = UnderBar
		UnderBarFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
		UnderBarFrame.BorderSizePixel = 0
		UnderBarFrame.Position = UDim2.new(-0.000297061284, 0, -2.53846145, 0)
		UnderBarFrame.Size = UDim2.new(0, 346, 0, 39)

		Text1.Name = "Text1"
		Text1.Parent = AvatarChange
		Text1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text1.BackgroundTransparency = 1.000
		Text1.Position = UDim2.new(-0.000594122568, 0, 0.0202020202, 0)
		Text1.Size = UDim2.new(0, 346, 0, 68)
		Text1.Font = Enum.Font.GothamSemibold
		Text1.Text = "Change your avatar"
		Text1.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text1.TextSize = 20.000

		Text2.Name = "Text2"
		Text2.Parent = AvatarChange
		Text2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text2.BackgroundTransparency = 1.000
		Text2.Position = UDim2.new(-0.000594122568, 0, 0.141587839, 0)
		Text2.Size = UDim2.new(0, 346, 0, 63)
		Text2.Font = Enum.Font.Gotham
		Text2.Text = "Enter your new profile in a Roblox decal link."
		Text2.TextColor3 = Color3.fromRGB(171, 172, 176)
		Text2.TextSize = 14.000

		TextBoxFrame.Name = "TextBoxFrame"
		TextBoxFrame.Parent = AvatarChange
		TextBoxFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		TextBoxFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
		TextBoxFrame.Position = UDim2.new(0.49710983, 0, 0.560606062, 0)
		TextBoxFrame.Size = UDim2.new(0, 319, 0, 38)

		TextBoxFrameCorner.CornerRadius = UDim.new(0, 3)
		TextBoxFrameCorner.Name = "TextBoxFrameCorner"
		TextBoxFrameCorner.Parent = TextBoxFrame

		TextBoxFrame1.Name = "TextBoxFrame1"
		TextBoxFrame1.Parent = TextBoxFrame
		TextBoxFrame1.AnchorPoint = Vector2.new(0.5, 0.5)
		TextBoxFrame1.BackgroundColor3 = Color3.fromRGB(48, 51, 57)
		TextBoxFrame1.ClipsDescendants = true
		TextBoxFrame1.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextBoxFrame1.Size = UDim2.new(0, 317, 0, 36)

		TextBoxFrame1Corner.CornerRadius = UDim.new(0, 3)
		TextBoxFrame1Corner.Name = "TextBoxFrame1Corner"
		TextBoxFrame1Corner.Parent = TextBoxFrame1

		AvatarTextbox.Name = "AvatarTextbox"
		AvatarTextbox.Parent = TextBoxFrame1
		AvatarTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		AvatarTextbox.BackgroundTransparency = 1.000
		AvatarTextbox.Position = UDim2.new(0.0378548913, 0, 0, 0)
		AvatarTextbox.Size = UDim2.new(0, 293, 0, 37)
		AvatarTextbox.Font = Enum.Font.Gotham
		AvatarTextbox.Text = ""
		AvatarTextbox.TextColor3 = Color3.fromRGB(193, 195, 197)
		AvatarTextbox.TextSize = 14.000
		AvatarTextbox.TextXAlignment = Enum.TextXAlignment.Left

		ChangeBtn.Name = "ChangeBtn"
		ChangeBtn.Parent = AvatarChange
		ChangeBtn.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
		ChangeBtn.Position = UDim2.new(0.749670506, 0, 0.823232353, 0)
		ChangeBtn.Size = UDim2.new(0, 76, 0, 27)
		ChangeBtn.Font = Enum.Font.Gotham
		ChangeBtn.Text = "Change"
		ChangeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		ChangeBtn.TextSize = 13.000
		ChangeBtn.AutoButtonColor = false

		ChangeBtn.MouseEnter:Connect(function()
			TweenService:Create(
				ChangeBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(103,123,196)}
			):Play()
		end)

		ChangeBtn.MouseLeave:Connect(function()
			TweenService:Create(
				ChangeBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
		end)

		ChangeBtn.MouseButton1Click:Connect(function()
			pfp = tostring(AvatarTextbox.Text)
			UserImage.Image = pfp
			UserPanelUserImage.Image = pfp
			SaveInfo()

			AvatarChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				AvatarChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)



		ChangeCorner.CornerRadius = UDim.new(0, 4)
		ChangeCorner.Name = "ChangeCorner"
		ChangeCorner.Parent = ChangeBtn

		CloseBtn2.Name = "CloseBtn2"
		CloseBtn2.Parent = AvatarChange
		CloseBtn2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn2.BackgroundTransparency = 1.000
		CloseBtn2.Position = UDim2.new(0.898000002, 0, 0, 0)
		CloseBtn2.Size = UDim2.new(0, 26, 0, 26)
		CloseBtn2.Font = Enum.Font.Gotham
		CloseBtn2.Text = ""
		CloseBtn2.TextColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn2.TextSize = 14.000

		Close2Icon.Name = "Close2Icon"
		Close2Icon.Parent = CloseBtn2
		Close2Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Close2Icon.BackgroundTransparency = 1.000
		Close2Icon.Position = UDim2.new(-0.0384615399, 0, 0.312910825, 0)
		Close2Icon.Size = UDim2.new(0, 25, 0, 25)
		Close2Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
		Close2Icon.ImageColor3 = Color3.fromRGB(119, 122, 127)

		CloseBtn1.Name = "CloseBtn1"
		CloseBtn1.Parent = AvatarChange
		CloseBtn1.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
		CloseBtn1.BackgroundTransparency = 1.000
		CloseBtn1.Position = UDim2.new(0.495000005, 0, 0.823000014, 0)
		CloseBtn1.Size = UDim2.new(0, 76, 0, 27)
		CloseBtn1.Font = Enum.Font.Gotham
		CloseBtn1.Text = "Close"
		CloseBtn1.TextColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn1.TextSize = 13.000

		CloseBtn1Corner.CornerRadius = UDim.new(0, 4)
		CloseBtn1Corner.Name = "CloseBtn1Corner"
		CloseBtn1Corner.Parent = CloseBtn1

		ResetBtn.Name = "ResetBtn"
		ResetBtn.Parent = AvatarChange
		ResetBtn.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
		ResetBtn.BackgroundTransparency = 1.000
		ResetBtn.Position = UDim2.new(0.260895967, 0, 0.823000014, 0)
		ResetBtn.Size = UDim2.new(0, 76, 0, 27)
		ResetBtn.Font = Enum.Font.Gotham
		ResetBtn.Text = "Reset"
		ResetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		ResetBtn.TextSize = 13.000

		ResetBtn.MouseButton1Click:Connect(function()
			pfp = "https://www.roblox.com/headshot-thumbnail/image?userId=".. game.Players.LocalPlayer.UserId .."&width=420&height=420&format=png"
			UserImage.Image = pfp
			UserPanelUserImage.Image = pfp
			SaveInfo()

			AvatarChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				AvatarChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		ResetCorner.CornerRadius = UDim.new(0, 4)
		ResetCorner.Name = "ResetCorner"
		ResetCorner.Parent = ResetBtn

		CloseBtn1.MouseButton1Click:Connect(function()
			AvatarChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				AvatarChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		CloseBtn2.MouseButton1Click:Connect(function()
			AvatarChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				AvatarChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		CloseBtn2.MouseEnter:Connect(function()
			TweenService:Create(
				Close2Icon,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(210,210,210)}
			):Play()
		end)

		CloseBtn2.MouseLeave:Connect(function()
			TweenService:Create(
				Close2Icon,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(119, 122, 127)}
			):Play()
		end)


		AvatarTextbox.Focused:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
		end)

		AvatarTextbox.FocusLost:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(37, 40, 43)}
			):Play()
		end)


	end)

	UserPanelUserTag.Name = "UserPanelUserTag"
	UserPanelUserTag.Parent = UserPanel
	UserPanelUserTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelUserTag.BackgroundTransparency = 1.000
	UserPanelUserTag.Position = UDim2.new(0.271143615, 0, 0.231804818, 0)
	UserPanelUserTag.Size = UDim2.new(0, 113, 0, 19)

	UserPanelUser.Name = "UserPanelUser"
	UserPanelUser.Parent = UserPanelUserTag
	UserPanelUser.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelUser.BackgroundTransparency = 1.000
	UserPanelUser.Font = Enum.Font.GothamSemibold
	UserPanelUser.TextColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelUser.TextSize = 17.000
	UserPanelUser.TextXAlignment = Enum.TextXAlignment.Left
	UserPanelUser.Text = user
	UserPanelUser.Size = UDim2.new(0, UserPanelUser.TextBounds.X + 2, 0, 19)


	UserPanelUserTagLayout.Name = "UserPanelUserTagLayout"
	UserPanelUserTagLayout.Parent = UserPanelUserTag
	UserPanelUserTagLayout.FillDirection = Enum.FillDirection.Horizontal
	UserPanelUserTagLayout.SortOrder = Enum.SortOrder.LayoutOrder

	UserPanelTag.Name = "UserPanelTag"
	UserPanelTag.Parent = UserPanelUserTag
	UserPanelTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelTag.BackgroundTransparency = 1.000
	UserPanelTag.Position = UDim2.new(0.0419999994, 0, 0.493999988, 0)
	UserPanelTag.Size = UDim2.new(0, 65, 0, 19)
	UserPanelTag.Font = Enum.Font.Gotham
	UserPanelTag.Text = "#" .. tag
	UserPanelTag.TextColor3 = Color3.fromRGB(184, 186, 189)
	UserPanelTag.TextSize = 17.000
	UserPanelTag.TextXAlignment = Enum.TextXAlignment.Left

	UserPanelCorner.Name = "UserPanelCorner"
	UserPanelCorner.Parent = UserPanel

	LeftFrame.Name = "LeftFrame"
	LeftFrame.Parent = SettingsHolder
	LeftFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
	LeftFrame.BorderSizePixel = 0
	LeftFrame.Position = UDim2.new(0, 0, -0.000303059904, 0)
	LeftFrame.Size = UDim2.new(0, 233, 0, 375)

	MyAccountBtn.Name = "MyAccountBtn"
	MyAccountBtn.Parent = LeftFrame
	MyAccountBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
	MyAccountBtn.BorderSizePixel = 0
	MyAccountBtn.Position = UDim2.new(0.271232396, 0, 0.101614028, 0)
	MyAccountBtn.Size = UDim2.new(0, 160, 0, 30)
	MyAccountBtn.AutoButtonColor = false
	MyAccountBtn.Font = Enum.Font.SourceSans
	MyAccountBtn.Text = ""
	MyAccountBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	MyAccountBtn.TextSize = 14.000

	MyAccountBtnCorner.CornerRadius = UDim.new(0, 6)
	MyAccountBtnCorner.Name = "MyAccountBtnCorner"
	MyAccountBtnCorner.Parent = MyAccountBtn

	MyAccountBtnTitle.Name = "MyAccountBtnTitle"
	MyAccountBtnTitle.Parent = MyAccountBtn
	MyAccountBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MyAccountBtnTitle.BackgroundTransparency = 1.000
	MyAccountBtnTitle.BorderSizePixel = 0
	MyAccountBtnTitle.Position = UDim2.new(0.0759999976, 0, -0.166999996, 0)
	MyAccountBtnTitle.Size = UDim2.new(0, 95, 0, 39)
	MyAccountBtnTitle.Font = Enum.Font.GothamSemibold
	MyAccountBtnTitle.Text = "My Account"
	MyAccountBtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	MyAccountBtnTitle.TextSize = 14.000
	MyAccountBtnTitle.TextXAlignment = Enum.TextXAlignment.Left

	SettingsTitle.Name = "SettingsTitle"
	SettingsTitle.Parent = LeftFrame
	SettingsTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SettingsTitle.BackgroundTransparency = 1.000
	SettingsTitle.Position = UDim2.new(0.308999985, 0, 0.0450000018, 0)
	SettingsTitle.Size = UDim2.new(0, 65, 0, 19)
	SettingsTitle.Font = Enum.Font.GothamBlack
	SettingsTitle.Text = "SETTINGS"
	SettingsTitle.TextColor3 = Color3.fromRGB(142, 146, 152)
	SettingsTitle.TextSize = 11.000
	SettingsTitle.TextXAlignment = Enum.TextXAlignment.Left

	DiscordInfo.Name = "DiscordInfo"
	DiscordInfo.Parent = LeftFrame
	DiscordInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	DiscordInfo.BackgroundTransparency = 1.000
	DiscordInfo.Position = UDim2.new(0.304721028, 0, 0.821333349, 0)
	DiscordInfo.Size = UDim2.new(0, 133, 0, 44)
	DiscordInfo.Font = Enum.Font.Gotham
	DiscordInfo.Text = "Stable 1.0.0 (00001)  Host 0.0.0.1                Roblox Lua Engine    "
	DiscordInfo.TextColor3 = Color3.fromRGB(101, 108, 116)
	DiscordInfo.TextSize = 13.000
	DiscordInfo.TextWrapped = true
	DiscordInfo.TextXAlignment = Enum.TextXAlignment.Left
	DiscordInfo.TextYAlignment = Enum.TextYAlignment.Top

	CurrentSettingOpen.Name = "CurrentSettingOpen"
	CurrentSettingOpen.Parent = LeftFrame
	CurrentSettingOpen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CurrentSettingOpen.BackgroundTransparency = 1.000
	CurrentSettingOpen.Position = UDim2.new(1.07294846, 0, 0.0450000018, 0)
	CurrentSettingOpen.Size = UDim2.new(0, 65, 0, 19)
	CurrentSettingOpen.Font = Enum.Font.GothamBlack
	CurrentSettingOpen.Text = "MY ACCOUNT"
	CurrentSettingOpen.TextColor3 = Color3.fromRGB(255, 255, 255)
	CurrentSettingOpen.TextSize = 14.000
	CurrentSettingOpen.TextXAlignment = Enum.TextXAlignment.Left


	SettingsOpenBtn.MouseButton1Click:Connect(function ()
		settingsopened = true
		TopFrameHolder.Visible = false
		ServersHoldFrame.Visible = false
		SettingsFrame.Visible = true
		SettingsHolder:TweenSize(UDim2.new(0, 681, 0, 375), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
		Settings.BackgroundTransparency = 1
		TweenService:Create(
			Settings,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0}
		):Play()
		for i,v in next, SettingsHolder:GetChildren() do
			v.BackgroundTransparency = 1
			TweenService:Create(
				v,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 0}
			):Play()
		end
	end)

	EditBtn.MouseButton1Click:Connect(function()
		local NotificationHolder = Instance.new("TextButton")
		NotificationHolder.Name = "NotificationHolder"
		NotificationHolder.Parent = SettingsHolder
		NotificationHolder.BackgroundColor3 = Color3.fromRGB(22,22,22)
		NotificationHolder.Position = UDim2.new(-0.00881057233, 0, -0.00266666664, 0)
		NotificationHolder.Size = UDim2.new(0, 687, 0, 375)
		NotificationHolder.AutoButtonColor = false
		NotificationHolder.Font = Enum.Font.SourceSans
		NotificationHolder.Text = ""
		NotificationHolder.TextColor3 = Color3.fromRGB(0, 0, 0)
		NotificationHolder.TextSize = 14.000
		NotificationHolder.BackgroundTransparency = 1
		NotificationHolder.Visible = true
		TweenService:Create(
			NotificationHolder,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0.2}
		):Play()

		local UserChange = Instance.new("Frame")
		local UserChangeCorner = Instance.new("UICorner")
		local UnderBar = Instance.new("Frame")
		local UnderBarCorner = Instance.new("UICorner")
		local UnderBarFrame = Instance.new("Frame")
		local Text1 = Instance.new("TextLabel")
		local Text2 = Instance.new("TextLabel")
		local TextBoxFrame = Instance.new("Frame")
		local TextBoxFrameCorner = Instance.new("UICorner")
		local TextBoxFrame1 = Instance.new("Frame")
		local TextBoxFrame1Corner = Instance.new("UICorner")
		local UsernameTextbox = Instance.new("TextBox")
		local Seperator = Instance.new("Frame")
		local HashtagLabel = Instance.new("TextLabel")
		local TagTextbox = Instance.new("TextBox")
		local ChangeBtn = Instance.new("TextButton")
		local ChangeCorner = Instance.new("UICorner")
		local CloseBtn2 = Instance.new("TextButton")
		local Close2Icon = Instance.new("ImageLabel")
		local CloseBtn1 = Instance.new("TextButton")
		local CloseBtn1Corner = Instance.new("UICorner")

		UserChange.Name = "UserChange"
		UserChange.Parent = NotificationHolder
		UserChange.AnchorPoint = Vector2.new(0.5, 0.5)
		UserChange.BackgroundColor3 = Color3.fromRGB(25,25,25)
		UserChange.ClipsDescendants = true
		UserChange.Position = UDim2.new(0.513071597, 0, 0.4746176, 0)
		UserChange.Size = UDim2.new(0, 0, 0, 0)
		UserChange.BackgroundTransparency = 1

		UserChange:TweenSize(UDim2.new(0, 346, 0, 198), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
		TweenService:Create(
			UserChange,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0}
		):Play()

		UserChangeCorner.CornerRadius = UDim.new(0, 5)
		UserChangeCorner.Name = "UserChangeCorner"
		UserChangeCorner.Parent = UserChange

		UnderBar.Name = "UnderBar"
		UnderBar.Parent = UserChange
		UnderBar.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
		UnderBar.Position = UDim2.new(-0.000297061284, 0, 0.945048928, 0)
		UnderBar.Size = UDim2.new(0, 346, 0, 13)

		UnderBarCorner.CornerRadius = UDim.new(0, 5)
		UnderBarCorner.Name = "UnderBarCorner"
		UnderBarCorner.Parent = UnderBar

		UnderBarFrame.Name = "UnderBarFrame"
		UnderBarFrame.Parent = UnderBar
		UnderBarFrame.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
		UnderBarFrame.BorderSizePixel = 0
		UnderBarFrame.Position = UDim2.new(-0.000297061284, 0, -2.53846145, 0)
		UnderBarFrame.Size = UDim2.new(0, 346, 0, 39)

		Text1.Name = "Text1"
		Text1.Parent = UserChange
		Text1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text1.BackgroundTransparency = 1.000
		Text1.Position = UDim2.new(-0.000594122568, 0, 0.0202020202, 0)
		Text1.Size = UDim2.new(0, 346, 0, 68)
		Text1.Font = Enum.Font.GothamSemibold
		Text1.Text = "Change your username"
		Text1.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text1.TextSize = 20.000

		Text2.Name = "Text2"
		Text2.Parent = UserChange
		Text2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text2.BackgroundTransparency = 1.000
		Text2.Position = UDim2.new(-0.000594122568, 0, 0.141587839, 0)
		Text2.Size = UDim2.new(0, 346, 0, 63)
		Text2.Font = Enum.Font.Gotham
		Text2.Text = "Enter your new username."
		Text2.TextColor3 = Color3.fromRGB(171, 172, 176)
		Text2.TextSize = 14.000

		TextBoxFrame.Name = "TextBoxFrame"
		TextBoxFrame.Parent = UserChange
		TextBoxFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		TextBoxFrame.BackgroundColor3 = Color3.fromRGB(37, 40, 43)
		TextBoxFrame.Position = UDim2.new(0.49710983, 0, 0.560606062, 0)
		TextBoxFrame.Size = UDim2.new(0, 319, 0, 38)

		TextBoxFrameCorner.CornerRadius = UDim.new(0, 3)
		TextBoxFrameCorner.Name = "TextBoxFrameCorner"
		TextBoxFrameCorner.Parent = TextBoxFrame

		TextBoxFrame1.Name = "TextBoxFrame1"
		TextBoxFrame1.Parent = TextBoxFrame
		TextBoxFrame1.AnchorPoint = Vector2.new(0.5, 0.5)
		TextBoxFrame1.BackgroundColor3 = Color3.fromRGB(48, 51, 57)
		TextBoxFrame1.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextBoxFrame1.Size = UDim2.new(0, 317, 0, 36)

		TextBoxFrame1Corner.CornerRadius = UDim.new(0, 3)
		TextBoxFrame1Corner.Name = "TextBoxFrame1Corner"
		TextBoxFrame1Corner.Parent = TextBoxFrame1

		UsernameTextbox.Name = "UsernameTextbox"
		UsernameTextbox.Parent = TextBoxFrame1
		UsernameTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		UsernameTextbox.BackgroundTransparency = 1.000
		UsernameTextbox.Position = UDim2.new(0.0378548913, 0, 0, 0)
		UsernameTextbox.Size = UDim2.new(0, 221, 0, 37)
		UsernameTextbox.Font = Enum.Font.Gotham
		UsernameTextbox.Text = user
		UsernameTextbox.TextColor3 = Color3.fromRGB(193, 195, 197)
		UsernameTextbox.TextSize = 14.000
		UsernameTextbox.TextXAlignment = Enum.TextXAlignment.Left

		Seperator.Name = "Seperator"
		Seperator.Parent = TextBoxFrame1
		Seperator.AnchorPoint = Vector2.new(0.5, 0.5)
		Seperator.BackgroundColor3 = Color3.fromRGB(25,25,25)
		Seperator.BorderSizePixel = 0
		Seperator.Position = UDim2.new(0.753000021, 0, 0.500999987, 0)
		Seperator.Size = UDim2.new(0, 1, 0, 25)

		HashtagLabel.Name = "HashtagLabel"
		HashtagLabel.Parent = TextBoxFrame1
		HashtagLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		HashtagLabel.BackgroundTransparency = 1.000
		HashtagLabel.Position = UDim2.new(0.765877604, 0, -0.0546001866, 0)
		HashtagLabel.Size = UDim2.new(0, 23, 0, 37)
		HashtagLabel.Font = Enum.Font.Gotham
		HashtagLabel.Text = "#"
		HashtagLabel.TextColor3 = Color3.fromRGB(79, 82, 88)
		HashtagLabel.TextSize = 16.000

		TagTextbox.Name = "TagTextbox"
		TagTextbox.Parent = TextBoxFrame1
		TagTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TagTextbox.BackgroundTransparency = 1.000
		TagTextbox.Position = UDim2.new(0.824999988, 0, -0.0280000009, 0)
		TagTextbox.Size = UDim2.new(0, 59, 0, 38)
		TagTextbox.Font = Enum.Font.Gotham
		TagTextbox.PlaceholderColor3 = Color3.fromRGB(210, 211, 212)
		TagTextbox.Text = tag
		TagTextbox.TextColor3 = Color3.fromRGB(193, 195, 197)
		TagTextbox.TextSize = 14.000
		TagTextbox.TextXAlignment = Enum.TextXAlignment.Left

		ChangeBtn.Name = "ChangeBtn"
		ChangeBtn.Parent = UserChange
		ChangeBtn.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
		ChangeBtn.Position = UDim2.new(0.749670506, 0, 0.823232353, 0)
		ChangeBtn.Size = UDim2.new(0, 76, 0, 27)
		ChangeBtn.Font = Enum.Font.Gotham
		ChangeBtn.Text = "Change"
		ChangeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		ChangeBtn.TextSize = 13.000
		ChangeBtn.AutoButtonColor = false

		ChangeBtn.MouseEnter:Connect(function()
			TweenService:Create(
				ChangeBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(103,123,196)}
			):Play()
		end)

		ChangeBtn.MouseLeave:Connect(function()
			TweenService:Create(
				ChangeBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
		end)

		ChangeBtn.MouseButton1Click:Connect(function()
			user = UsernameTextbox.Text
			tag = TagTextbox.Text
			UserSettingsPadUser.Text = user
			UserSettingsPadUser.Size = UDim2.new(0, UserSettingsPadUser.TextBounds.X + 2, 0, 19)
			UserSettingsPadTag.Text = "#" .. tag
			UserPanelTag.Text = "#" .. tag
			UserPanelUser.Text = user
			UserPanelUser.Size = UDim2.new(0, UserPanelUser.TextBounds.X + 2, 0, 19)
			UserName.Text = user
			UserTag.Text = "#" .. tag
			SaveInfo()

			UserChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				UserChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		ChangeCorner.CornerRadius = UDim.new(0, 4)
		ChangeCorner.Name = "ChangeCorner"
		ChangeCorner.Parent = ChangeBtn

		CloseBtn2.Name = "CloseBtn2"
		CloseBtn2.Parent = UserChange
		CloseBtn2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn2.BackgroundTransparency = 1.000
		CloseBtn2.Position = UDim2.new(0.898000002, 0, 0, 0)
		CloseBtn2.Size = UDim2.new(0, 26, 0, 26)
		CloseBtn2.Font = Enum.Font.Gotham
		CloseBtn2.Text = ""
		CloseBtn2.TextColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn2.TextSize = 14.000

		Close2Icon.Name = "Close2Icon"
		Close2Icon.Parent = CloseBtn2
		Close2Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Close2Icon.BackgroundTransparency = 1.000
		Close2Icon.Position = UDim2.new(-0.0384615399, 0, 0.312910825, 0)
		Close2Icon.Size = UDim2.new(0, 25, 0, 25)
		Close2Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
		Close2Icon.ImageColor3 = Color3.fromRGB(119, 122, 127)

		CloseBtn1.Name = "CloseBtn1"
		CloseBtn1.Parent = UserChange
		CloseBtn1.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
		CloseBtn1.BackgroundTransparency = 1.000
		CloseBtn1.Position = UDim2.new(0.495000005, 0, 0.823000014, 0)
		CloseBtn1.Size = UDim2.new(0, 76, 0, 27)
		CloseBtn1.Font = Enum.Font.Gotham
		CloseBtn1.Text = "Close"
		CloseBtn1.TextColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn1.TextSize = 13.000

		CloseBtn1Corner.CornerRadius = UDim.new(0, 4)
		CloseBtn1Corner.Name = "CloseBtn1Corner"
		CloseBtn1Corner.Parent = CloseBtn1

		CloseBtn1.MouseButton1Click:Connect(function()
			UserChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				UserChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		CloseBtn2.MouseButton1Click:Connect(function()
			UserChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				UserChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		CloseBtn2.MouseEnter:Connect(function()
			TweenService:Create(
				Close2Icon,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(210,210,210)}
			):Play()
		end)

		CloseBtn2.MouseLeave:Connect(function()
			TweenService:Create(
				Close2Icon,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(119, 122, 127)}
			):Play()
		end)

		TagTextbox.Changed:Connect(function()
			TagTextbox.Text = TagTextbox.Text:sub(1,4)
		end)

		TagTextbox:GetPropertyChangedSignal("Text"):Connect(function()
			TagTextbox.Text = TagTextbox.Text:gsub('%D+', '');
		end)

		UsernameTextbox.Changed:Connect(function()
			UsernameTextbox.Text = UsernameTextbox.Text:sub(1,13)
		end)

		TagTextbox.Focused:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
		end)

		TagTextbox.FocusLost:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(37, 40, 43)}
			):Play()
		end)

		UsernameTextbox.Focused:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
		end)

		UsernameTextbox.FocusLost:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(37, 40, 43)}
			):Play()
		end)

	end)

	function RadientPaid:Notification(titletext, desctext, btntext)
		local NotificationHolderMain = Instance.new("TextButton")
		local Notification = Instance.new("Frame")
		local NotificationCorner = Instance.new("UICorner")
		local UnderBar = Instance.new("Frame")
		local UnderBarCorner = Instance.new("UICorner")
		local UnderBarFrame = Instance.new("Frame")
		local Text1 = Instance.new("TextLabel")
		local Text2 = Instance.new("TextLabel")
		local AlrightBtn = Instance.new("TextButton")
		local AlrightCorner = Instance.new("UICorner")

		NotificationHolderMain.Name = "NotificationHolderMain"
		NotificationHolderMain.Parent = MainFrame
		NotificationHolderMain.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		NotificationHolderMain.BackgroundTransparency = 1
		NotificationHolderMain.BorderSizePixel = 0
		NotificationHolderMain.Position = UDim2.new(0, 0, 0.0560000017, 0)
		NotificationHolderMain.Size = UDim2.new(0, 681, 0, 374)
		NotificationHolderMain.AutoButtonColor = false
		NotificationHolderMain.Font = Enum.Font.SourceSans
		NotificationHolderMain.Text = ""
		NotificationHolderMain.TextColor3 = Color3.fromRGB(0, 0, 0)
		NotificationHolderMain.TextSize = 14.000
		TweenService:Create(
			NotificationHolderMain,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0.2}
		):Play()


		Notification.Name = "Notification"
		Notification.Parent = NotificationHolderMain
		Notification.AnchorPoint = Vector2.new(0.5, 0.5)
		Notification.BackgroundColor3 = Color3.fromRGB(15,15,15)
		Notification.ClipsDescendants = true
		Notification.Position = UDim2.new(0.524819076, 0, 0.469270051, 0)
		Notification.Size = UDim2.new(0, 0, 0, 0)
		Notification.BackgroundTransparency = 1

		Notification:TweenSize(UDim2.new(0, 346, 0, 176), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)

		TweenService:Create(
			Notification,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0}
		):Play()

		NotificationCorner.CornerRadius = UDim.new(0, 5)
		NotificationCorner.Name = "NotificationCorner"
		NotificationCorner.Parent = Notification

		UnderBar.Name = "UnderBar"
		UnderBar.Parent = Notification
		UnderBar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
		UnderBar.Position = UDim2.new(-0.000297061284, 0, 0.945048928, 0)
		UnderBar.Size = UDim2.new(0, 346, 0, 10)

		UnderBarCorner.CornerRadius = UDim.new(0, 5)
		UnderBarCorner.Name = "UnderBarCorner"
		UnderBarCorner.Parent = UnderBar

		UnderBarFrame.Name = "UnderBarFrame"
		UnderBarFrame.Parent = UnderBar
		UnderBarFrame.BackgroundColor3 = Color3.fromRGB(14,14,14)
		UnderBarFrame.BorderSizePixel = 0
		UnderBarFrame.Position = UDim2.new(-0.000297061284, 0, -3.76068449, 0)
		UnderBarFrame.Size = UDim2.new(0, 346, 0, 40)

		Text1.Name = "Text1"
		Text1.Parent = Notification
		Text1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text1.BackgroundTransparency = 1.000
		Text1.Position = UDim2.new(-0.000594122568, 0, 0.0202020202, 0)
		Text1.Size = UDim2.new(0, 346, 0, 68)
		Text1.Font = Enum.Font.GothamSemibold
		Text1.Text = titletext
		Text1.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text1.TextSize = 20.000

		Text2.Name = "Text2"
		Text2.Parent = Notification
		Text2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text2.BackgroundTransparency = 1.000
		Text2.Position = UDim2.new(0.106342293, 0, 0.317724228, 0)
		Text2.Size = UDim2.new(0, 272, 0, 63)
		Text2.Font = Enum.Font.Gotham
		Text2.Text = desctext
		Text2.TextColor3 = Color3.fromRGB(171, 172, 176)
		Text2.TextSize = 14.000
		Text2.TextWrapped = true

		AlrightBtn.Name = "AlrightBtn"
		AlrightBtn.Parent = Notification
		AlrightBtn.BackgroundColor3 = Color3.fromRGB(206, 61, 73)
		AlrightBtn.Position = UDim2.new(0.0332369953, 0, 0.789141417, 0)
		AlrightBtn.Size = UDim2.new(0, 322, 0, 27)
		AlrightBtn.Font = Enum.Font.Gotham
		AlrightBtn.Text = btntext
		AlrightBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		AlrightBtn.TextSize = 13.000
		AlrightBtn.AutoButtonColor = false

		AlrightCorner.CornerRadius = UDim.new(0, 4)
		AlrightCorner.Name = "AlrightCorner"
		AlrightCorner.Parent = AlrightBtn

		AlrightBtn.MouseButton1Click:Connect(function()
			TweenService:Create(
				NotificationHolderMain,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			Notification:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				Notification,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait()
			NotificationHolderMain:Destroy()
		end)

		AlrightBtn.MouseEnter:Connect(function()
			TweenService:Create(
				AlrightBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(233, 25, 42)}
			):Play()
		end)

		AlrightBtn.MouseLeave:Connect(function()
			TweenService:Create(
				AlrightBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(206, 61, 73)}
			):Play()
		end)
	end

	MakeDraggable(TopFramess, MainFrame)
	ServersHoldPadding.PaddingLeft = UDim.new(0, 14)
	local ServerHold = {}
	function ServerHold:Server(text,textgame, img)
		local fc = false
		local currentchanneltoggled = ""
		local Server = Instance.new("TextButton")
		local ServerBtnCorner = Instance.new("UICorner")
		local ServerIco = Instance.new("ImageLabel")
		local ServerWhiteFrame = Instance.new("Frame")
		local ServerWhiteFrameCorner = Instance.new("UICorner")

		Server.Name = text .. "Server"
		Server.Parent = ServersHold
		Server.BackgroundColor3 = Color3.fromRGB(20,20,20)
		Server.Position = UDim2.new(0.125, 0, 0, 0)
		Server.Size = UDim2.new(0, 47, 0, 47)
		Server.AutoButtonColor = false
		Server.Font = Enum.Font.Gotham
		Server.Text = ""
		Server.BackgroundTransparency = 1
		Server.TextTransparency = 1
		Server.TextColor3 = Color3.fromRGB(86, 217, 252)
		Server.TextSize = 18.000

		ServerBtnCorner.CornerRadius = UDim.new(1, 0)
		ServerBtnCorner.Name = "ServerCorner"
		ServerBtnCorner.Parent = Server

		ServerWhiteFrame.Name = "ServerWhiteFrame"
		ServerWhiteFrame.Parent = Server
		ServerWhiteFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		ServerWhiteFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ServerWhiteFrame.BackgroundTransparency = 1
		ServerWhiteFrame.Position = UDim2.new(-0.347378343, 0, 0.502659559, 0)
		ServerWhiteFrame.Size = UDim2.new(0, 11, 0, 10)

		ServerWhiteFrameCorner.CornerRadius = UDim.new(1, 0)
		ServerWhiteFrameCorner.Name = "ServerWhiteFrameCorner"
		ServerWhiteFrameCorner.Parent = ServerWhiteFrame
		ServersHold.CanvasSize = UDim2.new(0, 0, 0, ServersHoldLayout.AbsoluteContentSize.Y)

		local ServerFrame = Instance.new("Frame")
		local ServerFrame1 = Instance.new("Frame")
		local ServerFrame2 = Instance.new("Frame")
		local ServerTitleFrame = Instance.new("Frame")
		local ServerTitle = Instance.new("TextLabel")
		local ServerTitle2 = Instance.new("TextLabel")
		local GlowFrame = Instance.new("Frame")
		local Glow = Instance.new("ImageLabel")
		local ServerContentFrame = Instance.new("Frame")
		local ServerCorner = Instance.new("UICorner")
		local ChannelCorner = Instance.new("UICorner")
		local ChannelTitleFrame = Instance.new("Frame")
		local Hashtag = Instance.new("TextLabel")
		local ChannelTitle = Instance.new("TextLabel")
		local ChannelContentFrame = Instance.new("Frame")
		local GlowChannel = Instance.new("ImageLabel")
		local ServerChannelHolder = Instance.new("ScrollingFrame")
		local ServerChannelHolderLayout = Instance.new("UIListLayout")
		local ServerChannelHolderPadding = Instance.new("UIPadding")


		ServerFrame.Name = "ServerFrame"
		ServerFrame.Parent = ServersHolder
		ServerFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
		ServerFrame.BorderSizePixel = 0
		ServerFrame.ClipsDescendants = true
		ServerFrame.Position = UDim2.new(0.105726875, 0, 1.01262593, 0)
		ServerFrame.Size = UDim2.new(0, 609, 0, 373)
		ServerFrame.Visible = false

		ServerFrame1.Name = "ServerFrame1"
		ServerFrame1.Parent = ServerFrame
		ServerFrame1.BackgroundColor3 = Color3.fromRGB(20,20,20)
		ServerFrame1.BorderSizePixel = 0
		ServerFrame1.Position = UDim2.new(0, 0, 0.972290039, 0)
		ServerFrame1.Size = UDim2.new(0, 12, 0, 10)

		ServerFrame2.Name = "ServerFrame2"
		ServerFrame2.Parent = ServerFrame
		ServerFrame2.BackgroundColor3 = Color3.fromRGB(20,20,20)
		ServerFrame2.BorderSizePixel = 0
		ServerFrame2.Position = UDim2.new(0.980295539, 0, 0.972290039, 0)
		ServerFrame2.Size = UDim2.new(0, 12, 0, 9)

		ServerTitleFrame.Name = "ServerTitleFrame"
		ServerTitleFrame.Parent = ServerFrame
		ServerTitleFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
		ServerTitleFrame.BackgroundTransparency = 1.000
		ServerTitleFrame.BorderSizePixel = 0
		ServerTitleFrame.Position = UDim2.new(-0.0010054264, 0, -0.000900391256, 0)
		ServerTitleFrame.Size = UDim2.new(0, 180, 0, 40)

		ServerTitle.Name = "ServerTitle"
		ServerTitle.Parent = ServerTitleFrame
		ServerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ServerTitle.BackgroundTransparency = 1.000
		ServerTitle.BorderSizePixel = 0
		ServerTitle.Position = UDim2.new(0.0751359761, 0, 0, 0)
		ServerTitle.Size = UDim2.new(0, 97, 0, 39)
		ServerTitle.Font = Enum.Font.GothamSemibold
		ServerTitle.Text = text
		ServerTitle.TextColor3 = Color3.fromRGB(86, 217, 252)
		ServerTitle.TextSize = 15.000
		ServerTitle.TextXAlignment = Enum.TextXAlignment.Left

		ServerTitle2.Name = "ServerTitle"
		ServerTitle2.Parent = ServerTitleFrame
		ServerTitle2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ServerTitle2.BackgroundTransparency = 1
		ServerTitle2.BorderSizePixel = 0
		ServerTitle2.Position = UDim2.new(0.0541359761, 0, 7.5, 0)
		ServerTitle2.Size = UDim2.new(0, 97, 0, 39)
		ServerTitle2.ZIndex = 999
		ServerTitle2.Font = Enum.Font.GothamSemibold
		ServerTitle2.Text = textgame
		ServerTitle2.TextColor3 = Color3.fromRGB(255, 255, 255)
		ServerTitle2.TextTransparency = 0.8
		ServerTitle2.TextSize = 13.000
		ServerTitle2.TextXAlignment = Enum.TextXAlignment.Left

		GlowFrame.Name = "GlowFrame"
		GlowFrame.Parent = ServerFrame
		GlowFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
		GlowFrame.BackgroundTransparency = 1.000
		GlowFrame.BorderSizePixel = 0
		GlowFrame.Position = UDim2.new(-0.0010054264, 0, -0.000900391256, 0)
		GlowFrame.Size = UDim2.new(0, 609, 0, 40)

		Glow.Name = "Glow"
		Glow.Parent = GlowFrame
		Glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Glow.BackgroundTransparency = 1.000
		Glow.BorderSizePixel = 0
		Glow.Position = UDim2.new(0, -15, 0, -15)
		Glow.Size = UDim2.new(1, 30, 1, 30)
		Glow.ZIndex = 0
		Glow.Image = "rbxassetid://4996891970"
		Glow.ImageColor3 = Color3.fromRGB(15, 15, 15)
		Glow.ScaleType = Enum.ScaleType.Slice
		Glow.SliceCenter = Rect.new(20, 20, 280, 280)

		ServerContentFrame.Name = "ServerContentFrame"
		ServerContentFrame.Parent = ServerFrame
		ServerContentFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
		ServerContentFrame.BackgroundTransparency = 1.000
		ServerContentFrame.BorderSizePixel = 0
		ServerContentFrame.Position = UDim2.new(-0.0010054264, 0, 0.106338218, 0)
		ServerContentFrame.Size = UDim2.new(0, 180, 0, 333)

		ServerCorner.CornerRadius = UDim.new(0, 4)
		ServerCorner.Name = "ServerCorner"
		ServerCorner.Parent = ServerFrame

		ChannelTitleFrame.Name = "ChannelTitleFrame"
		ChannelTitleFrame.Parent = ServerFrame
		ChannelTitleFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
		ChannelTitleFrame.BorderSizePixel = 0
		ChannelTitleFrame.Position = UDim2.new(0.294561088, 0, -0.000900391256, 0)
		ChannelTitleFrame.Size = UDim2.new(0, 429, 0, 40)

		Hashtag.Name = "Hashtag"
		Hashtag.Parent = ChannelTitleFrame
		Hashtag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Hashtag.BackgroundTransparency = 1.000
		Hashtag.BorderSizePixel = 0
		Hashtag.Position = UDim2.new(0.0279720277, 0, 0, 0)
		Hashtag.Size = UDim2.new(0, 19, 0, 39)
		Hashtag.Font = Enum.Font.Gotham
		Hashtag.Text = "●"
		Hashtag.TextColor3 = Color3.fromRGB(114, 118, 125)
		Hashtag.TextSize = 25.000

		ChannelTitle.Name = "ChannelTitle"
		ChannelTitle.Parent = ChannelTitleFrame
		ChannelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ChannelTitle.BackgroundTransparency = 1.000
		ChannelTitle.BorderSizePixel = 0
		ChannelTitle.Position = UDim2.new(0.0862470865, 0, 0, 0)
		ChannelTitle.Size = UDim2.new(0, 95, 0, 39)
		ChannelTitle.Font = Enum.Font.GothamSemibold
		ChannelTitle.Text = ""
		ChannelTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		ChannelTitle.TextSize = 15.000
		ChannelTitle.TextXAlignment = Enum.TextXAlignment.Left

		ChannelContentFrame.Name = "ChannelContentFrame"
		ChannelContentFrame.Parent = ServerFrame
		ChannelContentFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
		ChannelContentFrame.BorderSizePixel = 0
		ChannelContentFrame.ClipsDescendants = true
		ChannelContentFrame.Position = UDim2.new(0.294561088, 0, 0.106338218, 0)
		ChannelContentFrame.Size = UDim2.new(0, 429, 0, 333)

		GlowChannel.Name = "GlowChannel"
		GlowChannel.Parent = ChannelContentFrame
		GlowChannel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		GlowChannel.BackgroundTransparency = 1.000
		GlowChannel.BorderSizePixel = 0
		GlowChannel.Position = UDim2.new(0, -33, 0, -91)
		GlowChannel.Size = UDim2.new(1.06396091, 30, 0.228228226, 30)
		GlowChannel.ZIndex = 0
		GlowChannel.Image = "rbxassetid://4996891970"
		GlowChannel.ImageColor3 = Color3.fromRGB(15, 15, 15)
		GlowChannel.ScaleType = Enum.ScaleType.Slice
		GlowChannel.SliceCenter = Rect.new(20, 20, 280, 280)

		ServerChannelHolder.Name = "ServerChannelHolder"
		ServerChannelHolder.Parent = ServerContentFrame
		ServerChannelHolder.Active = true
		ServerChannelHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ServerChannelHolder.BackgroundTransparency = 1.000
		ServerChannelHolder.BorderSizePixel = 0
		ServerChannelHolder.Position = UDim2.new(0.00535549596, 0, 0.0241984241, 0)
		ServerChannelHolder.Selectable = false
		ServerChannelHolder.Size = UDim2.new(0, 179, 0, 278)
		ServerChannelHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
		ServerChannelHolder.ScrollBarThickness = 4
		ServerChannelHolder.ScrollBarImageColor3 = Color3.fromRGB(18, 19, 21)
		ServerChannelHolder.ScrollBarImageTransparency = 1

		ServerChannelHolderLayout.Name = "ServerChannelHolderLayout"
		ServerChannelHolderLayout.Parent = ServerChannelHolder
		ServerChannelHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
		ServerChannelHolderLayout.Padding = UDim.new(0, 4)

		ServerChannelHolderPadding.Name = "ServerChannelHolderPadding"
		ServerChannelHolderPadding.Parent = ServerChannelHolder
		ServerChannelHolderPadding.PaddingLeft = UDim.new(0, 9)

		ServerChannelHolder.MouseEnter:Connect(function()
			ServerChannelHolder.ScrollBarImageTransparency = 0
		end)

		ServerChannelHolder.MouseLeave:Connect(function()
			ServerChannelHolder.ScrollBarImageTransparency = 1
		end)

		Server.MouseEnter:Connect(
			function()
				if currentservertoggled ~= Server.Name then
					TweenService:Create(
						Server,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
					):Play()
					TweenService:Create(
						ServerBtnCorner,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{CornerRadius = UDim.new(0, 15)}
					):Play()
					ServerWhiteFrame:TweenSize(
						UDim2.new(0, 11, 0, 27),
						Enum.EasingDirection.Out,
						Enum.EasingStyle.Quart,
						.3,
						true
					)
				end
			end
		)

		Server.MouseLeave:Connect(
			function()
				if currentservertoggled ~= Server.Name then
					TweenService:Create(
						Server,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(25,25,25)}
					):Play()
					TweenService:Create(
						ServerBtnCorner,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{CornerRadius = UDim.new(1, 0)}
					):Play()
					ServerWhiteFrame:TweenSize(
						UDim2.new(0, 11, 0, 10),
						Enum.EasingDirection.Out,
						Enum.EasingStyle.Quart,
						.3,
						true
					)
				end
			end
		)

		Server.MouseButton1Click:Connect(
			function()
				currentservertoggled = Server.Name
				for i, v in next, ServersHolder:GetChildren() do
					if v.Name == "ServerFrame" then
						v.Visible = false
					end
					ServerFrame.Visible = true
				end
				for i, v in next, ServersHold:GetChildren() do
					if v.ClassName == "TextButton" then
						TweenService:Create(
							v,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(25,25,25)}
						):Play()
						TweenService:Create(
							Server,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(25,25,25)}
						):Play()
						TweenService:Create(
							v.ServerCorner,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{CornerRadius = UDim.new(1, 0)}
						):Play()
						TweenService:Create(
							ServerBtnCorner,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{CornerRadius = UDim.new(0, 15)}
						):Play()
						v.ServerWhiteFrame:TweenSize(
							UDim2.new(0, 11, 0, 10),
							Enum.EasingDirection.Out,
							Enum.EasingStyle.Quart,
							.3,
							true
						)
						ServerWhiteFrame:TweenSize(
							UDim2.new(0, 11, 0, 46),
							Enum.EasingDirection.Out,
							Enum.EasingStyle.Quart,
							.3,
							true
						)
					end
				end
			end
		)

		if fs == false then
			TweenService:Create(
				Server,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(25,25,25)}
			):Play()
			TweenService:Create(
				ServerBtnCorner,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{CornerRadius = UDim.new(0, 15)}
			):Play()
			ServerWhiteFrame:TweenSize(
				UDim2.new(0, 11, 0, 46),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Quart,
				.3,
				true
			)
			ServerFrame.Visible = true
			Server.Name = text .. "Server"
			currentservertoggled = Server.Name
			fs = true
		end
		local ChannelHold = {}
		function ChannelHold:Channel(text)
			local ChannelBtn = Instance.new("TextButton")
			local ChannelBtnCorner = Instance.new("UICorner")
			local ChannelBtnHashtag = Instance.new("TextLabel")
			local ChannelBtnTitle = Instance.new("TextLabel")

			ChannelBtn.Name = text .. "ChannelBtn"
			ChannelBtn.Parent = ServerChannelHolder
			ChannelBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
			ChannelBtn.BorderSizePixel = 0
			ChannelBtn.Position = UDim2.new(0.24118948, 0, 0.578947365, 0)
			ChannelBtn.Size = UDim2.new(0, 160, 0, 30)
			ChannelBtn.AutoButtonColor = false
			ChannelBtn.Font = Enum.Font.SourceSans
			ChannelBtn.Text = ""
			ChannelBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
			ChannelBtn.TextSize = 14.000

			ChannelBtnCorner.CornerRadius = UDim.new(0, 8)
			ChannelBtnCorner.Name = "ChannelBtnCorner"
			ChannelBtnCorner.Parent = ChannelBtn

			ChannelBtnHashtag.Name = "ChannelBtnHashtag"
			ChannelBtnHashtag.Parent = ChannelBtn
			ChannelBtnHashtag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ChannelBtnHashtag.BackgroundTransparency = 1.000
			ChannelBtnHashtag.BorderSizePixel = 0
			ChannelBtnHashtag.Position = UDim2.new(0.08, 0, 0, 0)
			ChannelBtnHashtag.Size = UDim2.new(0, 24, 0, 30)
			ChannelBtnHashtag.Font = Enum.Font.Gotham
			ChannelBtnHashtag.Text = ""
			ChannelBtnHashtag.TextColor3 = Color3.fromRGB(114, 118, 125)
			ChannelBtnHashtag.TextSize = 21.000

			ChannelBtnTitle.Name = "ChannelBtnTitle"
			ChannelBtnTitle.Parent = ChannelBtn
			ChannelBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ChannelBtnTitle.BackgroundTransparency = 1.000
			ChannelBtnTitle.BorderSizePixel = 0
			ChannelBtnTitle.Position = UDim2.new(0.05, 0, -0.166666672, 0)
			ChannelBtnTitle.Size = UDim2.new(0, 95, 0, 39)
			ChannelBtnTitle.Font = Enum.Font.Gotham
			ChannelBtnTitle.Text = text
			ChannelBtnTitle.TextColor3 = Color3.fromRGB(114, 118, 125)
			ChannelBtnTitle.TextSize = 14.000
			ChannelBtnTitle.TextXAlignment = Enum.TextXAlignment.Left
			ServerChannelHolder.CanvasSize = UDim2.new(0, 0, 0, ServerChannelHolderLayout.AbsoluteContentSize.Y)

			local ChannelHolder = Instance.new("ScrollingFrame")
			local ChannelHolderLayout = Instance.new("UIListLayout")

			ChannelHolder.Name = "ChannelHolder"
			ChannelHolder.Parent = ChannelContentFrame
			ChannelHolder.Active = true
			ChannelHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ChannelHolder.BackgroundTransparency = 1.000
			ChannelHolder.BorderSizePixel = 0
			ChannelHolder.Position = UDim2.new(0.0360843192, 0, 0.0241984241, 0)
			ChannelHolder.Size = UDim2.new(0, 412, 0, 314)
			ChannelHolder.ScrollBarThickness = 6
			ChannelHolder.CanvasSize = UDim2.new(0,0,0,0)
			ChannelHolder.ScrollBarImageTransparency = 0
			ChannelHolder.ScrollBarImageColor3 = Color3.fromRGB(86, 217, 252)
			ChannelHolder.Visible = false
			ChannelHolder.ClipsDescendants = false

			ChannelHolderLayout.Name = "ChannelHolderLayout"
			ChannelHolderLayout.Parent = ChannelHolder
			ChannelHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
			ChannelHolderLayout.Padding = UDim.new(0, 8)

			ChannelBtn.MouseEnter:Connect(function()
				if currentchanneltoggled ~= ChannelBtn.Name then
					ChannelBtn.BackgroundColor3 = Color3.fromRGB(10,10,10)
					ChannelBtnTitle.TextColor3 = Color3.fromRGB(220,221,222)
				end
			end)

			ChannelBtn.MouseLeave:Connect(function()
				if currentchanneltoggled ~= ChannelBtn.Name then
					ChannelBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
					ChannelBtnTitle.TextColor3 = Color3.fromRGB(114, 118, 125)
				end
			end)

			ChannelBtn.MouseButton1Click:Connect(function()
				for i, v in next, ChannelContentFrame:GetChildren() do
					if v.Name == "ChannelHolder" then
						v.Visible = false
					end
					ChannelHolder.Visible = true
				end
				for i, v in next, ServerChannelHolder:GetChildren() do
					if v.ClassName == "TextButton" then
						v.BackgroundColor3 = Color3.fromRGB(25,25,25)
						v.ChannelBtnTitle.TextColor3 = Color3.fromRGB(114, 118, 125)
					end
					ServerFrame.Visible = true
				end
				ChannelTitle.Text = text
				ChannelBtn.BackgroundColor3 = Color3.fromRGB(10,10,10)
				ChannelBtnTitle.TextColor3 = Color3.fromRGB(255,255,255)
				currentchanneltoggled = ChannelBtn.Name
			end)

			if fc == false then
				fc = true
				ChannelTitle.Text = text
				ChannelBtn.BackgroundColor3 = Color3.fromRGB(10,10,10)
				ChannelBtnTitle.TextColor3 = Color3.fromRGB(255,255,255)
				currentchanneltoggled = ChannelBtn.Name
				ChannelHolder.Visible = true
			end
			local ChannelContent = {}
			function ChannelContent:Button(text,callback)
				local Button = Instance.new("TextButton")
				local ButtonCorner = Instance.new("UICorner")

				Button.Name = "Button"
				Button.Parent = ChannelHolder
				Button.BackgroundColor3 = Color3.fromRGB(20,20,20)
				Button.Size = UDim2.new(0, 401, 0, 30)
				Button.AutoButtonColor = false
				Button.Font = Enum.Font.Gotham
				Button.TextColor3 = Color3.fromRGB(255, 255, 255)
				Button.TextSize = 14.000
				Button.Text = text

				ButtonCorner.CornerRadius = UDim.new(0, 4)
				ButtonCorner.Name = "ButtonCorner"
				ButtonCorner.Parent = Button

				Button.MouseEnter:Connect(function()
					TweenService:Create(
						Button,
						TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(15,15,15)}
					):Play()
				end)

				Button.MouseButton1Click:Connect(function()
					pcall(callback)
					Button.TextSize = 0
					TweenService:Create(
						Button,
						TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
						{TextSize = 14}
					):Play()
				end)

				Button.MouseLeave:Connect(function()
					TweenService:Create(
						Button,
						TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(20,20,20)}
					):Play()
				end)
				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end
			function ChannelContent:Toggle(text,default,callback)
				local toggled = false
				local Toggle = Instance.new("TextButton")
				local ToggleTitle = Instance.new("TextLabel")
				local ToggleFrame = Instance.new("Frame")
				local ToggleFrameCorner = Instance.new("UICorner")
				local ToggleFrameCircle = Instance.new("Frame")
				local ToggleFrameCircleCorner = Instance.new("UICorner")
				local Icon = Instance.new("ImageLabel")

				Toggle.Name = "Toggle"
				Toggle.Parent = ChannelHolder
				Toggle.BackgroundColor3 = Color3.fromRGB(25,25,25)
				Toggle.BorderSizePixel = 0
				Toggle.Position = UDim2.new(0.261979163, 0, 0.190789461, 0)
				Toggle.Size = UDim2.new(0, 401, 0, 30)
				Toggle.AutoButtonColor = false
				Toggle.Font = Enum.Font.Gotham
				Toggle.Text = ""
				Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
				Toggle.TextSize = 14.000

				ToggleTitle.Name = "ToggleTitle"
				ToggleTitle.Parent = Toggle
				ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleTitle.BackgroundTransparency = 1.000
				ToggleTitle.Position = UDim2.new(0, 5, 0, 0)
				ToggleTitle.Size = UDim2.new(0, 200, 0, 30)
				ToggleTitle.Font = Enum.Font.Gotham
				ToggleTitle.Text = text
				ToggleTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
				ToggleTitle.TextSize = 14.000
				ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

				ToggleFrame.Name = "ToggleFrame"
				ToggleFrame.Parent = Toggle
				ToggleFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
				ToggleFrame.Position = UDim2.new(0.900481343, -5, 0.13300018, 0)
				ToggleFrame.Size = UDim2.new(0, 40, 0, 21)

				ToggleFrameCorner.CornerRadius = UDim.new(0, 4)
				ToggleFrameCorner.Name = "ToggleFrameCorner"
				ToggleFrameCorner.Parent = ToggleFrame

				ToggleFrameCircle.Name = "ToggleFrameCircle"
				ToggleFrameCircle.Parent = ToggleFrame
				ToggleFrameCircle.BackgroundColor3 = Color3.fromRGB(50,50,50)
				ToggleFrameCircle.Position = UDim2.new(0.234999999, -5, 0.133000001, 0)
				ToggleFrameCircle.Size = UDim2.new(0, 15, 0, 15)

				ToggleFrameCircleCorner.CornerRadius = UDim.new(0, 4)
				ToggleFrameCircleCorner.Name = "ToggleFrameCircleCorner"
				ToggleFrameCircleCorner.Parent = ToggleFrameCircle

				Icon.Name = "Icon"
				Icon.Parent = ToggleFrameCircle
				Icon.AnchorPoint = Vector2.new(0.5, 0.5)
				Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Icon.BackgroundTransparency = 1.000
				Icon.BorderColor3 = Color3.fromRGB(255,255,255)
				Icon.Position = UDim2.new(0, 7, 0, 7)
				Icon.Size = UDim2.new(0, 13, 0, 13)
				Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
				Icon.ImageColor3 = Color3.fromRGB(255,255,255)

				Toggle.MouseButton1Click:Connect(function()
					if toggled == false then
						TweenService:Create(Icon,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
						TweenService:Create(ToggleFrame,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(86, 217, 252)}):Play()
						ToggleFrameCircle:TweenPosition(UDim2.new(0.655, -5, 0.133000001, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
						TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
						Icon.Image = "http://www.roblox.com/asset/?id=6023426926"
						wait(.1)
						TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
					else
						TweenService:Create(Icon,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
						TweenService:Create(ToggleFrame,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(10,10,10)}):Play()
						ToggleFrameCircle:TweenPosition(UDim2.new(0.234999999, -5, 0.133000001, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
						TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
						Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
						wait(.01)
						TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
					end
					toggled = not toggled
					pcall(callback, toggled)
				end)
				if default == true then
					toggled = false
					TweenService:Create(Icon,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
					TweenService:Create(ToggleFrame,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(86, 217, 252)}):Play()
					ToggleFrameCircle:TweenPosition(UDim2.new(0.655, -5, 0.133000001, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
					TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
					Icon.Image = "http://www.roblox.com/asset/?id=6023426926"
					wait(.1)
					TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
					toggled = not toggled
					pcall(callback, toggled)
				else
					wait(.1)
				end
				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end

			function ChannelContent:Slider(text, min, max, start, callback)
				local SliderFunc = {}
				local dragging = false
				local Slider = Instance.new("TextButton")
				local SliderTitle = Instance.new("TextLabel")
				local SliderFrame = Instance.new("Frame")
				local SliderFrameCorner = Instance.new("UICorner")
				local CurrentValueFrame = Instance.new("Frame")
				local CurrentValueFrameCorner = Instance.new("UICorner")
				local Zip = Instance.new("Frame")
				local ZipCorner = Instance.new("UICorner")
				local ValueBubble = Instance.new("Frame")
				local ValueBubbleCorner = Instance.new("UICorner")
				local SquareBubble = Instance.new("Frame")
				local GlowBubble = Instance.new("ImageLabel")
				local ValueLabel = Instance.new("TextLabel")


				Slider.Name = "Slider"
				Slider.Parent = ChannelHolder
				Slider.BackgroundColor3 = Color3.fromRGB(25,25,25)
				Slider.BorderSizePixel = 0
				Slider.Position = UDim2.new(0, 0, 0.216560602, 0)
				Slider.Size = UDim2.new(0, 401, 0, 38)
				Slider.AutoButtonColor = false
				Slider.Font = Enum.Font.Gotham
				Slider.Text = ""
				Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
				Slider.TextSize = 14.000

				SliderTitle.Name = "SliderTitle"
				SliderTitle.Parent = Slider
				SliderTitle.BackgroundColor3 = Color3.fromRGB(233, 25, 42)
				SliderTitle.BackgroundTransparency = 1.000
				SliderTitle.Position = UDim2.new(0, 5, 0, -4)
				SliderTitle.Size = UDim2.new(0, 200, 0, 27)
				SliderTitle.Font = Enum.Font.Gotham
				SliderTitle.Text = text
				SliderTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
				SliderTitle.TextSize = 14.000
				SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

				SliderFrame.Name = "SliderFrame"
				SliderFrame.Parent = Slider
				SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				SliderFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
				SliderFrame.Position = UDim2.new(0.497999996, 0, 0.757000029, 0)
				SliderFrame.Size = UDim2.new(0, 385, 0, 8)

				SliderFrameCorner.Name = "SliderFrameCorner"
				SliderFrameCorner.Parent = SliderFrame

				CurrentValueFrame.Name = "CurrentValueFrame"
				CurrentValueFrame.Parent = SliderFrame
				CurrentValueFrame.BackgroundColor3 = Color3.fromRGB(86, 217, 252)
				CurrentValueFrame.Size = UDim2.new((start or 0) / max, 0, 0, 8)

				CurrentValueFrameCorner.Name = "CurrentValueFrameCorner"
				CurrentValueFrameCorner.Parent = CurrentValueFrame

				Zip.Name = "Zip"
				Zip.Parent = SliderFrame
				Zip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Zip.Position = UDim2.new((start or 0)/max, -6,-0.644999981, 0)
				Zip.Size = UDim2.new(0, 10, 0, 18)
				ZipCorner.CornerRadius = UDim.new(0, 3)
				ZipCorner.Name = "ZipCorner"
				ZipCorner.Parent = Zip

				ValueBubble.Name = "ValueBubble"
				ValueBubble.Parent = Zip
				ValueBubble.AnchorPoint = Vector2.new(0.5, 0.5)
				ValueBubble.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
				ValueBubble.Position = UDim2.new(0.5, 0, -1.00800002, 0)
				ValueBubble.Size = UDim2.new(0, 36, 0, 21)
				ValueBubble.Visible = false


				Zip.MouseEnter:Connect(function()
					if dragging == false then
						ValueBubble.Visible = true
					end
				end)

				Zip.MouseLeave:Connect(function()
					if dragging == false then
						ValueBubble.Visible = false
					end
				end)


				ValueBubbleCorner.CornerRadius = UDim.new(0, 3)
				ValueBubbleCorner.Name = "ValueBubbleCorner"
				ValueBubbleCorner.Parent = ValueBubble

				SquareBubble.Name = "SquareBubble"
				SquareBubble.Parent = ValueBubble
				SquareBubble.AnchorPoint = Vector2.new(0.5, 0.5)
				SquareBubble.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
				SquareBubble.BorderSizePixel = 0
				SquareBubble.Position = UDim2.new(0.493000001, 0, 0.637999971, 0)
				SquareBubble.Rotation = 45.000
				SquareBubble.Size = UDim2.new(0, 19, 0, 19)

				GlowBubble.Name = "GlowBubble"
				GlowBubble.Parent = ValueBubble
				GlowBubble.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				GlowBubble.BackgroundTransparency = 1.000
				GlowBubble.BorderSizePixel = 0
				GlowBubble.Position = UDim2.new(0, -15, 0, -15)
				GlowBubble.Size = UDim2.new(1, 30, 1, 30)
				GlowBubble.ZIndex = 0
				GlowBubble.Image = "rbxassetid://4996891970"
				GlowBubble.ImageColor3 = Color3.fromRGB(15, 15, 15)
				GlowBubble.ScaleType = Enum.ScaleType.Slice
				GlowBubble.SliceCenter = Rect.new(20, 20, 280, 280)

				ValueLabel.Name = "ValueLabel"
				ValueLabel.Parent = ValueBubble
				ValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ValueLabel.BackgroundTransparency = 1.000
				ValueLabel.Size = UDim2.new(0, 36, 0, 21)
				ValueLabel.Font = Enum.Font.Gotham
				ValueLabel.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
				ValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				ValueLabel.TextSize = 10.000
				local function move(input)
					local pos =
						UDim2.new(
							math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
							-6,
							-0.644999981,
							0
						)
					local pos1 =
						UDim2.new(
							math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
							0,
							0,
							8
						)
					CurrentValueFrame.Size = pos1
					Zip.Position = pos
					local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
					ValueLabel.Text = tostring(value)
					pcall(callback, value)
				end
				Zip.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true
							ValueBubble.Visible = true
						end
					end
				)
				Zip.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false
							ValueBubble.Visible = false
						end
					end
				)
				game:GetService("UserInputService").InputChanged:Connect(
				function(input)
					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
						move(input)
					end
				end
				)

				function SliderFunc:Change(tochange)
					CurrentValueFrame.Size = UDim2.new((tochange or 0) / max, 0, 0, 8)
					Zip.Position = UDim2.new((tochange or 0)/max, -6,-0.644999981, 0)
					ValueLabel.Text = tostring(tochange and math.floor((tochange / max) * (max - min) + min) or 0)
					pcall(callback, tochange)
				end

				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
				return SliderFunc
			end
			function ChannelContent:Line()
				local Seperator1 = Instance.new("Frame")
				local Seperator2 = Instance.new("Frame")

				Seperator1.Name = "Seperator1"
				Seperator1.Parent = ChannelHolder
				Seperator1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Seperator1.BackgroundTransparency = 1.000
				Seperator1.Position = UDim2.new(0, 0, 0.350318581, 0)
				Seperator1.Size = UDim2.new(0, 100, 0, 8)

				Seperator2.Name = "Seperator2"
				Seperator2.Parent = Seperator1
				Seperator2.BackgroundColor3 = Color3.fromRGB(66, 69, 74)
				Seperator2.BorderSizePixel = 0
				Seperator2.Position = UDim2.new(0, 0, 0, 4)
				Seperator2.Size = UDim2.new(0, 401, 0, 1)
				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end
			function ChannelContent:Dropdown(text, list, callback)
				local DropFunc = {}
				local itemcount = 0
				local framesize = 0
				local DropTog = false
				local Dropdown = Instance.new("Frame")
				local DropdownTitle = Instance.new("TextLabel")
				local DropdownFrameOutline = Instance.new("Frame")
				local DropdownFrameOutlineCorner = Instance.new("UICorner")
				local DropdownFrame = Instance.new("Frame")
				local DropdownFrameCorner = Instance.new("UICorner")
				local CurrentSelectedText = Instance.new("TextLabel")
				local ArrowImg = Instance.new("ImageLabel")
				local DropdownFrameBtn = Instance.new("TextButton")

				Dropdown.Name = "Dropdown"
				Dropdown.Parent = ChannelHolder
				Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Dropdown.BackgroundTransparency = 1.000
				Dropdown.Position = UDim2.new(0.0796874985, 0, 0.445175439, 0)
				Dropdown.Size = UDim2.new(0, 403, 0, 73)

				DropdownTitle.Name = "DropdownTitle"
				DropdownTitle.Parent = Dropdown
				DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownTitle.BackgroundTransparency = 1.000
				DropdownTitle.Position = UDim2.new(0, 5, 0, 0)
				DropdownTitle.Size = UDim2.new(0, 200, 0, 29)
				DropdownTitle.Font = Enum.Font.Gotham
				DropdownTitle.Text = text
				DropdownTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
				DropdownTitle.TextSize = 14.000
				DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left

				DropdownFrameOutline.Name = "DropdownFrameOutline"
				DropdownFrameOutline.Parent = DropdownTitle
				DropdownFrameOutline.AnchorPoint = Vector2.new(0.5, 0.5)
				DropdownFrameOutline.BackgroundColor3 = Color3.fromRGB(15,15,15)
				DropdownFrameOutline.Position = UDim2.new(0.988442957, 0, 1.6197437, 0)
				DropdownFrameOutline.Size = UDim2.new(0, 396, 0, 36)

				DropdownFrameOutlineCorner.CornerRadius = UDim.new(0, 3)
				DropdownFrameOutlineCorner.Name = "DropdownFrameOutlineCorner"
				DropdownFrameOutlineCorner.Parent = DropdownFrameOutline

				DropdownFrame.Name = "DropdownFrame"
				DropdownFrame.Parent = DropdownTitle
				DropdownFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
				DropdownFrame.ClipsDescendants = true
				DropdownFrame.Position = UDim2.new(0.00999999978, 0, 1.06638527, 0)
				DropdownFrame.Selectable = true
				DropdownFrame.Size = UDim2.new(0, 392, 0, 32)

				DropdownFrameCorner.CornerRadius = UDim.new(0, 4)
				DropdownFrameCorner.Name = "DropdownFrameCorner"
				DropdownFrameCorner.Parent = DropdownFrame

				CurrentSelectedText.Name = "CurrentSelectedText"
				CurrentSelectedText.Parent = DropdownFrame
				CurrentSelectedText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				CurrentSelectedText.BackgroundTransparency = 1.000
				CurrentSelectedText.Position = UDim2.new(0.0178571437, 0, 0, 0)
				CurrentSelectedText.Size = UDim2.new(0, 193, 0, 32)
				CurrentSelectedText.Font = Enum.Font.Gotham
				CurrentSelectedText.Text = "..."
				CurrentSelectedText.TextColor3 = Color3.fromRGB(212, 212, 212)
				CurrentSelectedText.TextSize = 14.000
				CurrentSelectedText.TextXAlignment = Enum.TextXAlignment.Left

				ArrowImg.Name = "ArrowImg"
				ArrowImg.Parent = CurrentSelectedText
				ArrowImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ArrowImg.BackgroundTransparency = 1.000
				ArrowImg.Position = UDim2.new(1.84974098, 0, 0.167428851, 0)
				ArrowImg.Size = UDim2.new(0, 22, 0, 22)
				ArrowImg.Image = "http://www.roblox.com/asset/?id=6034818372"
				ArrowImg.ImageColor3 = Color3.fromRGB(212, 212, 212)

				DropdownFrameBtn.Name = "DropdownFrameBtn"
				DropdownFrameBtn.Parent = DropdownFrame
				DropdownFrameBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownFrameBtn.BackgroundTransparency = 1.000
				DropdownFrameBtn.Size = UDim2.new(0, 392, 0, 32)
				DropdownFrameBtn.Font = Enum.Font.SourceSans
				DropdownFrameBtn.Text = ""
				DropdownFrameBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
				DropdownFrameBtn.TextSize = 14.000

				local DropdownFrameMainOutline = Instance.new("Frame")
				local DropdownFrameMainOutlineCorner = Instance.new("UICorner")
				local DropdownFrameMain = Instance.new("Frame")
				local DropdownFrameMainCorner = Instance.new("UICorner")
				local DropItemHolderLabel = Instance.new("TextLabel")
				local DropItemHolder = Instance.new("ScrollingFrame")
				local DropItemHolderLayout = Instance.new("UIListLayout")

				DropdownFrameMainOutline.Name = "DropdownFrameMainOutline"
				DropdownFrameMainOutline.Parent = DropdownTitle
				DropdownFrameMainOutline.BackgroundColor3 = Color3.fromRGB(15,15,15)
				DropdownFrameMainOutline.Position = UDim2.new(-0.00155700743, 0, 2.16983342, 0)
				DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, 81)
				DropdownFrameMainOutline.Visible = false

				DropdownFrameMainOutlineCorner.CornerRadius = UDim.new(0, 3)
				DropdownFrameMainOutlineCorner.Name = "DropdownFrameMainOutlineCorner"
				DropdownFrameMainOutlineCorner.Parent = DropdownFrameMainOutline

				DropdownFrameMain.Name = "DropdownFrameMain"
				DropdownFrameMain.Parent = DropdownTitle
				DropdownFrameMain.BackgroundColor3 = Color3.fromRGB(25,25,25)
				DropdownFrameMain.ClipsDescendants = true
				DropdownFrameMain.Position = UDim2.new(0.00999999978, 0, 2.2568965, 0)
				DropdownFrameMain.Selectable = true
				DropdownFrameMain.Size = UDim2.new(0, 392, 0, 77)
				DropdownFrameMain.Visible = false

				DropdownFrameMainCorner.CornerRadius = UDim.new(0, 4)
				DropdownFrameMainCorner.Name = "DropdownFrameMainCorner"
				DropdownFrameMainCorner.Parent = DropdownFrameMain

				DropItemHolderLabel.Name = "ItemHolderLabel"
				DropItemHolderLabel.Parent = DropdownFrameMain
				DropItemHolderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropItemHolderLabel.BackgroundTransparency = 1.000
				DropItemHolderLabel.Position = UDim2.new(0.0178571437, 0, 0, 0)
				DropItemHolderLabel.Size = UDim2.new(0, 193, 0, 13)
				DropItemHolderLabel.Font = Enum.Font.Gotham
				DropItemHolderLabel.Text = ""
				DropItemHolderLabel.TextColor3 = Color3.fromRGB(212, 212, 212)
				DropItemHolderLabel.TextSize = 14.000
				DropItemHolderLabel.TextXAlignment = Enum.TextXAlignment.Left

				DropItemHolder.Name = "ItemHolder"
				DropItemHolder.Parent = DropItemHolderLabel
				DropItemHolder.Active = true
				DropItemHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropItemHolder.BackgroundTransparency = 1.000
				DropItemHolder.Position = UDim2.new(0, 0, 0.215384638, 0)
				DropItemHolder.Size = UDim2.new(0, 385, 0, 0)
				DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
				DropItemHolder.ScrollBarThickness = 4
				DropItemHolder.BorderSizePixel = 0
				DropItemHolder.ScrollBarImageColor3 = Color3.fromRGB(233, 25, 42)

				DropItemHolderLayout.Name = "ItemHolderLayout"
				DropItemHolderLayout.Parent = DropItemHolder
				DropItemHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
				DropItemHolderLayout.Padding = UDim.new(0, 0)

				DropdownFrameBtn.MouseButton1Click:Connect(function()
					if DropTog == false then
						DropdownFrameMain.Visible = true
						DropdownFrameMainOutline.Visible = true
						Dropdown.Size = UDim2.new(0, 403, 0, 73 + DropdownFrameMainOutline.AbsoluteSize.Y)
						ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)

					else
						Dropdown.Size = UDim2.new(0, 403, 0, 73)
						DropdownFrameMain.Visible = false
						DropdownFrameMainOutline.Visible = false
						ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
					end
					DropTog = not DropTog
				end)


				for i,v in next, list do
					itemcount = itemcount + 1

					if itemcount == 1 then
						framesize = 29
					elseif itemcount == 2 then
						framesize = 58
					elseif itemcount >= 3 then
						framesize = 87
					end

					local Item = Instance.new("TextButton")
					local ItemCorner = Instance.new("UICorner")
					local ItemText = Instance.new("TextLabel")

					Item.Name = "Item"
					Item.Parent = DropItemHolder
					Item.BackgroundColor3 = Color3.fromRGB(10,10,10)
					Item.Size = UDim2.new(0, 379, 0, 29)
					Item.AutoButtonColor = false
					Item.Font = Enum.Font.SourceSans
					Item.Text = ""
					Item.TextColor3 = Color3.fromRGB(0, 0, 0)
					Item.TextSize = 14.000
					Item.BackgroundTransparency = 1

					ItemCorner.CornerRadius = UDim.new(0, 4)
					ItemCorner.Name = "ItemCorner"
					ItemCorner.Parent = Item

					ItemText.Name = "ItemText"
					ItemText.Parent = Item
					ItemText.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
					ItemText.BackgroundTransparency = 1.000
					ItemText.Position = UDim2.new(0.0211081803, 0, 0, 0)
					ItemText.Size = UDim2.new(0, 192, 0, 29)
					ItemText.Font = Enum.Font.Gotham
					ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
					ItemText.TextSize = 14.000
					ItemText.TextXAlignment = Enum.TextXAlignment.Left
					ItemText.Text = v

					Item.MouseEnter:Connect(function()
						ItemText.TextColor3 = Color3.fromRGB(255,255,255)
						Item.BackgroundTransparency = 0
					end)

					Item.MouseLeave:Connect(function()
						ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
						Item.BackgroundTransparency = 1
					end)

					Item.MouseButton1Click:Connect(function()
						CurrentSelectedText.Text = v
						pcall(callback, v)
						Dropdown.Size = UDim2.new(0, 403, 0, 73)
						DropdownFrameMain.Visible = false
						DropdownFrameMainOutline.Visible = false
						ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
						DropTog = not DropTog
					end)

					DropItemHolder.CanvasSize = UDim2.new(0,0,0,DropItemHolderLayout.AbsoluteContentSize.Y)

					DropItemHolder.Size = UDim2.new(0, 385, 0, framesize)
					DropdownFrameMain.Size = UDim2.new(0, 392, 0, framesize + 6)
					DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, framesize + 10)
				end

				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)

				function DropFunc:Clear()
					for i,v in next, DropItemHolder:GetChildren() do
						if v.Name == "Item" then
							v:Destroy()
						end
					end

					CurrentSelectedText.Text = "..."

					itemcount = 0
					framesize = 0
					DropItemHolder.Size = UDim2.new(0, 385, 0, 0)
					DropdownFrameMain.Size = UDim2.new(0, 392, 0, 0)
					DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, 0)
					Dropdown.Size = UDim2.new(0, 403, 0, 73)
					DropdownFrameMain.Visible = false
					DropdownFrameMainOutline.Visible = false
					ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
				end

				function DropFunc:Add(textadd)
					itemcount = itemcount + 1

					if itemcount == 1 then
						framesize = 29
					elseif itemcount == 2 then
						framesize = 58
					elseif itemcount >= 3 then
						framesize = 87
					end

					local Item = Instance.new("TextButton")
					local ItemCorner = Instance.new("UICorner")
					local ItemText = Instance.new("TextLabel")

					Item.Name = "Item"
					Item.Parent = DropItemHolder
					Item.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
					Item.Size = UDim2.new(0, 379, 0, 29)
					Item.AutoButtonColor = false
					Item.Font = Enum.Font.SourceSans
					Item.Text = ""
					Item.TextColor3 = Color3.fromRGB(0, 0, 0)
					Item.TextSize = 14.000
					Item.BackgroundTransparency = 1

					ItemCorner.CornerRadius = UDim.new(0, 4)
					ItemCorner.Name = "ItemCorner"
					ItemCorner.Parent = Item

					ItemText.Name = "ItemText"
					ItemText.Parent = Item
					ItemText.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
					ItemText.BackgroundTransparency = 1.000
					ItemText.Position = UDim2.new(0.0211081803, 0, 0, 0)
					ItemText.Size = UDim2.new(0, 192, 0, 29)
					ItemText.Font = Enum.Font.Gotham
					ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
					ItemText.TextSize = 14.000
					ItemText.TextXAlignment = Enum.TextXAlignment.Left
					ItemText.Text = textadd

					Item.MouseEnter:Connect(function()
						ItemText.TextColor3 = Color3.fromRGB(255,255,255)
						Item.BackgroundTransparency = 0
					end)

					Item.MouseLeave:Connect(function()
						ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
						Item.BackgroundTransparency = 1
					end)

					Item.MouseButton1Click:Connect(function()
						CurrentSelectedText.Text = textadd
						pcall(callback, textadd)
						Dropdown.Size = UDim2.new(0, 403, 0, 73)
						DropdownFrameMain.Visible = false
						DropdownFrameMainOutline.Visible = false
						ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
						DropTog = not DropTog
					end)

					DropItemHolder.CanvasSize = UDim2.new(0,0,0,DropItemHolderLayout.AbsoluteContentSize.Y)

					DropItemHolder.Size = UDim2.new(0, 385, 0, framesize)
					DropdownFrameMain.Size = UDim2.new(0, 392, 0, framesize + 6)
					DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, framesize + 10)
				end
				return DropFunc
			end
			function ChannelContent:Colorpicker(text, preset, callback)
				local OldToggleColor = Color3.fromRGB(0, 0, 0)
				local OldColor = Color3.fromRGB(0, 0, 0)
				local OldColorSelectionPosition = nil
				local OldHueSelectionPosition = nil
				local ColorH, ColorS, ColorV = 1, 1, 1
				local RainbowColorPicker = false
				local ColorPickerInput = nil
				local ColorInput = nil
				local HueInput = nil

				local Colorpicker = Instance.new("Frame")
				local ColorpickerTitle = Instance.new("TextLabel")
				local ColorpickerFrameOutline = Instance.new("Frame")
				local ColorpickerFrameOutlineCorner = Instance.new("UICorner")
				local ColorpickerFrame = Instance.new("Frame")
				local ColorpickerFrameCorner = Instance.new("UICorner")
				local Color = Instance.new("ImageLabel")
				local ColorCorner = Instance.new("UICorner")
				local ColorSelection = Instance.new("ImageLabel")
				local Hue = Instance.new("ImageLabel")
				local HueCorner = Instance.new("UICorner")
				local HueGradient = Instance.new("UIGradient")
				local HueSelection = Instance.new("ImageLabel")
				local PresetClr = Instance.new("Frame")
				local PresetClrCorner = Instance.new("UICorner")

				Colorpicker.Name = "Colorpicker"
				Colorpicker.Parent = ChannelHolder
				Colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Colorpicker.BackgroundTransparency = 1.000
				Colorpicker.Position = UDim2.new(0.0895741582, 0, 0.474232763, 0)
				Colorpicker.Size = UDim2.new(0, 403, 0, 175)

				ColorpickerTitle.Name = "ColorpickerTitle"
				ColorpickerTitle.Parent = Colorpicker
				ColorpickerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorpickerTitle.BackgroundTransparency = 1.000
				ColorpickerTitle.Position = UDim2.new(0, 5, 0, 0)
				ColorpickerTitle.Size = UDim2.new(0, 200, 0, 29)
				ColorpickerTitle.Font = Enum.Font.Gotham
				ColorpickerTitle.Text = "Colorpicker"
				ColorpickerTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
				ColorpickerTitle.TextSize = 14.000
				ColorpickerTitle.TextXAlignment = Enum.TextXAlignment.Left

				ColorpickerFrameOutline.Name = "ColorpickerFrameOutline"
				ColorpickerFrameOutline.Parent = ColorpickerTitle
				ColorpickerFrameOutline.BackgroundColor3 = Color3.fromRGB(37, 40, 43)
				ColorpickerFrameOutline.Position = UDim2.new(-0.00100000005, 0, 0.991999984, 0)
				ColorpickerFrameOutline.Size = UDim2.new(0, 238, 0, 139)

				ColorpickerFrameOutlineCorner.CornerRadius = UDim.new(0, 3)
				ColorpickerFrameOutlineCorner.Name = "ColorpickerFrameOutlineCorner"

				ColorpickerFrameOutlineCorner.Parent = ColorpickerFrameOutline

				ColorpickerFrame.Name = "ColorpickerFrame"
				ColorpickerFrame.Parent = ColorpickerTitle
				ColorpickerFrame.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
				ColorpickerFrame.ClipsDescendants = true
				ColorpickerFrame.Position = UDim2.new(0.00999999978, 0, 1.06638515, 0)
				ColorpickerFrame.Selectable = true
				ColorpickerFrame.Size = UDim2.new(0, 234, 0, 135)

				ColorpickerFrameCorner.CornerRadius = UDim.new(0, 3)
				ColorpickerFrameCorner.Name = "ColorpickerFrameCorner"
				ColorpickerFrameCorner.Parent = ColorpickerFrame

				Color.Name = "Color"
				Color.Parent = ColorpickerFrame
				Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
				Color.Position = UDim2.new(0, 10, 0, 10)
				Color.Size = UDim2.new(0, 154, 0, 118)
				Color.ZIndex = 10
				Color.Image = "rbxassetid://4155801252"

				ColorCorner.CornerRadius = UDim.new(0, 3)
				ColorCorner.Name = "ColorCorner"
				ColorCorner.Parent = Color

				ColorSelection.Name = "ColorSelection"
				ColorSelection.Parent = Color
				ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorSelection.BackgroundTransparency = 1.000
				ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
				ColorSelection.Size = UDim2.new(0, 18, 0, 18)
				ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
				ColorSelection.ScaleType = Enum.ScaleType.Fit

				Hue.Name = "Hue"
				Hue.Parent = ColorpickerFrame
				Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Hue.Position = UDim2.new(0, 171, 0, 10)
				Hue.Size = UDim2.new(0, 18, 0, 118)

				HueCorner.CornerRadius = UDim.new(0, 3)
				HueCorner.Name = "HueCorner"
				HueCorner.Parent = Hue

				HueGradient.Color = ColorSequence.new {
					ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
					ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
					ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
					ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
					ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
					ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
					ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
				}
				HueGradient.Rotation = 270
				HueGradient.Name = "HueGradient"
				HueGradient.Parent = Hue

				HueSelection.Name = "HueSelection"
				HueSelection.Parent = Hue
				HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				HueSelection.BackgroundTransparency = 1.000
				HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
				HueSelection.Size = UDim2.new(0, 18, 0, 18)
				HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"

				PresetClr.Name = "PresetClr"
				PresetClr.Parent = ColorpickerFrame
				PresetClr.BackgroundColor3 = preset
				PresetClr.Position = UDim2.new(0.846153855, 0, 0.0740740746, 0)
				PresetClr.Size = UDim2.new(0, 25, 0, 25)

				PresetClrCorner.CornerRadius = UDim.new(0, 3)
				PresetClrCorner.Name = "PresetClrCorner"
				PresetClrCorner.Parent = PresetClr

				local function UpdateColorPicker(nope)
					PresetClr.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
					Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

					pcall(callback, PresetClr.BackgroundColor3)
				end

				ColorH =
					1 -
					(math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
						Hue.AbsoluteSize.Y)
				ColorS =
					(math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
						Color.AbsoluteSize.X)
				ColorV =
					1 -
					(math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
						Color.AbsoluteSize.Y)

				PresetClr.BackgroundColor3 = preset
				Color.BackgroundColor3 = preset
				pcall(callback, PresetClr.BackgroundColor3)

				Color.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then

							if ColorInput then
								ColorInput:Disconnect()
							end

							ColorInput =
								RunService.RenderStepped:Connect(
									function()
									local ColorX =
										(math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
											Color.AbsoluteSize.X)
									local ColorY =
										(math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
											Color.AbsoluteSize.Y)

									ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
									ColorS = ColorX
									ColorV = 1 - ColorY

									UpdateColorPicker(true)
								end
								)
						end
					end
				)

				Color.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if ColorInput then
								ColorInput:Disconnect()
							end
						end
					end
				)

				Hue.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then


							if HueInput then
								HueInput:Disconnect()
							end

							HueInput =
								RunService.RenderStepped:Connect(
									function()
									local HueY =
										(math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
											Hue.AbsoluteSize.Y)

									HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
									ColorH = 1 - HueY

									UpdateColorPicker(true)
								end
								)
						end
					end
				)

				Hue.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if HueInput then
								HueInput:Disconnect()
							end
						end
					end
				)

				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end

			function ChannelContent:Textbox(text, placetext, disapper, callback)
				local Textbox = Instance.new("Frame")
				local TextboxTitle = Instance.new("TextLabel")
				local TextboxFrameOutline = Instance.new("Frame")
				local TextboxFrameOutlineCorner = Instance.new("UICorner")
				local TextboxFrame = Instance.new("Frame")
				local TextboxFrameCorner = Instance.new("UICorner")
				local TextBox = Instance.new("TextBox")

				Textbox.Name = "Textbox"
				Textbox.Parent = ChannelHolder
				Textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Textbox.BackgroundTransparency = 1.000
				Textbox.Position = UDim2.new(0.0796874985, 0, 0.445175439, 0)
				Textbox.Size = UDim2.new(0, 403, 0, 73)

				TextboxTitle.Name = "TextboxTitle"
				TextboxTitle.Parent = Textbox
				TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextboxTitle.BackgroundTransparency = 1.000
				TextboxTitle.Position = UDim2.new(0, 5, 0, 0)
				TextboxTitle.Size = UDim2.new(0, 200, 0, 29)
				TextboxTitle.Font = Enum.Font.Gotham
				TextboxTitle.Text = text
				TextboxTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
				TextboxTitle.TextSize = 14.000
				TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left

				TextboxFrameOutline.Name = "TextboxFrameOutline"
				TextboxFrameOutline.Parent = TextboxTitle
				TextboxFrameOutline.AnchorPoint = Vector2.new(0.5, 0.5)
				TextboxFrameOutline.BackgroundColor3 = Color3.fromRGB(15,15,15)
				TextboxFrameOutline.Position = UDim2.new(0.988442957, 0, 1.6197437, 0)
				TextboxFrameOutline.Size = UDim2.new(0, 396, 0, 36)

				TextboxFrameOutlineCorner.CornerRadius = UDim.new(0, 3)
				TextboxFrameOutlineCorner.Name = "TextboxFrameOutlineCorner"
				TextboxFrameOutlineCorner.Parent = TextboxFrameOutline

				TextboxFrame.Name = "TextboxFrame"
				TextboxFrame.Parent = TextboxTitle
				TextboxFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
				TextboxFrame.ClipsDescendants = true
				TextboxFrame.Position = UDim2.new(0.00999999978, 0, 1.06638527, 0)
				TextboxFrame.Selectable = true
				TextboxFrame.Size = UDim2.new(0, 392, 0, 32)

				TextboxFrameCorner.CornerRadius = UDim.new(0, 4)
				TextboxFrameCorner.Name = "TextboxFrameCorner"
				TextboxFrameCorner.Parent = TextboxFrame

				TextBox.Parent = TextboxFrame
				TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.BackgroundTransparency = 1.000
				TextBox.Position = UDim2.new(0.0178571437, 0, 0, 0)
				TextBox.Size = UDim2.new(0, 377, 0, 32)
				TextBox.Font = Enum.Font.Gotham
				TextBox.PlaceholderColor3 = Color3.fromRGB(255,255,255)
				TextBox.PlaceholderText = placetext
				TextBox.Text = ""
				TextBox.TextColor3 = Color3.fromRGB(193, 195, 197)
				TextBox.TextSize = 14.000
				TextBox.TextXAlignment = Enum.TextXAlignment.Left

				TextBox.Focused:Connect(function()
					TweenService:Create(
						TextboxFrameOutline,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(255, 170, 0)}
					):Play()
				end)

				TextBox.FocusLost:Connect(function(ep)
					TweenService:Create(
						TextboxFrameOutline,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(15,15,15)}
					):Play()
					if ep then
						if #TextBox.Text > 0 then
							pcall(callback, TextBox.Text)
							if disapper then
								TextBox.Text = ""
							end
						end
					end
				end)

				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end

			function ChannelContent:Label(text)
				local Label = Instance.new("TextButton")
				local LabelTitle = Instance.new("TextLabel")
				local labelfunc = {}

				Label.Name = "Label"
				Label.Parent = ChannelHolder
				Label.BackgroundColor3 = Color3.fromRGB(25,25,25)
				Label.BorderSizePixel = 0
				Label.Position = UDim2.new(0.261979163, 0, 0.190789461, 0)
				Label.Size = UDim2.new(0, 401, 0, 30)
				Label.AutoButtonColor = false
				Label.Font = Enum.Font.Gotham
				Label.Text = ""
				Label.TextColor3 = Color3.fromRGB(255, 255, 255)
				Label.TextSize = 14.000

				LabelTitle.Name = "LabelTitle"
				LabelTitle.Parent = Label
				LabelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LabelTitle.BackgroundTransparency = 1.000
				LabelTitle.Position = UDim2.new(0, 5, 0, 0)
				LabelTitle.Size = UDim2.new(0, 200, 0, 30)
				LabelTitle.Font = Enum.Font.Gotham
				LabelTitle.Text = text
				LabelTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
				LabelTitle.TextSize = 14.000
				LabelTitle.TextXAlignment = Enum.TextXAlignment.Left

				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
				function labelfunc:Refresh(tochange)
					Label.Text = tochange
				end

				return labelfunc
			end

			function ChannelContent:Bind(text, presetbind, callback)
				local Key = presetbind.Name
				local Keybind = Instance.new("TextButton")
				local KeybindTitle = Instance.new("TextLabel")
				local KeybindText = Instance.new("TextLabel")

				Keybind.Name = "Keybind"
				Keybind.Parent = ChannelHolder
				Keybind.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
				Keybind.BorderSizePixel = 0
				Keybind.Position = UDim2.new(0.261979163, 0, 0.190789461, 0)
				Keybind.Size = UDim2.new(0, 401, 0, 30)
				Keybind.AutoButtonColor = false
				Keybind.Font = Enum.Font.Gotham
				Keybind.Text = ""
				Keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
				Keybind.TextSize = 14.000

				KeybindTitle.Name = "KeybindTitle"
				KeybindTitle.Parent = Keybind
				KeybindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				KeybindTitle.BackgroundTransparency = 1.000
				KeybindTitle.Position = UDim2.new(0, 5, 0, 0)
				KeybindTitle.Size = UDim2.new(0, 200, 0, 30)
				KeybindTitle.Font = Enum.Font.Gotham
				KeybindTitle.Text = text
				KeybindTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
				KeybindTitle.TextSize = 14.000
				KeybindTitle.TextXAlignment = Enum.TextXAlignment.Left

				KeybindText.Name = "KeybindText"
				KeybindText.Parent = Keybind
				KeybindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				KeybindText.BackgroundTransparency = 1.000
				KeybindText.Position = UDim2.new(0, 316, 0, 0)
				KeybindText.Size = UDim2.new(0, 85, 0, 30)
				KeybindText.Font = Enum.Font.Gotham
				KeybindText.Text = presetbind.Name
				KeybindText.TextColor3 = Color3.fromRGB(127, 131, 137)
				KeybindText.TextSize = 14.000
				KeybindText.TextXAlignment = Enum.TextXAlignment.Right

				Keybind.MouseButton1Click:Connect(function()
					KeybindText.Text = "..."
					local inputwait = game:GetService("UserInputService").InputBegan:wait()
					if inputwait.KeyCode.Name ~= "Unknown" then
						KeybindText.Text = inputwait.KeyCode.Name
						Key = inputwait.KeyCode.Name
					end
				end)

				game:GetService("UserInputService").InputBegan:connect(function(current, pressed)
					if not pressed then
						if current.KeyCode.Name == Key then
							pcall(callback)
						end
					end
				end)
				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end

			return ChannelContent
		end

		return ChannelHold
	end
	return ServerHold
end
local RadientPaid = RadientPaid:Window("Blox Fruit (UPDATE 17)")
local server = RadientPaid:Server("Secret HUB", "", "")
local main = server:Channel("Main")
local placeId = game.PlaceId
if placeId == 2753915549 then
	world1 = true
elseif placeId == 4442272183 then
	world2 = true
elseif placeId == 7449423635 then
	world3 = true
end

FM = false
sky = false

function cq()
    if world1 then
        local MyLevel = game.Players.LocalPlayer.Data.Level.Value
		Dis = 300
		if MyLevel == 1 or MyLevel <= 9 then -- Bandit
            magbring = 400
			Ms = "Bandit [Lv. 5]"
			NaemQuest = "BanditQuest1"
			LevelQuest = 1
			NameMon = "Bandit"
			CFrameQuest = CFrame.new(1061.66699, 16.5166187, 1544.52905, -0.942978859, -3.33851502e-09, 0.332852632, 7.04340497e-09, 1, 2.99841325e-08, -0.332852632, 3.06188177e-08, -0.942978859)
			CFrameMon = CFrame.new(1199.31287, 52.2717781, 1536.91516, -0.929782331, 6.60215846e-08, -0.368109822, 3.9077392e-08, 1, 8.06501603e-08, 0.368109822, 6.06023249e-08, -0.929782331)
		elseif MyLevel == 10 or MyLevel <= 14 then -- Monkey
            magbring = 400
			Ms = "Monkey [Lv. 14]"
			NaemQuest = "JungleQuest"
			LevelQuest = 1
			NameMon = "Monkey"
			CFrameQuest = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
			CFrameMon = CFrame.new(-1502.74609, 98.5633316, 90.6417007, 0.836947978, 0, 0.547282517, -0, 1, -0, -0.547282517, 0, 0.836947978)
		elseif MyLevel == 15 or MyLevel <= 29 then -- Gorilla
            magbring = 240
			Ms = "Gorilla [Lv. 20]"
			NaemQuest = "JungleQuest"
			LevelQuest = 2
			NameMon = "Gorilla"
			CFrameQuest = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
			CFrameMon = CFrame.new(-1223.52808, 6.27936459, -502.292664, 0.310949147, -5.66602516e-08, 0.950426519, -3.37275488e-08, 1, 7.06501808e-08, -0.950426519, -5.40241736e-08, 0.310949147)
		elseif MyLevel == 30 or MyLevel <= 39 then -- Pirate
			Dis = 150
			Ms = "Pirate [Lv. 35]"
			NaemQuest = "BuggyQuest1"
			LevelQuest = 1
			NameMon = "Pirate"
			CFrameQuest = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
			CFrameMon = CFrame.new(-1219.32324, 4.75205183, 3915.63452, -0.966492832, -6.91238853e-08, 0.25669381, -5.21195496e-08, 1, 7.3047012e-08, -0.25669381, 5.72206496e-08, -0.966492832)
		elseif MyLevel == 40 or MyLevel <= 59 then -- Brute
			Dis = 150
			Ms = "Brute [Lv. 45]"
			NaemQuest = "BuggyQuest1"
			LevelQuest = 2
			NameMon = "Brute"
			CFrameQuest = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
			CFrameMon = CFrame.new(-1146.49646, 96.0936813, 4312.1333, -0.978175163, -1.53222057e-08, 0.207781896, -3.33316912e-08, 1, -8.31738873e-08, -0.207781896, -8.82843523e-08, -0.978175163)
		elseif MyLevel == 60 or MyLevel <= 74 then -- Desert Bandit
			Ms = "Desert Bandit [Lv. 60]"
			NaemQuest = "DesertQuest"
			LevelQuest = 1
			NameMon = "Desert Bandit"
			CFrameQuest = CFrame.new(897.031128, 6.43846416, 4388.97168, -0.804044724, 3.68233266e-08, 0.594568789, 6.97835176e-08, 1, 3.24365246e-08, -0.594568789, 6.75715199e-08, -0.804044724)
			CFrameMon = CFrame.new(932.788818, 6.4503746, 4488.24609, -0.998625934, 3.08948351e-08, 0.0524050146, 2.79967303e-08, 1, -5.60361286e-08, -0.0524050146, -5.44919629e-08, -0.998625934)
		elseif MyLevel == 75 or MyLevel <= 89 then -- Desert Officre
			Ms = "Desert Officer [Lv. 70]"
			NaemQuest = "DesertQuest"
			LevelQuest = 2
			NameMon = "Desert Officer"
			CFrameQuest = CFrame.new(897.031128, 6.43846416, 4388.97168, -0.804044724, 3.68233266e-08, 0.594568789, 6.97835176e-08, 1, 3.24365246e-08, -0.594568789, 6.75715199e-08, -0.804044724)
			CFrameMon = CFrame.new(1580.03198, 4.61375761, 4366.86426, 0.135744005, -6.44280718e-08, -0.990743816, 4.35738308e-08, 1, -5.90598574e-08, 0.990743816, -3.51534837e-08, 0.135744005)
		elseif MyLevel == 90 or MyLevel <= 99 then -- Snow Bandits
			Ms = "Snow Bandit [Lv. 90]"
			NaemQuest = "SnowQuest"
			LevelQuest = 1
			NameMon = "Snow Bandits"
			CFrameQuest = CFrame.new(1384.14001, 87.272789, -1297.06482, 0.348555952, -2.53947841e-09, -0.937287986, 1.49860568e-08, 1, 2.86358204e-09, 0.937287986, -1.50443711e-08, 0.348555952)
			CFrameMon = CFrame.new(1370.24316, 102.403511, -1411.52905, 0.980274439, -1.12995728e-08, 0.197641045, -9.57343449e-09, 1, 1.04655214e-07, -0.197641045, -1.04482936e-07, 0.980274439)
		elseif MyLevel == 100 or MyLevel <= 119 then -- Snowman
			Ms = "Snowman [Lv. 100]"
			NaemQuest = "SnowQuest"
			LevelQuest = 2
			NameMon = "Snowman"
			CFrameQuest = CFrame.new(1384.14001, 87.272789, -1297.06482, 0.348555952, -2.53947841e-09, -0.937287986, 1.49860568e-08, 1, 2.86358204e-09, 0.937287986, -1.50443711e-08, 0.348555952)
			CFrameMon = CFrame.new(1370.24316, 102.403511, -1411.52905, 0.980274439, -1.12995728e-08, 0.197641045, -9.57343449e-09, 1, 1.04655214e-07, -0.197641045, -1.04482936e-07, 0.980274439)
		elseif MyLevel == 120 or MyLevel <= 149 then -- Chief Petty Officer
			Ms = "Chief Petty Officer [Lv. 120]"
			NaemQuest = "MarineQuest2"
			LevelQuest = 1
			NameMon = "Chief Petty Officer"
			CFrameQuest = CFrame.new(-5035.0835, 28.6520386, 4325.29443, 0.0243340395, -7.08064647e-08, 0.999703884, -6.36926814e-08, 1, 7.23777944e-08, -0.999703884, -6.54350671e-08, 0.0243340395)
			CFrameMon = CFrame.new(-4882.8623, 22.6520386, 4255.53516, 0.273695946, -5.40380647e-08, -0.96181643, 4.37720793e-08, 1, -4.37274998e-08, 0.96181643, -3.01326679e-08, 0.273695946)
		elseif MyLevel == 150 or MyLevel <= 174 then -- Sky Bandit
			Ms = "Sky Bandit [Lv. 150]"
			NaemQuest = "SkyQuest"
			LevelQuest = 1
			NameMon = "Sky Bandit"
			CFrameQuest = CFrame.new(-4841.83447, 717.669617, -2623.96436, -0.875942111, 5.59710216e-08, -0.482416272, 3.04023082e-08, 1, 6.08195947e-08, 0.482416272, 3.86078725e-08, -0.875942111)
			CFrameMon = CFrame.new(-4970.74219, 294.544342, -2890.11353, -0.994874597, -8.61311236e-08, -0.101116329, -9.10836206e-08, 1, 4.43614923e-08, 0.101116329, 5.33441664e-08, -0.994874597)
		elseif MyLevel == 175 or MyLevel <= 224 then -- Dark Master
			Ms = "Dark Master [Lv. 175]"
			NaemQuest = "SkyQuest"
			LevelQuest = 2
			NameMon = "Dark Master"
			CFrameQuest = CFrame.new(-4841.83447, 717.669617, -2623.96436, -0.875942111, 5.59710216e-08, -0.482416272, 3.04023082e-08, 1, 6.08195947e-08, 0.482416272, 3.86078725e-08, -0.875942111)
			CFrameMon = CFrame.new(-5220.58594, 430.693298, -2278.17456, -0.925375521, 1.12086873e-08, 0.379051805, -1.05115507e-08, 1, -5.52320891e-08, -0.379051805, -5.50948407e-08, -0.925375521)
		elseif MyLevel == 225 or MyLevel <= 274 then -- Toga Warrior
			Ms = "Toga Warrior [Lv. 225]"
			NaemQuest = "ColosseumQuest"
			LevelQuest = 1
			NameMon = "Toga Warrior"
			CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
			CFrameMon = CFrame.new(-1779.97583, 44.6077499, -2736.35474, 0.984437346, 4.10396339e-08, 0.175734788, -3.62286876e-08, 1, -3.05844168e-08, -0.175734788, 2.3741821e-08, 0.984437346)
		elseif MyLevel == 275 or MyLevel <= 299 then -- Gladiato
			Ms = "Gladiator [Lv. 275]"
			NaemQuest = "ColosseumQuest"
			LevelQuest = 2
			NameMon = "Gladiato"
			CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
			CFrameMon = CFrame.new(-1274.75903, 58.1895943, -3188.16309, 0.464524001, 6.21005611e-08, 0.885560572, -4.80449414e-09, 1, -6.76054768e-08, -0.885560572, 2.71497012e-08, 0.464524001)
		elseif MyLevel == 300 or MyLevel <= 329 then -- Military Soldier
			Ms = "Military Soldier [Lv. 300]"
			NaemQuest = "MagmaQuest"
			LevelQuest = 1
			NameMon = "Military Soldier"
			CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
			CFrameMon = CFrame.new(-5363.01123, 41.5056877, 8548.47266, -0.578253984, -3.29503091e-10, 0.815856814, 9.11209668e-08, 1, 6.498761e-08, -0.815856814, 1.11920997e-07, -0.578253984)
		elseif MyLevel == 300 or MyLevel <= 374 then -- Military Spy
            FM = false
			Ms = "Military Spy [Lv. 330]"
			NaemQuest = "MagmaQuest"
			LevelQuest = 2
			NameMon = "Military Spy"
			CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
			CFrameMon = CFrame.new(-5787.99023, 120.864456, 8762.25293, -0.188358366, -1.84706277e-08, 0.982100308, -1.23782129e-07, 1, -4.93306951e-09, -0.982100308, -1.22495649e-07, -0.188358366)
		elseif MyLevel == 375 or MyLevel <= 399 then -- Fishman Warrior
            FM = true
			Ms = "Fishman Warrior [Lv. 375]"
			NaemQuest = "FishmanQuest"
			LevelQuest = 1
			NameMon = "Fishman Warrior"
			CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574, -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
			CFrameMon = CFrame.new(60946.6094, 48.6735229, 1525.91687, -0.0817126185, 8.90751153e-08, 0.996655822, 2.00889794e-08, 1, -8.77269599e-08, -0.996655822, 1.28533992e-08, -0.0817126185)
		elseif MyLevel == 400 or MyLevel <= 449 then -- Fishman Commando
            FM = true
			Ms = "Fishman Commando [Lv. 400]"
			NaemQuest = "FishmanQuest"
			LevelQuest = 2
			NameMon = "Fishman Commando"
			CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574, -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
			CFrameMon = CFrame.new(61885.5039, 18.4828243, 1504.17896, 0.577502489, 0, -0.816389024, -0, 1.00000012, -0, 0.816389024, 0, 0.577502489)
		elseif MyLevel == 450 or MyLevel <= 474 then -- God's Guards
            FM = false
			Ms = "God's Guard [Lv. 450]"
			NaemQuest = "SkyExp1Quest"
			LevelQuest = 1
			NameMon = "God's Guards"
			CFrameQuest = CFrame.new(-4721.71436, 845.277161, -1954.20105, -0.999277651, -5.56969759e-09, 0.0380011722, -4.14751478e-09, 1, 3.75035256e-08, -0.0380011722, 3.73188307e-08, -0.999277651)
			CFrameMon = CFrame.new(-4716.95703, 853.089722, -1933.92542, -0.93441087, -6.77488776e-09, -0.356197298, 1.12145182e-08, 1, -4.84390199e-08, 0.356197298, -4.92565206e-08, -0.93441087)
		elseif MyLevel == 475 or MyLevel <= 524 then -- Shandas
            sky = false
			Ms = "Shanda [Lv. 475]"
			NaemQuest = "SkyExp1Quest"
			LevelQuest = 2
			NameMon = "Shandas"
			CFrameQuest = CFrame.new(-7863.63672, 5545.49316, -379.826324, 0.362120807, -1.98046344e-08, -0.93213129, 4.05822291e-08, 1, -5.48095125e-09, 0.93213129, -3.58431969e-08, 0.362120807)
			CFrameMon = CFrame.new(-7685.12354, 5601.05127, -443.171509, 0.150056243, 1.79768236e-08, -0.988677442, 6.67798661e-09, 1, 1.91962481e-08, 0.988677442, -9.48289181e-09, 0.150056243)
		elseif MyLevel == 525 or MyLevel <= 549 then -- Royal Squad
            sky = true
			Ms = "Royal Squad [Lv. 525]"
			NaemQuest = "SkyExp2Quest"
			LevelQuest = 1
			NameMon = "Royal Squad"
			CFrameQuest = CFrame.new(-7902.66895, 5635.96387, -1411.71802, 0.0504222959, 2.5710392e-08, 0.998727977, 1.12541557e-07, 1, -3.14249675e-08, -0.998727977, 1.13982921e-07, 0.0504222959)
			CFrameMon = CFrame.new(-7685.02051, 5606.87842, -1442.729, 0.561947823, 7.69527464e-09, -0.827172697, -4.24974544e-09, 1, 6.41599973e-09, 0.827172697, -9.01838604e-11, 0.561947823)
		elseif MyLevel == 550 or MyLevel <= 624 then -- Royal Soldier
            Dis = 240
            sky = true
			Ms = "Royal Soldier [Lv. 550]"
			NaemQuest = "SkyExp2Quest"
			LevelQuest = 2
			NameMon = "Royal Soldier"
			CFrameQuest = CFrame.new(-7902.66895, 5635.96387, -1411.71802, 0.0504222959, 2.5710392e-08, 0.998727977, 1.12541557e-07, 1, -3.14249675e-08, -0.998727977, 1.13982921e-07, 0.0504222959)
			CFrameMon = CFrame.new(-7864.44775, 5661.94092, -1708.22351, 0.998389959, 2.28686137e-09, -0.0567218624, 1.99431383e-09, 1, 7.54200258e-08, 0.0567218624, -7.54117195e-08, 0.998389959)
		elseif MyLevel == 625 or MyLevel <= 649 then -- Galley Pirate
            Dis = 240
            sky = false
			Ms = "Galley Pirate [Lv. 625]"
			NaemQuest = "FountainQuest"
			LevelQuest = 1
			NameMon = "Galley Pirate"
			CFrameQuest = CFrame.new(5254.60156, 38.5011406, 4049.69678, -0.0504891425, -3.62066501e-08, -0.998724639, -9.87921389e-09, 1, -3.57534553e-08, 0.998724639, 8.06145284e-09, -0.0504891425)
			CFrameMon = CFrame.new(5595.06982, 41.5013695, 3961.47095, -0.992138803, -2.11610267e-08, -0.125142589, -1.34249509e-08, 1, -6.26613996e-08, 0.125142589, -6.04887518e-08, -0.992138803)
		elseif MyLevel >= 650 then -- Galley Captain
            Dis = 240
			Ms = "Galley Captain [Lv. 650]"
			NaemQuest = "FountainQuest"
			LevelQuest = 2
			NameMon = "Galley Captain"
			CFrameQuest = CFrame.new(5254.60156, 38.5011406, 4049.69678, -0.0504891425, -3.62066501e-08, -0.998724639, -9.87921389e-09, 1, -3.57534553e-08, 0.998724639, 8.06145284e-09, -0.0504891425)
			CFrameMon = CFrame.new(5658.5752, 38.5361786, 4928.93506, -0.996873081, 2.12391046e-06, -0.0790185928, 2.16989656e-06, 1, -4.96097414e-07, 0.0790185928, -6.66008248e-07, -0.996873081)
		end
    elseif world2 then
        local MyLevel = game.Players.LocalPlayer.Data.Level.Value
		Dis = 240
		if MyLevel == 700 or MyLevel <= 724 then -- Raider [Lv. 700]
			Ms = "Raider [Lv. 700]"
			NaemQuest = "Area1Quest"
			LevelQuest = 1
			NameMon = "Raider"
			CFrameQuest = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
			CFrameMon = CFrame.new(-737.026123, 39.1748352, 2392.57959, 0.272128761, 0, -0.962260842, -0, 1, -0, 0.962260842, 0, 0.272128761)
		elseif MyLevel == 725 or MyLevel <= 774 then -- Mercenary [Lv. 725]
			Ms = "Mercenary [Lv. 725]"
			NaemQuest = "Area1Quest"
			LevelQuest = 2
			NameMon = "Mercenary"
			CFrameQuest = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
			CFrameMon = CFrame.new(-973.731995, 95.8733215, 1836.46936, 0.999135971, 2.02326991e-08, -0.0415605344, -1.90767793e-08, 1, 2.82094952e-08, 0.0415605344, -2.73922804e-08, 0.999135971)
		elseif MyLevel == 775 or MyLevel <= 799 then -- Swan Pirate [Lv. 775]
			Ms = "Swan Pirate [Lv. 775]"
			NaemQuest = "Area2Quest"
			LevelQuest = 1
			NameMon = "Swan Pirate"
			CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
			CFrameMon = CFrame.new(970.369446, 142.653198, 1217.3667, 0.162079468, -4.85452638e-08, -0.986777723, 1.03357589e-08, 1, -4.74980872e-08, 0.986777723, -2.50063148e-09, 0.162079468)
		elseif MyLevel == 800 or MyLevel <= 874 then -- Factory Staff [Lv. 800]
			Ms = "Factory Staff [Lv. 800]"
			NaemQuest = "Area2Quest"
			LevelQuest = 2
			NameMon = "Factory Staff"
			CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
			CFrameMon = CFrame.new(296.786499, 72.9948196, -57.1298141, -0.876037002, -5.32364979e-08, 0.482243896, -3.87658332e-08, 1, 3.99718729e-08, -0.482243896, 1.63222538e-08, -0.876037002)
		elseif MyLevel == 875 or MyLevel <= 899 then -- Marine Lieutenant [Lv. 875]
			Ms = "Marine Lieutenant [Lv. 875]"
			NaemQuest = "MarineQuest3"
			LevelQuest = 1
			NameMon = "Marine Lieutenant"
			CFrameQuest = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
			CFrameMon = CFrame.new(-2913.26367, 73.0011826, -2971.64282, 0.910507619, 0, 0.413492233, 0, 1.00000012, 0, -0.413492233, 0, 0.910507619)
		elseif MyLevel == 900 or MyLevel <= 949 then -- Marine Captain [Lv. 900]
			Ms = "Marine Captain [Lv. 900]"
			NaemQuest = "MarineQuest3"
			LevelQuest = 2
			NameMon = "Marine Captain"
			CFrameQuest = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
			CFrameMon = CFrame.new(-1868.67688, 73.0011826, -3321.66333, -0.971402287, 1.06502087e-08, 0.237439692, 3.68856199e-08, 1, 1.06050372e-07, -0.237439692, 1.11775684e-07, -0.971402287)
		elseif MyLevel == 950 or MyLevel <= 974 then -- Zombie [Lv. 950]
			Ms = "Zombie [Lv. 950]"
			NaemQuest = "ZombieQuest"
			LevelQuest = 1
			NameMon = "Zombie"
			CFrameQuest = CFrame.new(-5492.79395, 48.5151672, -793.710571, 0.321800292, -6.24695815e-08, 0.946807742, 4.05616092e-08, 1, 5.21931227e-08, -0.946807742, 2.16082796e-08, 0.321800292)
			CFrameMon = CFrame.new(-5634.83838, 126.067039, -697.665039, -0.992770672, 6.77618939e-09, 0.120025545, 1.65461245e-08, 1, 8.04023372e-08, -0.120025545, 8.18070234e-08, -0.992770672)
		elseif MyLevel == 975 or MyLevel <= 999 then -- Vampire [Lv. 975]
			Ms = "Vampire [Lv. 975]"
			NaemQuest = "ZombieQuest"
			LevelQuest = 2
			NameMon = "Vampire"
			CFrameQuest = CFrame.new(-5492.79395, 48.5151672, -793.710571, 0.321800292, -6.24695815e-08, 0.946807742, 4.05616092e-08, 1, 5.21931227e-08, -0.946807742, 2.16082796e-08, 0.321800292)
			CFrameMon = CFrame.new(-6030.32031, 6.4377408, -1313.5564, -0.856965423, 3.9138893e-08, -0.515373945, -1.12178942e-08, 1, 9.45958547e-08, 0.515373945, 8.68467822e-08, -0.856965423)
		elseif MyLevel == 1000 or MyLevel <= 1049 then -- Snow Trooper [Lv. 1000] **
			Ms = "Snow Trooper [Lv. 1000]"
			NaemQuest = "SnowMountainQuest"
			LevelQuest = 1
			NameMon = "Snow Trooper"
			CFrameQuest = CFrame.new(604.964966, 401.457062, -5371.69287, 0.353063971, 1.89520435e-08, -0.935599446, -5.81846002e-08, 1, -1.70033754e-09, 0.935599446, 5.50377841e-08, 0.353063971)
			CFrameMon = CFrame.new(535.893433, 401.457062, -5329.6958, -0.999524176, 0, 0.0308452044, 0, 1, -0, -0.0308452044, 0, -0.999524176)
		elseif MyLevel == 1050 or MyLevel <= 1099 then -- Winter Warrior [Lv. 1050]
			Ms = "Winter Warrior [Lv. 1050]"
			NaemQuest = "SnowMountainQuest"
			LevelQuest = 2
			NameMon = "Winter Warrior"
			CFrameQuest = CFrame.new(604.964966, 401.457062, -5371.69287, 0.353063971, 1.89520435e-08, -0.935599446, -5.81846002e-08, 1, -1.70033754e-09, 0.935599446, 5.50377841e-08, 0.353063971)
			CFrameMon = CFrame.new(1223.7417, 454.575226, -5170.02148, 0.473996818, 2.56845354e-08, 0.880526543, -5.62456428e-08, 1, 1.10811016e-09, -0.880526543, -5.00510211e-08, 0.473996818)
		elseif MyLevel == 1100 or MyLevel <= 1124 then -- Lab Subordinate [Lv. 1100]
			Ms = "Lab Subordinate [Lv. 1100]"
			NaemQuest = "IceSideQuest"
			LevelQuest = 1
			NameMon = "Lab Subordinate"
			CFrameQuest = CFrame.new(-6060.10693, 15.9868021, -4904.7876, -0.411000341, -5.06538868e-07, 0.91163528, 1.26306062e-07, 1, 6.12581289e-07, -0.91163528, 3.66916197e-07, -0.411000341)
			CFrameMon = CFrame.new(-5769.2041, 37.9288292, -4468.38721, -0.569419742, -2.49055017e-08, 0.822046936, -6.96206541e-08, 1, -1.79282633e-08, -0.822046936, -6.74401548e-08, -0.569419742)
		elseif MyLevel == 1125 or MyLevel <= 1174 then -- Horned Warrior [Lv. 1125]
			Ms = "Horned Warrior [Lv. 1125]"
			NaemQuest = "IceSideQuest"
			LevelQuest = 2
			NameMon = "Horned Warrior"
			CFrameQuest = CFrame.new(-6060.10693, 15.9868021, -4904.7876, -0.411000341, -5.06538868e-07, 0.91163528, 1.26306062e-07, 1, 6.12581289e-07, -0.91163528, 3.66916197e-07, -0.411000341)
			CFrameMon = CFrame.new(-6400.85889, 24.7645149, -5818.63574, -0.964845479, 8.65926566e-08, -0.262817472, 3.98261392e-07, 1, -1.13260398e-06, 0.262817472, -1.19745812e-06, -0.964845479)
		elseif MyLevel == 1175 or MyLevel <= 1199 then -- Magma Ninja [Lv. 1175]
			Ms = "Magma Ninja [Lv. 1175]"
			NaemQuest = "FireSideQuest"
			LevelQuest = 1
			NameMon = "Magma Ninja"
			CFrameQuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07, -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
			CFrameMon = CFrame.new(-5496.65576, 58.6890411, -5929.76855, -0.885073781, 0, -0.465450764, 0, 1.00000012, -0, 0.465450764, 0, -0.885073781)
		elseif MyLevel == 1200 or MyLevel <= 1249 then -- Lava Pirate [Lv. 1200]
			Ms = "Lava Pirate [Lv. 1200]"
			NaemQuest = "FireSideQuest"
			LevelQuest = 2
			NameMon = "Lava Pirate"
			CFrameQuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07, -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
			CFrameMon = CFrame.new(-5169.71729, 34.1234779, -4669.73633, -0.196780294, 0, 0.98044765, 0, 1.00000012, -0, -0.98044765, 0, -0.196780294)
		elseif MyLevel == 1250 or MyLevel <= 1274 then -- Ship Deckhand [Lv. 1250]
			Ms = "Ship Deckhand [Lv. 1250]"
			NaemQuest = "ShipQuest1"
			LevelQuest = 1
			NameMon = "Ship Deckhand"
			CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
			CFrameMon = CFrame.new(1163.80872, 138.288452, 33058.4258, -0.998580813, 5.49076979e-08, -0.0532564968, 5.57436763e-08, 1, -1.42118655e-08, 0.0532564968, -1.71604082e-08, -0.998580813)
		elseif MyLevel == 1275 or MyLevel <= 1299 then -- Ship Engineer [Lv. 1275]
			Ms = "Ship Engineer [Lv. 1275]"
			NaemQuest = "ShipQuest1"
			LevelQuest = 2
			NameMon = "Ship Engineer"
			CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
			CFrameMon = CFrame.new(916.666504, 44.0920448, 32917.207, -0.99746871, -4.85034697e-08, -0.0711069331, -4.8925461e-08, 1, 4.19294288e-09, 0.0711069331, 7.66126895e-09, -0.99746871)
		elseif MyLevel == 1300 or MyLevel <= 1324 then -- Ship Steward [Lv. 1300]
			Ms = "Ship Steward [Lv. 1300]"
			NaemQuest = "ShipQuest2"
			LevelQuest = 1
			NameMon = "Ship Steward"
			CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
			CFrameMon = CFrame.new(918.743286, 129.591064, 33443.4609, -0.999792814, -1.7070947e-07, -0.020350717, -1.72559169e-07, 1, 8.91351277e-08, 0.020350717, 9.2628369e-08, -0.999792814)
		elseif MyLevel == 1325 or MyLevel <= 1349 then -- Ship Officer [Lv. 1325]
			Ms = "Ship Officer [Lv. 1325]"
			NaemQuest = "ShipQuest2"
			LevelQuest = 2
			NameMon = "Ship Officer"
			CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
			CFrameMon = CFrame.new(786.051941, 181.474106, 33303.2969, 0.999285698, -5.32193063e-08, 0.0377905183, 5.68968588e-08, 1, -9.62386864e-08, -0.0377905183, 9.83201005e-08, 0.999285698)
		elseif MyLevel == 1350 or MyLevel <= 1374 then -- Arctic Warrior [Lv. 1350]
			Ms = "Arctic Warrior [Lv. 1350]"
			NaemQuest = "FrostQuest"
			LevelQuest = 1
			NameMon = "Arctic Warrior"
			CFrameQuest = CFrame.new(5669.43506, 28.2117786, -6482.60107, 0.888092756, 1.02705066e-07, 0.459664226, -6.20391774e-08, 1, -1.03572376e-07, -0.459664226, 6.34646895e-08, 0.888092756)
			CFrameMon = CFrame.new(5995.07471, 57.3188477, -6183.47314, 0.702747107, -1.53454167e-07, -0.711440146, -1.08168464e-07, 1, -3.22542007e-07, 0.711440146, 3.03620908e-07, 0.702747107)
		elseif MyLevel == 1375 or MyLevel <= 1424 then -- Snow Lurker [Lv. 1375]
			Ms = "Snow Lurker [Lv. 1375]"
			NaemQuest = "FrostQuest"
			LevelQuest = 2
			NameMon = "Snow Lurker"
			CFrameQuest = CFrame.new(5669.43506, 28.2117786, -6482.60107, 0.888092756, 1.02705066e-07, 0.459664226, -6.20391774e-08, 1, -1.03572376e-07, -0.459664226, 6.34646895e-08, 0.888092756)
			CFrameMon = CFrame.new(5518.00684, 60.5559731, -6828.80518, -0.650781393, -3.64292951e-08, 0.759265184, -4.07668654e-09, 1, 4.44854642e-08, -0.759265184, 2.58550248e-08, -0.650781393)
		elseif MyLevel == 1425 or MyLevel <= 1449 then -- Sea Soldier [Lv. 1425]
			Ms = "Sea Soldier [Lv. 1425]"
			NaemQuest = "ForgottenQuest"
			LevelQuest = 1
			NameMon = "Sea Soldier"
			CFrameQuest = CFrame.new(-3052.99097, 236.881363, -10148.1943, -0.997911751, 4.42321983e-08, 0.064591676, 4.90968759e-08, 1, 7.37270085e-08, -0.064591676, 7.67442998e-08, -0.997911751)
			CFrameMon = CFrame.new(-3029.78467, 66.944252, -9777.38184, -0.998552859, 1.09555076e-08, 0.0537791774, 7.79564235e-09, 1, -5.89660658e-08, -0.0537791774, -5.84614881e-08, -0.998552859)
		elseif MyLevel >= 1450 then -- Water Fighter [Lv. 1450]
			Ms = "Water Fighter [Lv. 1450]"
			NaemQuest = "ForgottenQuest"
			LevelQuest = 2
			NameMon = "Water Fighter"
			CFrameQuest = CFrame.new(-3052.99097, 236.881363, -10148.1943, -0.997911751, 4.42321983e-08, 0.064591676, 4.90968759e-08, 1, 7.37270085e-08, -0.064591676, 7.67442998e-08, -0.997911751)
			CFrameMon = CFrame.new(-3262.00098, 298.699615, -10553.6943, -0.233570755, -4.57538185e-08, 0.972339869, -5.80986068e-08, 1, 3.30992194e-08, -0.972339869, -4.87605725e-08, -0.233570755)
		end
    else
        local MyLevel =  game.Players.LocalPlayer.Data.Level.Value
		Dis = 240
		if MyLevel == 1500 or MyLevel <= 1524 then
			Ms = "Pirate Millionaire [Lv. 1500]"
			NaemQuest = "PiratePortQuest"
			LevelQuest = 1
			NameMon = "Pirate Millionaire"
			CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
			CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
		elseif MyLevel == 1525 or MyLevel <= 1574 then
			Ms = "Pistol Billionaire [Lv. 1525]"
			NaemQuest = "PiratePortQuest"
			LevelQuest = 2
			NameMon = "Pistol Billionaire"
			CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
			CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
		elseif MyLevel == 1575 or MyLevel <= 1599 then
			Ms = "Dragon Crew Warrior [Lv. 1575]"
			NaemQuest = "AmazonQuest"
			LevelQuest = 1
			NameMon = "Dragon Crew Warrior"
			CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
			CFrameMon = CFrame.new(6241.9951171875, 51.522083282471, -1243.9771728516)
		elseif MyLevel == 1600 or MyLevel <= 1624 then
			Ms = "Dragon Crew Archer [Lv. 1600]"
			NaemQuest = "AmazonQuest"
			LevelQuest = 2
			NameMon = "Dragon Crew Archer"
			CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
			CFrameMon = CFrame.new(6488.9155273438, 383.38375854492, -110.66246032715)
		elseif MyLevel == 1625 or MyLevel <= 1649 then
			Ms = "Female Islander [Lv. 1625]"
			NaemQuest = "AmazonQuest2"
			LevelQuest = 1
			NameMon = "Female Islander"
			CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMon = CFrame.new(4770.4990234375, 758.95520019531, 1069.8680419922)
		elseif MyLevel == 1650 or MyLevel <= 1699 then
			Ms = "Giant Islander [Lv. 1650]"
			NaemQuest = "AmazonQuest2"
			LevelQuest = 2
			NameMon = "Giant Islander"
			CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMon = CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789)
		elseif MyLevel == 1700 or MyLevel <= 1724 then
			Ms = "Marine Commodore [Lv. 1700]"
			NaemQuest = "MarineTreeIsland"
			LevelQuest = 1
			NameMon = "Marine Commodore"
			CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
			CFrameMon = CFrame.new(2490.0844726563, 190.4232635498, -7160.0502929688)
		elseif MyLevel == 1725 or MyLevel <= 1774 then
			Ms = "Marine Rear Admiral [Lv. 1725]"
			NaemQuest = "MarineTreeIsland"
			LevelQuest = 2
			NameMon = "Marine Rear Admiral"
			CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
			CFrameMon = CFrame.new(3951.3903808594, 229.11549377441, -6912.81640625)
		elseif MyLevel == 1775 or MyLevel <= 1799 then
			Ms = "Fishman Raider [Lv. 1775]"
			NaemQuest = "DeepForestIsland3"
			LevelQuest = 1
			NameMon = "Fishman Raider"
			CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
			CFrameMon = CFrame.new(-10322.400390625, 390.94473266602, -8580.0908203125)
		elseif MyLevel == 1800 or MyLevel <= 1824 then
			Ms = "Fishman Captain [Lv. 1800]"
			NaemQuest = "DeepForestIsland3"
			LevelQuest = 2
			NameMon = "Fishman Captain"
			CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
			CFrameMon = CFrame.new(-11194.541992188, 442.02795410156, -8608.806640625)
		elseif MyLevel == 1825 or MyLevel <= 1849 then
			Ms = "Forest Pirate [Lv. 1825]"
			NaemQuest = "DeepForestIsland"
			LevelQuest = 1
			NameMon = "Forest Pirate"
			CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
			CFrameMon = CFrame.new(-13225.809570313, 428.19387817383, -7753.1245117188)
		elseif MyLevel == 1850 or MyLevel <= 1899 then
			Ms = "Mythological Pirate [Lv. 1850]"
			NaemQuest = "DeepForestIsland"
			LevelQuest = 2
			NameMon = "Mythological Pirate"
			CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
			CFrameMon = CFrame.new(-13869.172851563, 564.95251464844, -7084.4135742188)
		elseif MyLevel == 1900 or MyLevel <= 1924 then
			Ms = "Jungle Pirate [Lv. 1900]"
			NaemQuest = "DeepForestIsland2"
			LevelQuest = 1
			NameMon = "Jungle Pirate"
			CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
			CFrameMon = CFrame.new(-11982.221679688, 376.32522583008, -10451.415039063)
		elseif MyLevel == 1925 or MyLevel <= 1974 then
			Ms = "Musketeer Pirate [Lv. 1925]"
			NaemQuest = "DeepForestIsland2"
			LevelQuest = 2
			NameMon = "Musketeer Pirate"
			CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
			CFrameMon = CFrame.new(-13282.3046875, 496.23684692383, -9565.150390625)
        elseif MyLevel == 1975 or MyLevel <= 1999 then
			Ms = "Reborn Skeleton [Lv. 1975]"
			NaemQuest = "HauntedQuest1"
			LevelQuest = 1
			NameMon = "Reborn Skeleton"
			CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMon = CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813)
        elseif MyLevel == 2000 or MyLevel <= 2024 then
			Ms = "Living Zombie [Lv. 2000]"
			NaemQuest = "HauntedQuest1"
			LevelQuest = 2
			NameMon = "Living Zombie"
			CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMon = CFrame.new(-10093.930664063, 237.38233947754, 6180.5654296875)
		elseif MyLevel == 2025 or MyLevel <= 2049 then
			Ms = "Demonic Soul [Lv. 2025]"
			NaemQuest = "HauntedQuest2"
			LevelQuest = 1
			NameMon = "Demonic Soul"
			CFrameQuest = CFrame.new(-9514.78027, 171.162918, 6078.82373, 0.301918149, 7.4535027e-09, 0.953333855, -3.22802141e-09, 1, -6.79604995e-09, -0.953333855, -1.02553133e-09, 0.301918149)
			CFrameMon = CFrame.new(-9466.72949, 171.162918, 6132.01514)
		elseif MyLevel == 2050 or MyLevel <= 2074 then
			Ms = "Posessed Mummy [Lv. 2050]" 
			NaemQuest = "HauntedQuest2"
			LevelQuest = 2
			NameMon = "Posessed Mummy"
			CFrameQuest = CFrame.new(-9514.78027, 171.162918, 6078.82373, 0.301918149, 7.4535027e-09, 0.953333855, -3.22802141e-09, 1, -6.79604995e-09, -0.953333855, -1.02553133e-09, 0.301918149)
			CFrameMon = CFrame.new(-9589.93848, 4.85058546, 6190.27197)
        elseif MyLevel == 2075 or MyLevel <= 2099 then
            Ms = "Peanut Scout [Lv. 2075]"
            NaemQuest = "NutsIslandQuest"
            LevelQuest = 1
            NameMon = "Peanut Scout"
            CFrameQuest = CFrame.new(-2075.9643554688, 38.129207611084, -10172.815429688)
            CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
		elseif MyLevel == 2100 or MyLevel <= 2124 then
            Ms = "Peanut President [Lv. 2100]"
            NaemQuest = "NutsIslandQuest"
            LevelQuest = 2
            NameMon = "Peanut President"
            CFrameQuest = CFrame.new(-2075.9643554688, 38.129207611084, -10172.815429688)
            CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
        elseif MyLevel == 2125 or MyLevel <= 2149 then
            Ms = "Ice Cream Chef [Lv. 2125]"
            NaemQuest = "IceCreamIslandQuest"
            LevelQuest = 1
            NameMon = "Ice Cream Chef"
            CFrameQuest = CFrame.new(-819.84533691406, 65.845329284668, -10965.487304688)
            CFrameMon = CFrame.new(-890.55895996094, 186.34135437012, -11127.306640625)
        elseif MyLevel >= 2150 then
            Ms = "Ice Cream Commander [Lv. 2150]"
            NaemQuest = "IceCreamIslandQuest"
            LevelQuest = 2
            NameMon = "Ice Cream Commander"
            CFrameQuest = CFrame.new(-819.84533691406, 65.845329284668, -10965.487304688)
            CFrameMon = CFrame.new(-890.55895996094, 186.34135437012, -11127.306640625)
        end
    end
end
spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if _G.FarmLevel or _G.Tween or _G.Bounty1 or _G.AutoBone then
            if not game:GetService("Workspace"):FindFirstChild("LOL") then
                local LOL = Instance.new("Part")
                LOL.Name = "LOL"
                LOL.Parent = game.Workspace
                LOL.Anchored = true
                LOL.Transparency = 1
                LOL.Size = Vector3.new(30,-0.5,30)
            elseif game:GetService("Workspace"):FindFirstChild("LOL") then
                game.Workspace["LOL"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3.6, 0)
            end
        else
            if game:GetService("Workspace"):FindFirstChild("LOL") then
                game:GetService("Workspace"):FindFirstChild("LOL"):Destroy()
            end
        end
    end)
end)

spawn(function()
    player = game.Players.LocalPlayer
    character = player.Character
    game:GetService("RunService").Stepped:Connect(function()
        if _G.FarmLevel or _G.Tween or _G.Bounty1 or _G.AutoBone then
            for _, v in pairs(character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end)
end)


function TP2FF(P1)
	Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	if Distance < 1000 then
		Speed = 400
	elseif Distance >= 1000 then
		Speed = 250
	end
    game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = P1}
    ):Play()
    Clip = true
    wait(Distance/Speed)
    Clip = false
end
function TP(P1,P2)
    Distance = (P1 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 1000 then
        Speed = 500
    elseif Distance >= 1000 then
        Speed = 300
    end
    if Distance >= 300 then
        tweenss = game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
            {CFrame = P2})
        tweenss:Play()
    else
        pcall(function()
        tweenss:Pause()
        end)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P2 
    end
end

function TPs(P1,P2)
    Distance = (P1 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 1000 then
        Speed = 500
    elseif Distance >= 1000 then
        Speed = 300
    end
	tweenss = game:GetService("TweenService"):Create(
		 game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = P2})
    tweenss:Play()
    wait(Distance/Speed)
end
function totarget(CFgo)
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/300, Enum.EasingStyle.Linear)
    local tween, err = pcall(function()
        tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
        tween:Play()
    end)
    if not tween then return err end
end
function bithop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                -- delfile("NotSameServers.json")
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        -- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(.1)
                end
            end
        end
    end
    function Teleport() 
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end
if world1 then
	Rq = 1000
    magbring = 240
elseif world2 then
	Rq = 2000
    magbring = 400
else
	Rq = 3000
    magbring = 400
end
Times = main:Label("Server Time")
   local function UpdateTime()
	  local GameTime = math.floor(workspace.DistributedGameTime+0.5)
	  local Hour = math.floor(GameTime/(60^2))%24
	  local Minute = math.floor(GameTime/(60^1))%60
	  local Second = math.floor(GameTime/(60^0))%60
	  Times:Refresh("Hour : "..Hour.." Minute : "..Minute.." Second : "..Second)
   end
spawn(function()
	while wait() do
		 UpdateTime()
	  end
end)
_G.FarmLevel = false
main:Toggle("AutoFarm",false,function(x)
    _G.FarmLevel = x
end)
spawn(function()
	while wait() do
		if _G.FarmLevel then
			if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				MagnetActive = false
				cq()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
				if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
					cq()
					if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 20 then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NaemQuest, LevelQuest)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
					else
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
					end
				end
			elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
				pcall(function()
					cq()
					if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == Ms and v:FindFirstChild("Humanoid") then
								if v.Humanoid.Health > 0 then
									repeat game:GetService("RunService").Heartbeat:wait()
										if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
											if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
												EquipWeapon(_G.SelectWeapon)
												game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,30,10)
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
												game:GetService("VirtualUser"):CaptureController()
												game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670),workspace.CurrentCamera.CFrame)
												PosMon = v.HumanoidRootPart.CFrame
												MagnetActive = true
											else
												MagnetActive = false    
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
											end
										else
											MagnetActive = false
											cq()
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
										end
									until not v.Parent or v.Humanoid.Health <= 0 or _G.FarmLevel == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
								end
							end
						end
					else
						MagnetActive = false
						cq()
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
					end
				end)
			end
		end
	end
end)
spawn(function()
    while wait() do
    if _G.FarmLevel then
        Attack()
        end
    end
end)
spawn(function()
    while wait() do
    if _G.FarmLevel then
            local noclip = Instance.new('Part',workspace)
            noclip.Name = "noclip"
            noclip.CanCollide = true
            noclip.Anchored = true
            noclip.Size = Vector3.new(30,0,30)
            noclip.Transparency = 1
            game:GetService("Workspace")["noclip"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  * CFrame.new(0,-5,0)
        end
    end
end)
main:Button("Redeem Code",function()
   function UseCode(Text)
       game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
   end
   UseCode("UPD16")
   UseCode("2BILLION")
   UseCode("UPD15")
   UseCode("FUDD10")
   UseCode("BIGNEWS")
   UseCode("THEGREATACE")
   UseCode("SUB2GAMERROBOT_EXP1")
   UseCode("StrawHatMaine")
   UseCode("Sub2OfficialNoobie")
   UseCode("SUB2NOOBMASTER123")
   UseCode("Sub2Daigrock")
   UseCode("Axiore")
   UseCode("TantaiGaming")
   UseCode("STRAWHATMAINE")
   UseCode("3Bvisits")
end)
main:Button("No clip",function()
    workspace.Gravity = 0
end)
main:Button("Join Discord Secret Hub", function(value)
    local a=request or http_request or syn and syn.request;local b=game.HttpService;a({Url="http://127.0.0.1:6463/rpc?v=1",Method="POST",Headers={["Content-Type"]="application/json",["Origin"]="https://discord.com"},Body=b:JSONEncode({cmd="INVITE_BROWSER",args={code="S95fXhuk2S"},nonce=b:GenerateGUID(false)})})local c=game:GetService("Players").LocalPlayer
end)
if world1 then

	main:Line()

	main:Toggle("Auto Second Sea",false,function(x)
		_G.AutoNew = x
	end)
end

spawn(function()
	game:GetService("RunService").Heartbeat:connect(function()
		pcall(function()
			if _G.AutoNew then
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
				end
			end
		end)
	end)
end)

spawn(function()
	while wait(.1) do
		if _G.AutoNew then
			if OldWorld then
				local MyLevel = game.Players.localPlayer.Data.Level.Value
				if MyLevel >= 700 and OldWorld then
					_G.FarmLevel = false
					_G.SelectWeapon = "Key"
					repeat wait()
						TP(CFrame.new(4849.29883, 5.65138149, 719.611877))
					until _G.StopTween == true or not _G.AutoNew or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(4849.29883, 5.65138149, 719.611877).Position).Magnitude <= 10
					wait(0.5)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
					wait(0.5)
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") then
						local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Key")
						wait(.4)
						game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
					end
					repeat wait()
						TP(CFrame.new(1347.7124, 37.3751602, -1325.6488))
					until _G.StopTween == true or not _G.AutoNew or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(1347.7124, 37.3751602, -1325.6488).Position).Magnitude <= 10
					wait(0.5)
					Click()
					if game.Workspace.Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") and game.Workspace.Map.Ice.Door.CanCollide == false and game.Workspace.Map.Ice.Door.Transparency == 1 then
						CheckBoss = true
						_G.SelectWeapon = _G.SelectToolWeaponOld
						EquipWeapon(_G.SelectWeapon)
						if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
						end
						for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
							if CheckBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == "Ice Admiral [Lv. 700] [Boss]" then
								if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
								end
								repeat wait(.1)
									pcall(function()
										v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
										v.HumanoidRootPart.BrickColor = BrickColor.new("White")
										v.HumanoidRootPart.CanCollide = false
										TP(v.HumanoidRootPart.CFrame*CFrame.new(0, 10, 10))
										Click()
									end)
								until not CheckBoss or not v.Parent or v.Humanoid.Health <= 0
							end
						end
						CheckBoss = false
						wait(0.5)
						repeat wait()
							TP(CFrame.new(-1166.23743, 7.65220165, 1728.36487))
						until (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame - CFrame.new(-1166.23743, 7.65220165, 1728.36487).Position).Magnitude <= 10
						wait(0.5)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
					else
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") then
							local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Key")
							wait(.4)
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
						end
						TP(CFrame.new(1347.7124, 37.3751602, -1325.6488))
					end
				end
			end
		end
	end
end)
if world2 then
	main:Toggle("Auto Swan (Hop)",false,function (t)
		_G.OpenSwan = t
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
		for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
			if v:IsA("Tool") then
				firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,0)
			end
		end
	end)
	millionfruit = {
		"Dragon Fruit",
		"Control Fruit",
		"Dough Fruit",
		"Gravity Fruit",
		"Paw Fruit",
		"Rumble Fruit",
		"String Fruit",
		"Quake Fruit",
		"Venom Fruit",
	}
	function hop()
		local PlaceID = game.PlaceId
		local AllIDs = {}
		local foundAnything = ""
		local actualHour = os.date("!*t").hour
		local Deleted = false
		function TPReturner()
			local Site;
			if foundAnything == "" then
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
			else
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
			end
			local ID = ""
			if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
				foundAnything = Site.nextPageCursor
			end
			local num = 0;
			for i,v in pairs(Site.data) do
				local Possible = true
				ID = tostring(v.id)
				if tonumber(v.maxPlayers) > tonumber(v.playing) then
					for _,Existing in pairs(AllIDs) do
						if num ~= 0 then
							if ID == tostring(Existing) then
								Possible = false
							end
						else
							if tonumber(actualHour) ~= tonumber(Existing) then
								local delFile = pcall(function()
									-- delfile("NotSameServers.json")
									AllIDs = {}
									table.insert(AllIDs, actualHour)
								end)
							end
						end
						num = num + 1
					end
					if Possible == true then
						table.insert(AllIDs, ID)
						wait()
						pcall(function()
							-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
							wait()
							game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
						end)
						wait(4)
					end
				end
			end
		end
		function Teleport()
			while wait() do
				pcall(function()
					TPReturner()
					if foundAnything ~= "" then
						TPReturner()
					end
				end)
			end
		end
		Teleport()
	end

	spawn(function()
		while wait() do
			if _G.OpenSwan then
				for i,v in pairs(millionfruit) do
					if game.Players.LocalPlayer.Character:FindFirstChild(v) then
						repeat totarget(CFrame.new(-342.28921508789, 331.8864440918, 643.62438964844)) wait() until _G.StopTween == true or not AutoBartilo or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-342.28921508789, 331.8864440918, 643.62438964844)).Magnitude <= 10
						wait(1)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1")
					else
						hop()
					end
				end
			end        
		end
	end)
end

if world2 then
	main:Toggle("Auto Rengoku Sword",false,function(v)
		_G.AutoRengoku = v
	end)
	spawn(function()
		while wait() do
			if _G.AutoRengoku then
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or  game.Players.LocalPlayer.Character:FindFirstChild("Hidden Key") then
					EquipWeapon("Hidden Key")
					totarget(CFrame.new(6571.81885, 296.689758, -6966.76514))
				elseif game.Workspace.Enemies:FindFirstChild("Snow Lurker [Lv. 1375]") then
					for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
						if v.Name == "Snow Lurker [Lv. 1375]" and v.Humanoid.Health > 0 then
							repeat wait()
								if game.Workspace.Enemies:FindFirstChild("Snow Lurker [Lv. 1375]") then
									if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
										local args = {
											[1] = "Buso"
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end
									EquipWeapon(_G.SelectWeapon)
									PosMonRengoku = v.HumanoidRootPart.CFrame
									totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
									game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
									VirtualUser:CaptureController()
									VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
									StatrMagnetRengoku = true
								else
									StatrMagnetRengoku = false
									totarget(CFrame.new(5518.00684, 60.5559731, -6828.80518))
								end
							until game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or _G.AutoRengoku == false or not v.Parent or v.Humanoid.Health <= 0
							StatrMagnetRengoku = false
							totarget(CFrame.new(5518.00684, 60.5559731, -6828.80518))
						end
					end
				else
					StatrMagnetRengoku = false
					totarget(CFrame.new(5518.00684, 60.5559731, -6828.80518))
				end
			end
		end
	end)
end

if world2 then
	main:Toggle("Auto Sea 3",false,function(value)
		local args = {
			[1] = "AbandonQuest"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		Sea3 = value
		Sea33 = value
		Check = true
		Checka = true
	end)
end

spawn(function()
	while wait() do
		pcall(function()
			if Sea3 and Checka then
				if world2 then
					local MyLevel = game.Players.localPlayer.Data.Level.Value
					if MyLevel >= 1500 then
						Sea33 = false
						if Check then
							repeat totarget(CFrame.new(-1925.56482, 12.8456564, 1737.36609)) wait() until _G.StopTween == true or not Sea3 or Sea33 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1925.56482, 12.8456564, 1737.36609)).Magnitude <= 10
						end
						Check = false
						wait(0.5)
						local args = {
							[1] = "ZQuestProgress",
							[2] = "Check"
						}

						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						local args = {
							[1] = "ZQuestProgress",
							[2] = "Begin"
						}

						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						Checka = false
					end
				end
			end
		end)
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			if Sea3 and Checka == false then
				for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					if v.Name == "rip_indra [Lv. 1500] [Boss]" then
						for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == "rip_indra [Lv. 1500] [Boss]" then
								repeat wait()
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(50,50,50)
									totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))										
									game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
									EquipWeapon(_G.SelectWeapon)
									Click()
									spawn(function()
										wait(1)
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
									end)
								until v.Humanoid.Health <= 0 or Sea3 == false
							end
						end
						repeat totarget(CFrame.new(-26640.7559, 6.94934607, 439.43512)) wait() until _G.StopTween == true or not Sea3 or Sea33 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-26640.7559, 6.94934607, 439.43512)).Magnitude <= 10
					end
				end
			end
		end)
	end
end)
if world2 then
	main:Toggle("Auto Factory",false,function(vu)
		_G.Factory = vu
		while _G.Factory do wait()
			if game.Workspace.Enemies:FindFirstChild("Core") then
				_G.Core = true
				_G.FarmLevel = false
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if _G.Core and v.Name == "Core" and v.Humanoid.Health > 0 then
						repeat wait(.1)
							repeat totarget(CFrame.new(448.46756, 199.356781, -441.389252)) wait() until _G.StopTween == true or not _G.Factory or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude <= 10
							EquipWeapon(_G.SelectWeapon)
							if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
								local args = {
									[1] = "Buso"
								}
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							end
							game:GetService'VirtualUser':CaptureController()
							game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
						until not _G.Core or v.Humanoid.Health <= 0  or _G.Factory == false
					end
				end
			elseif game.ReplicatedStorage:FindFirstChild("Core") then
				_G.Core = true
				_G.FarmLevel = false
				repeat totarget(CFrame.new(448.46756, 199.356781, -441.389252)) wait() until _G.StopTween == true or not _G.Factory or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude <= 10
			elseif _G.Main then
				_G.Core = false
				_G.FarmLevel = true
			end
		end
	end)
end

if OldWorld then
	main:Toggle("Auto Saber",false,function(Value)
		_G.AutoSaber = Value
	end)

	spawn(function()
		while wait(.1) do
			if _G.AutoSaber then
				local off = game:GetService("Workspace").Map.Jungle.Final:FindFirstChild("Part")
				local MyLevel = game.Players.localPlayer.Data.Level.Value
				if MyLevel >= 200 and _G.FarmLevel == true then
					repeat wait(.1)
						_G.FarmLevel = false
						function accept1()
							local string_1 = "ProQuestProgress";
							local string2 = "SickMan";
							local Target = game:GetService("ReplicatedStorage").Remotes["CommF"];
							Target:InvokeServer(string_1, string_2);
						end

						function accept2()
							local string_1 = "ProQuestProgress";
							local string2 = "RichSon";
							local Target = game:GetService("ReplicatedStorage").Remotes["CommF"];
							Target:InvokeServer(string_1, string2);
						end
						function saber()
							if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Mob Leader [Lv. 120] [Boss]" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
										repeat wait()
											pcall(function()
												if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
													local args = {
														[1] = "Buso"
													}
													game:GetService("ReplicatedStorage").Remotes.CommF:InvokeServer(unpack(args))
												end
												EquipWeapon(_G.SelectWeapon)
												v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
												v.HumanoidRootPart.CanCollide = false
												totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
												game:GetService'VirtualUser':CaptureController()
												game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
											end)
										until v.Humanoid.Health == 0
									end
								end
							end

							function accept3()
								local string_1 = "ProQuestProgress";
								local string2 = "RichSon";
								local Target = game:GetService("ReplicatedStorage").Remotes["CommF"];
								Target:InvokeServer(string_1, string_2);
							end

							wait(.1)
							repeat totarget(CFrame.new(-1421.87024, 55.4666862, 21.7750397)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1421.87024, 55.4666862, 21.7750397)).Magnitude <= 10
							wait(1)
							repeat totarget(CFrame.new(-1647.19556, 29.1544189, 438.299408)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1647.19556, 29.1544189, 438.299408)).Magnitude <= 10
							wait(1)
							repeat totarget(CFrame.new(-1324.10144, 31.4560413, -461.404114)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1324.10144, 31.4560413, -461.404114)).Magnitude <= 10
							wait(1)
							repeat totarget(CFrame.new(-1152.38464, 9.74718285, -700.309875)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1152.38464, 9.74718285, -700.309875)).Magnitude <= 10
							wait(1)
							repeat totarget(CFrame.new(-1180.89563, 21.0007095, 187.861374)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1180.89563, 21.0007095, 187.861374)).Magnitude <= 10
							wait(1)
							repeat totarget(CFrame.new(-1610.00757, 11.5049858, 164.001587)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1610.00757, 11.5049858, 164.001587)).Magnitude <= 10
							wait(2)
							local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Torch")
							wait(.4)
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
							wait(.1)
							repeat totarget(CFrame.new(1114.55762, 4.9214654, 4349.2334)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(1114.55762, 4.9214654, 4349.2334)).Magnitude <= 10
							wait(5.5)
							repeat totarget(CFrame.new(1114.26721, 4.16943789, 4366.15332)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(1114.26721, 4.16943789, 4366.15332)).Magnitude <= 10
							wait(1)
							local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Cup")
							wait(.4)
							EquipWeapon("Cup")
							wait(1)
							repeat totarget(CFrame.new(1397.0614, 37.3480072, -1321.03955)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(1397.0614, 37.3480072, -1321.03955)).Magnitude <= 10
							wait(4.5)
							repeat totarget(CFrame.new(1457.87976, 88.2521744, -1390.39575)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(1457.87976, 88.2521744, -1390.39575)).Magnitude <= 10
							wait(1.5)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan")
							wait(1)
							repeat totarget(CFrame.new(-909.106689, 13.7520342, 4077.34888)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-909.106689, 13.7520342, 4077.34888)).Magnitude <= 10
							wait(1.1)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
							wait(1)
							repeat totarget(CFrame.new(-2852.90234, 7.56227827, 5367.72412)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-2852.90234, 7.56227827, 5367.72412)).Magnitude <= 10
							wait(1.5)
							EquipWeapon(_G.SelectWeapon)
							wait(1)
							saber()
							wait(2)
							repeat totarget(CFrame.new(-909.106689, 13.7520342, 4077.34888)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-909.106689, 13.7520342, 4077.34888)).Magnitude <= 10
							wait(1.1)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
							wait(1.1)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress")
							wait(1)
							local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Relic")
							wait(.4)
							EquipWeapon("Relic")
							wait(1)
							repeat totarget(CFrame.new(-1405.84094, 29.8519993, 5.05432224)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1405.84094, 29.8519993, 5.05432224)).Magnitude <= 10

							wait(1)
							if off.CanCollide == false then
								_G.AutoSaber = false
								_G.FarmLevel = true
							end
						end
					until _G.AutoSaber == false or off.CanCollide == false or _G.FarmLevel == true

				elseif MyLevel >= 200 then
					repeat wait(.1)
						function accept1()
							local string_1 = "ProQuestProgress";
							local string2 = "SickMan";
							local Target = game:GetService("ReplicatedStorage").Remotes["CommF"];
							Target:InvokeServer(string_1, string_2);
						end

						function accept2()
							local string_1 = "ProQuestProgress";
							local string2 = "RichSon";
							local Target = game:GetService("ReplicatedStorage").Remotes["CommF"];
							Target:InvokeServer(string_1, string2);
						end
						function saber()
							for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Mob Leader [Lv. 120] [Boss]" then
									repeat wait()
										for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
											if v.Name == "Mob Leader [Lv. 120] [Boss]" then
												if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
													local args = {
														[1] = "Buso"
													}
													game:GetService("ReplicatedStorage").Remotes.CommF:InvokeServer(unpack(args))
												end
												_G.FastBoss = true
												EquipWeapon(_G.SelectWeapon)
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.Size = Vector3.new(50,50,50)
												totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
												game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
												game:GetService'VirtualUser':CaptureController()
												game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
												game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
											end
										end
									until v.Humanoid.Health == 0
									_G.FastBoss = false
								end
							end
						end

						function accept3()
							local string_1 = "ProQuestProgress";
							local string2 = "RichSon";
							local Target = game:GetService("ReplicatedStorage").Remotes["CommF"];
							Target:InvokeServer(string_1, string_2);
						end

						wait(.1)
						repeat totarget(CFrame.new(-1421.87024, 55.4666862, 21.7750397)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1421.87024, 55.4666862, 21.7750397)).Magnitude <= 10
						wait(1)
						repeat totarget(CFrame.new(-1647.19556, 29.1544189, 438.299408)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1647.19556, 29.1544189, 438.299408)).Magnitude <= 10
						wait(1)
						repeat totarget(CFrame.new(-1324.10144, 31.4560413, -461.404114)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1324.10144, 31.4560413, -461.404114)).Magnitude <= 10
						wait(1)
						repeat totarget(CFrame.new(-1152.38464, 9.74718285, -700.309875)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1152.38464, 9.74718285, -700.309875)).Magnitude <= 10
						wait(1)
						repeat totarget(CFrame.new(-1180.89563, 21.0007095, 187.861374)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1180.89563, 21.0007095, 187.861374)).Magnitude <= 10
						wait(1)
						repeat totarget(CFrame.new(-1610.00757, 11.5049858, 164.001587)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1610.00757, 11.5049858, 164.001587)).Magnitude <= 10
						wait(2)
						local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Torch")
						wait(.4)
						game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
						wait(.1)
						repeat totarget(CFrame.new(1114.55762, 4.9214654, 4349.2334)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(1114.55762, 4.9214654, 4349.2334)).Magnitude <= 10
						wait(5.5)
						repeat totarget(CFrame.new(1114.26721, 4.16943789, 4366.15332)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(1114.26721, 4.16943789, 4366.15332)).Magnitude <= 10
						wait(1)
						local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Cup")
						wait(.4)
						EquipWeapon("Cup")
						wait(1)
						repeat totarget(CFrame.new(1397.0614, 37.3480072, -1321.03955)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(1397.0614, 37.3480072, -1321.03955)).Magnitude <= 10
						wait(4.5)
						repeat totarget(CFrame.new(1457.87976, 88.2521744, -1390.39575)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(1457.87976, 88.2521744, -1390.39575)).Magnitude <= 10
						wait(1.5)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan")
						wait(1)
						repeat totarget(CFrame.new(-909.106689, 13.7520342, 4077.34888)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-909.106689, 13.7520342, 4077.34888)).Magnitude <= 10
						wait(1.1)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
						wait(1)
						repeat totarget(CFrame.new(-2852.90234, 7.56227827, 5367.72412)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-2852.90234, 7.56227827, 5367.72412)).Magnitude <= 10
						wait(1.5)
						EquipWeapon(_G.SelectWeapon)
						wait(1)
						saber()
						wait(2)
						repeat totarget(CFrame.new(-909.106689, 13.7520342, 4077.34888)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-909.106689, 13.7520342, 4077.34888)).Magnitude <= 10
						wait(1.1)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
						wait(1.1)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress")
						wait(1)
						local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Relic")
						wait(.4)
						EquipWeapon("Relic")
						wait(1)
						repeat totarget(CFrame.new(-1405.84094, 29.8519993, 5.05432224)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1405.84094, 29.8519993, 5.05432224)).Magnitude <= 10
						if off.CanCollide == false then
							_G.AutoSaber = false
						end
					until G.AutoOpenSaber == false or off.CanCollide == false
					if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]") then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == "Saber Expert [Lv. 200] [Boss]" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
								repeat wait()
									pcall(function()
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											local args = {
												[1] = "Buso"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF:InvokeServer(unpack(args))
										end
										EquipWeapon(_G.SelectWeapon)
										v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
										v.HumanoidRootPart.CanCollide = false
										totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
										game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
									end)
								until _G.AutoSaber == true or v.Humanoid.Health <= 0
							end
						end
					end
				end
			end
		end
	end)
end
main:Toggle("Auto Superhuman",false,function(vu)
	_G.Superhuman = vu
end)
spawn(function()
	while wait() do wait()
		if _G.Superhuman then
			if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
				local args = {
					[1] = "BuyBlackLeg"
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end   
			if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
				_G.SelectWeapon = "Superhuman"
			end  
			if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") then
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299 then
					_G.SelectWeapon = "Black Leg"
				end
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299 then
					_G.SelectWeapon = "Electro"
				end
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299 then
					_G.SelectWeapon = "Fishman Karate"
				end
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299 then
					_G.SelectWeapon = "Dragon Claw"
				end
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 then
					local args = {
						[1] = "BuyElectro"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
				if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 then
					local args = {
						[1] = "BuyElectro"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 then
					local args = {
						[1] = "BuyFishmanKarate"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
				if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 then
					local args = {
						[1] = "BuyFishmanKarate"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 then
					local args = {
						[1] = "BlackbeardReward",
						[2] = "DragonClaw",
						[3] = "1"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					local args = {
						[1] = "BlackbeardReward",
						[2] = "DragonClaw",
						[3] = "2"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
				end
				if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 then
					local args = {
						[1] = "BlackbeardReward",
						[2] = "DragonClaw",
						[3] = "1"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					local args = {
						[1] = "BlackbeardReward",
						[2] = "DragonClaw",
						[3] = "2"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
				end
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 then
					local args = {
						[1] = "BuySuperhuman"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
				if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 then
					local args = {
						[1] = "BuySuperhuman"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end 
			end
		end
	end
end)

--	spawn(function()
--		pcall(function()
--		while wait(.1) do
--			if _G.Superhuman then
--				local args = {
--					[1] = "BuySuperhuman"
--				}
--				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
--				-----------------
--				local MyLevel = game.Players.LocalPlayer.Data.Level.Value
--				if MyLevel >= 1100 then
--					if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") then
--				_G.autoraid = false
--					else
--						_G.AutoFarm = false
--						_G.CHIP = "Flame"
--						_G.autoraid = true
--							local args = {
--								[1] = "BlackbeardReward",
--								[2] = "DragonClaw",
--								[3] = "1"
--							}
--						
--							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
--							local args = {
--								[1] = "BlackbeardReward",
--								[2] = "DragonClaw",
--								[3] = "2"
--							}
--						
--							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
--					end
--				end
--  			end
--     		end
--       	end)
--       end) 
main:Toggle("Auto Death Step",false,function(vu)
	_G.DeathStep = vu
end)
spawn(function()
	while wait() do wait()
		if _G.DeathStep then
			if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") or game.Players.LocalPlayer.Character:FindFirstChild("Death Step") then
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 450 then
					local args = {
						[1] = "BuyDeathStep"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					_G.SelectWeapon = "Death Step"
				end  
				if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 450 then
					local args = {
						[1] = "BuyDeathStep"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

					_G.SelectWeapon = "Death Step"
				end  
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 449 then
					_G.SelectWeapon = "Black Leg"
				end 
			else 
				local args = {
					[1] = "BuyBlackLeg"
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end
		end
	end
end)

main:Toggle("Auto Electric Claw V2",false,function(x)
	_G.AutoElectricClawV2 = x
end)

spawn(function()
	while wait() do wait()
		if _G.AutoElectricClawV2 then
			if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") then
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
					_G.SelectWeapon = "Electric Claw"
				end  
				if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")

					_G.SelectWeapon = "Electric Claw"
				end  
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 399 then
					_G.SelectWeapon = "Electro"
				end 
			else
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
			end
		end
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			if _G.AutoElectricClawV2 then
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") then
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
						if _G.FarmLevel == false then
							repeat wait()
								totarget(CFrame.new(-10371.4717, 330.764496, -10131.4199))
							until _G.StopTween == true or not _G.AutoElectricClawV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start")
							wait(2)
							repeat wait()
								totarget(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))
							until _G.StopTween == true or not _G.AutoElectricClawV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position).Magnitude <= 10
							wait(1)
							repeat wait()
								totarget(CFrame.new(-10371.4717, 330.764496, -10131.4199))
							until _G.StopTween == true or not _G.AutoElectricClawV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
							wait(1)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
						elseif _G.FarmLevel == true then
							_G.FarmLevel = false
							wait(1)
							repeat wait()
								totarget(CFrame.new(-10371.4717, 330.764496, -10131.4199))
							until _G.StopTween == true or not _G.AutoElectricClawV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start")
							wait(2)
							repeat wait()
								totarget(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))
							until _G.StopTween == true or not _G.AutoElectricClawV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position).Magnitude <= 10
							wait(1)
							repeat wait()
								totarget(CFrame.new(-10371.4717, 330.764496, -10131.4199))
							until _G.StopTween == true or not _G.AutoElectricClawV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
							wait(1)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
							_G.SelectWeapon = "Electric Claw"
							wait(.1)
							_G.FarmLevel = true
						end
					end
				end
			end
		end)
	end
end)

if world3 then
	main:Toggle("Auto Elite Hunter",false,function (t)
		_G.EliteHunt = t
	end)
	spawn(function()
		while wait() do
			if  _G.EliteHunt then
				if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					repeat totarget(CFrame.new(-5418.892578125, 313.74130249023, -2826.2260742188)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5418.892578125, 313.74130249023, -2826.2260742188)).Magnitude <= 10
					wait(.5)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
				else
					if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Diablo (0/1)" then
						if game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Diablo [Lv. 1750]" then
									repeat wait()
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											local args = {
												[1] = "Buso"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
										EquipWeapon(_G.SelectWeapon)
										totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
										if setsimulationradius then
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
										end
										v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(50,50,50)
										v.Humanoid:ChangeState(11)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									until _G.EliteHunt == false or v.Humanoid.Health <= 0
								end
							end
						else
							spawn(function()
								totarget(game:GetService("ReplicatedStorage")["Diablo [Lv. 1750]"].HumanoidRootPart.CFrame *CFrame.new(0,0,15))
							end)
						end
					elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Deandre (0/1)" then
						if game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Deandre [Lv. 1750]" then
									repeat wait()
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											local args = {
												[1] = "Buso"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
										EquipWeapon(_G.SelectWeapon)
										totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
										if setsimulationradius then
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
										end
										v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(50,50,50)
										v.Humanoid:ChangeState(11)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									until _G.EliteHunt == false or v.Humanoid.Health <= 0
								end
							end
						else
							spawn(function()
								totarget(game:GetService("ReplicatedStorage")["Deandre [Lv. 1750]"].HumanoidRootPart.CFrame *CFrame.new(0,0,15))
							end)
						end
					elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Urban (0/1)" then
						if game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Urban [Lv. 1750]" then
									repeat wait()
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											local args = {
												[1] = "Buso"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
										EquipWeapon(_G.SelectWeapon)
										totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
										if setsimulationradius then
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
										end
										v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(50,50,50)
										v.Humanoid:ChangeState(11)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									until _G.EliteHunt == false or v.Humanoid.Health <= 0
								end
							end
						else
							spawn(function()
								totarget(game:GetService("ReplicatedStorage")["Urban [Lv. 1750]"].HumanoidRootPart.CFrame *CFrame.new(0,0,15))
							end)
						end
					end
				end
			end
		end
	end)
end
spawn(function()
	while wait() do
		if _G.EliteHunt then
			local noclip = Instance.new('Part',workspace)
			noclip.Name = "noclip"
			noclip.CanCollide = true
			noclip.Anchored = true
			noclip.Size = Vector3.new(30,0,30)
			noclip.Transparency = 1
			game:GetService("Workspace")["noclip"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  * CFrame.new(0,-5,0)
		end	
	end
end)
if world3 then
	main:Toggle("Auto Elite Hunter(Hop)",false,function (t)
		_G.ElitehuntHop = t
	end)
	spawn(function()
		while wait() do
			if  _G.ElitehuntHop then
				if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					repeat totarget(CFrame.new(-5418.892578125, 313.74130249023, -2826.2260742188)) wait() until _G.StopTween == true or not _G.AutoSaber or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5418.892578125, 313.74130249023, -2826.2260742188)).Magnitude <= 10
					wait(.5)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
				else
					if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Diablo (0/1)" then
						if game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Diablo [Lv. 1750]" then
									repeat wait()
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											local args = {
												[1] = "Buso"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
										EquipWeapon(_G.SelectWeapon)
										totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
										if setsimulationradius then
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
										end
										v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(50,50,50)
										v.Humanoid:ChangeState(11)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									until _G.ElitehuntHop == false or v.Humanoid.Health <= 0
								end
							end
						else
							spawn(function()
								totarget(game:GetService("ReplicatedStorage")["Diablo [Lv. 1750]"].HumanoidRootPart.CFrame *CFrame.new(0,0,15))
							end)
						end
					elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Deandre (0/1)" then
						if game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Deandre [Lv. 1750]" then
									repeat wait()
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											local args = {
												[1] = "Buso"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
										EquipWeapon(_G.SelectWeapon)
										totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
										if setsimulationradius then
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
										end
										v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(50,50,50)
										v.Humanoid:ChangeState(11)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									until _G.ElitehuntHop == false or v.Humanoid.Health <= 0
								end
							end
						else
							spawn(function()
								totarget(game:GetService("ReplicatedStorage")["Deandre [Lv. 1750]"].HumanoidRootPart.CFrame *CFrame.new(0,0,15))
							end)
						end
					elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Urban (0/1)" then
						if game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Urban [Lv. 1750]" then
									repeat wait()
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											local args = {
												[1] = "Buso"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
										EquipWeapon(_G.SelectWeapon)
										totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
										if setsimulationradius then
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
										end
										v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(50,50,50)
										v.Humanoid:ChangeState(11)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									until _G.ElitehuntHop == false or v.Humanoid.Health <= 0
								end
							end
						else
							spawn(function()
								totarget(game:GetService("ReplicatedStorage")["Urban [Lv. 1750]"].HumanoidRootPart.CFrame *CFrame.new(0,0,15))
							end)
						end
					end
				end
			end
		end
	end)
end

spawn(function()
	while wait() do
		if _G.ElitehuntHop then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") then
				else
					wait(12)
					if not game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") then
						local PlaceID = game.PlaceId
						local AllIDs = {}
						local foundAnything = ""
						local actualHour = os.date("!*t").hour
						local Deleted = false
						function TPReturner()
							local Site;
							if foundAnything == "" then
								Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
							else
								Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
							end
							local ID = ""
							if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
								foundAnything = Site.nextPageCursor
							end
							local num = 0;
							for i,v in pairs(Site.data) do
								local Possible = true
								ID = tostring(v.id)
								if tonumber(v.maxPlayers) > tonumber(v.playing) then
									for _,Existing in pairs(AllIDs) do
										if num ~= 0 then
											if ID == tostring(Existing) then
												Possible = false
											end
										else
											if tonumber(actualHour) ~= tonumber(Existing) then
												local delFile = pcall(function()
													-- delfile("NotSameServers.json")
													AllIDs = {}
													table.insert(AllIDs, actualHour)
												end)
											end
										end
										num = num + 1
									end
									if Possible == true then
										table.insert(AllIDs, ID)
										wait()
										pcall(function()
											-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
											wait()
											game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
										end)
										wait(4)
									end
								end
							end
						end
						function Teleport() 
							while wait() do
								pcall(function()
									TPReturner()
									if foundAnything ~= "" then
										TPReturner()
									end
								end)
							end
						end
						Teleport()
					end
				end
			end) 
		end
	end
end)
if world3 then
	main:Toggle("Auto Rainbow Haki",false,function(t)
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
		rainbowhaki = t
	end)
	spawn(function()
		while wait() do
			if rainbowhaki then
				if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					repeat wait()
						totarget(CFrame.new(-11891.202148438, 930.57678222656, -8760.0498046875))
					until _G.StopTween == true or not rainbowhaki or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-11891.202148438, 930.57678222656, -8760.0498046875).Position).Magnitude <= 10
					wait(.5)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan")
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
				else
					if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Stone (0/1)" then
						if game:GetService("Workspace").Enemies:FindFirstChild("Stone [Lv. 1550] [Boss]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Stone [Lv. 1550] [Boss]" then
									if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
										local args = {
											[1] = "Buso"
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end
									EquipWeapon(_G.SelectWeapon)
									totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(50,50,50)
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								end
							end
						else
							totarget(CFrame.new(-1109.6944580078, 40.006885528564, 6730.9833984375))
						end
					elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Island Empress (0/1)" then
						if game:GetService("Workspace").Enemies:FindFirstChild("Island Empress [Lv. 1675] [Boss]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Island Empress [Lv. 1675] [Boss]" then
									if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
										local args = {
											[1] = "Buso"
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end
									EquipWeapon(_G.SelectWeapon)
									totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(50,50,50)
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								end
							end
						else
							totarget(CFrame.new(5702.2724609375, 601.94860839844, 201.07873535156))
						end
					elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Kilo Admiral (0/1)" then
						if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral [Lv. 1750] [Boss]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Kilo Admiral [Lv. 1750] [Boss]" then
									if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
										local args = {
											[1] = "Buso"
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end
									EquipWeapon(_G.SelectWeapon)
									totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(50,50,50)
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								end
							end
						else
							totarget(CFrame.new(2861.53515625, 423.58441162109, -7254.0751953125))
						end
					elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Captain Elephant (0/1)" then
						if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Captain Elephant [Lv. 1875] [Boss]" then
									if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
										local args = {
											[1] = "Buso"
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end
									EquipWeapon(_G.SelectWeapon)
									totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(50,50,50)
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								end
							end
						else
							totarget(CFrame.new(-13493.12890625, 318.89553833008, -8373.7919921875))
						end
					elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Beautiful Pirate (0/1)" then
						if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Beautiful Pirate [Lv. 1950] [Boss]" then
									if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
										local args = {
											[1] = "Buso"
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end
									EquipWeapon(_G.SelectWeapon)

									totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(50,50,50)
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								end
							end
						else
							totarget(CFrame.new(5378.6337890625, 22.56223487854, -26.053804397583))
						end
					end
				end
			end
		end
	end)
end

main:Toggle("Auto Observation V2",false,function(x)
	_G.AutoObservationHakiV2 = x
end)

spawn(function()
	while wait() do
		if _G.AutoObservationHakiV2 then
			if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				repeat 
					totarget(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)) 
					wait() 
				until _G.StopTween == true or not _G.AutoObservationHakiV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude <= 10
				wait(.5)
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
				wait(1)
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)
			else
				if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Defeat 50 Forest Pirates") then
					if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate [Lv. 1825]") then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == "Forest Pirate [Lv. 1825]" then
								repeat wait()
									if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
									end
									EquipWeapon(_G.SelectWeapon)
									totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
									PosHee =  v.HumanoidRootPart.CFrame
									if sethiddenproperty then
										sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
									end
									v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(50,50,50)
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									StatrMagnet = true
								until _G.AutoObservationHakiV2 == false or v.Humanoid.Health <= 0
								StatrMagnet = false
							end
						end
					else
						repeat 
							totarget(CFrame.new(-13277.568359375, 370.34185791016, -7821.1572265625)) 
							wait() 
						until _G.StopTween == true or not _G.AutoObservationHakiV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-13277.568359375, 370.34185791016, -7821.1572265625)).Magnitude <= 10
					end
				elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text ==  "Defeat  Captain Elephant (0/1)" then 
					if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == "Captain Elephant [Lv. 1875] [Boss]" then
								repeat wait()
									if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
									end
									EquipWeapon(_G.SelectWeapon)
									totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))										
									if sethiddenproperty then
										sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
									end
									v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(50,50,50)
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								until _G.AutoObservationHakiV2 == false or v.Humanoid.Health <= 0
							end
						end
					else
						repeat 
							totarget(CFrame.new(-13493.12890625, 318.89553833008, -8373.7919921875)) 
							wait() 
						until _G.StopTween == true or not _G.AutoObservationHakiV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-13493.12890625, 318.89553833008, -8373.7919921875)).Magnitude <= 10
					end        
				end
			end
			if game.Players.LocalPlayer.Backpack:FindFirstChild("Banana") and  game.Players.LocalPlayer.Backpack:FindFirstChild("Apple") and game.Players.LocalPlayer.Backpack:FindFirstChild("Pineapple") then
				repeat 
					totarget(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)) 
					wait() 
				until _G.StopTween == true or not _G.AutoObservationHakiV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude <= 10
				wait(.5)
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
			elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or game.Players.LocalPlayer.Character:FindFirstChild("Fruit Bowl") then
				repeat 
					totarget(CFrame.new(-10920.125, 624.20275878906, -10266.995117188)) 
					wait() 
				until _G.StopTween == true or not _G.AutoObservationHakiV2 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-10920.125, 624.20275878906, -10266.995117188)).Magnitude <= 10
				wait(.5)
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Start")
				wait(1)
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Buy")
			else
				for i,v in pairs(game.Workspace:GetDescendants()) do
					if v.Name == "Apple" or v.Name == "Banana" or v.Name == "Pineapple" then
						v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10)
						wait()
						firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,0)    
						wait()
					end
				end   
			end
		end
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			if _G.AutoObservationHakiV2 then
				if sethiddenproperty then
					sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
				end
			end
		end)
		game:GetService("RunService").Heartbeat:Wait()
	end
end)

spawn(function()
	game:GetService("RunService").Heartbeat:connect(function()
		pcall(function()
			if _G.AutoObservationHakiV2 then
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
				end
			end
		end)
	end)
end)

spawn(function()
	pcall(function()
		game:GetService("RunService").Heartbeat:Connect(function()
			game:GetService("RunService").Heartbeat:Wait()
			if _G.AutoObservationHakiV2 and StatrMagnet then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if v.Name == "Forest Pirate [Lv. 1825]" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
						if v.Name == "Forest Pirate [Lv. 1825]" then
							v.HumanoidRootPart.CanCollide = false
							v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
							v.HumanoidRootPart.CFrame = PosHee
						end
					end
				end
			end
		end)
	end)
end)

spawn(function()
	game:GetService("RunService").Heartbeat:connect(function()
		game:GetService("RunService").Heartbeat:Wait()
		pcall(function()
			if _G.AutoObservationHakiV2 and StatrMagnet then
				cq()
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if v.Name == Ms then
						v.Humanoid:ChangeState(11)
					end
				end
			end
		end)
		game:GetService("RunService").Heartbeat:Wait()
	end)
end)

spawn(function()
	while wait() do
		pcall(function()
			if _G.AutoObservationHakiV2 and StatrMagnet then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if v.Name == Ms and v:FindFirstChild("HumanoidRootPart") then
						if not v.HumanoidRootPart:FindFirstChild("BringEE") then
							local bv = Instance.new("BodyVelocity")
							bv.Parent = v.HumanoidRootPart
							bv.Name = "BringEE"
							bv.MaxForce = Vector3.new(100000,100000,100000)
							bv.Velocity = Vector3.new(0,0,0)
						end
					end
				end
			end
		end)
		wait()
	end
end)
if world3 then
	main:Toggle("Auto Yama (Hop)",false,function(t)
		_G.YamaHop = t
	end)
end

spawn(function()
	while wait() do
		pcall(function()
			if _G.YamaHop then
				if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress") >= 30 then
					fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
				else
					if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
						repeat totarget(CFrame.new(-5418.892578125, 313.74130249023, -2826.2260742188)) wait() until _G.StopTween == true or not _G.YamaHop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5418.892578125, 313.74130249023, -2826.2260742188)).Magnitude <= 10
						wait(.9)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
					else
						if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Diablo (0/1)" then
							if game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Diablo [Lv. 1750]" then
										repeat wait()
											if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
											end
											EquipWeapon(_G.SelectWeapon)
											totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(50,50,50)
											v.Humanoid:ChangeState(11)
											_G.FastBoss = true
										until _G.YamaHop == false or v.Humanoid.Health <= 0
										_G.FastBoss = false
									end
								end
							else
								spawn(function()
									totarget(game:GetService("ReplicatedStorage")["Diablo [Lv. 1750]"].HumanoidRootPart.CFrame *CFrame.new(0,0,15))
								end)
							end
						elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Deandre (0/1)" then
							if game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Deandre [Lv. 1750]" then
										repeat wait()
											if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
											end
											EquipWeapon(_G.SelectWeapon)
											totarget(v.HumanoidRootPart.Position + Vector3.new(1,20,1) , v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))												
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(50,50,50)
											v.Humanoid:ChangeState(11)
											_G.FastBoss = true
										until _G.YamaHop == false or v.Humanoid.Health <= 0
										_G.FastBoss = false
									end
								end
							else
								spawn(function()
									totarget(game:GetService("ReplicatedStorage")["Deandre [Lv. 1750]"].HumanoidRootPart.CFrame *CFrame.new(0,0,15))
								end)
							end
						elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Urban (0/1)" then
							if game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Urban [Lv. 1750]" then
										repeat wait()
											if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
											end
											EquipWeapon(_G.SelectWeapon)
											totarget(v.HumanoidRootPart.Position + Vector3.new(1,20,1) , v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))												
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(50,50,50)
											v.Humanoid:ChangeState(11)
											_G.FastBoss = true
										until _G.YamaHop == false or v.Humanoid.Health <= 0
										_G.FastBoss = false
									end
								end
							else
								spawn(function()
									totarget(game:GetService("ReplicatedStorage")["Urban [Lv. 1750]"].HumanoidRootPart.CFrame *CFrame.new(0,0,15))
								end)
							end
						end
					end
				end
			end
		end)
	end
end)
if world3 then
	main:Toggle("Auto Tushita (Hop)",_G.Tushitahop,function(t)
		_G.Tushitahop = t
	end)
end

spawn(function()
	while wait(.1) do
		if _G.Tushitahop then
			autoTushita()
		end
	end
end)


function enemyrip()
	totarget(CFrame.new(-5332.30371, 423.985413, -2673.48218))
	wait()
	if game.Workspace.Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
		local mobs = game.Workspace.Enemies:GetChildren()
		for i,v in pairs(mobs) do
			if v.Name == "rip_indra True Form [Lv. 5000] [Raid Boss]" and v:IsA("Model") and v:FindFirstChild("Humanoid") and
				v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
				return v
			end
		end
	end
	return game.ReplicatedStorage:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]")
end
function enemyEliteBoss()
	if game.Workspace.Enemies:FindFirstChild("Deandre [Lv. 1750]") or game.Workspace.Enemies:FindFirstChild("Urban [Lv. 1750]") or game.Workspace.Enemies:FindFirstChild("Diablo [Lv. 1750]") then
		local mobs = game.Workspace.Enemies:GetChildren()
		for i,v in pairs(mobs) do
			if v.Name == "Deandre [Lv. 1750]" or v.Name == "Diablo [Lv. 1750]" or v.Name == "Urban [Lv. 1750]"  and v:IsA("Model") and v:FindFirstChild("Humanoid") and
				v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
				return v
			end
		end
	end
	return game.ReplicatedStorage:FindFirstChild("Deandre [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Urban [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Diablo [Lv. 1750]")
end

function enemylongma()
	totarget(CFrame.new(-10171.7051, 406.981995, -9552.31738))
	if game.Workspace.Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]") then
		local mobs = game.Workspace.Enemies:GetChildren()
		for i,v in pairs(mobs) do
			if v.Name == "Longma [Lv. 2000] [Boss]" and v:IsA("Model") and v:FindFirstChild("Humanoid") and
				v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
				return v
			end
		end
	end
	return game.ReplicatedStorage:FindFirstChild("Longma [Lv. 2000] [Boss]")
end

_G.checkup = true
function autoTushita()
	if _G.checkup and not game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") and not game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
		if game.Workspace.Enemies:FindFirstChild("Deandre [Lv. 1750]") or game.Workspace.Enemies:FindFirstChild("Urban [Lv. 1750]") or game.Workspace.Enemies:FindFirstChild("Diablo [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Deandre [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Urban [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Diablo [Lv. 1750]") then
			if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				_G.FastBoss = false
				repeat totarget(CFrame.new(5420.49219, 314.446045, -2823.07373)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
				wait(1)
				repeat totarget(CFrame.new(5420.49219, 314.446045, -2823.07373)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
				wait(1.1)
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
				wait(1)
			elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
				cq()
				pcall(function()
					EquipWeapon(_G.SelectWeapon)
					pcall(function()
						local v = enemyEliteBoss()
						v.HumanoidRootPart.CanCollide = false
						v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
						totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
						_G.FastBoss = true
					end)
				end)
			end
		elseif _G.ServerHop then
			_G.FastBoss = false
			totarget(CFrame.new(-12554.9443, 337.194092, -7501.44727))
			wait(1)
			Hopey()
		end
	elseif game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
		_G.checkup = false
		_G.FastBoss = false
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Winter Sky")
		wait(0.5)
		repeat totarget(CFrame.new(-5420.16602, 1084.9657, -2666.8208)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5420.16602, 1084.9657, -2666.8208)).Magnitude <= 10
		wait(0.5)
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Pure Red")
		wait(0.5)
		repeat totarget(CFrame.new(-5414.41357, 309.865753, -2212.45776)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5414.41357, 309.865753, -2212.45776)).Magnitude <= 10
		wait(0.5)
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Snow White")
		wait(0.5)
		repeat totarget(CFrame.new(-4971.47559, 331.565765, -3720.02954)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-4971.47559, 331.565765, -3720.02954)).Magnitude <= 10
		wait(0.5)
		EquipWeapon("God's Chalice")
		wait(0.5)
		repeat totarget(CFrame.new(-5560.27295, 313.915466, -2663.89795)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5560.27295, 313.915466, -2663.89795)).Magnitude <= 10
		wait(0.5)
		repeat totarget(CFrame.new(-5561.37451, 313.342529, -2663.4948)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
		wait(1)
		repeat totarget(CFrame.new(5154.17676, 141.786423, 911.046326)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
		wait(0.2)
		repeat totarget(CFrame.new(5148.03613, 162.352493, 910.548218)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
		wait(1)
		EquipWeapon("Holy Torch")
		wait(1)
		wait(0.4)
		repeat totarget(CFrame.new(-10752.7695, 412.229523, -9366.36328)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
		wait(0.4)
		repeat totarget(CFrame.new(-11673.4111, 331.749023, -9474.34668)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
		wait(0.4)
		repeat totarget(CFrame.new(-12133.3389, 519.47522, -10653.1904)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
		wait(0.4)
		repeat totarget(CFrame.new(-13336.5, 485.280396, -6983.35254)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
		wait(0.4)
		repeat totarget(CFrame.new(-13487.4131, 334.84845, -7926.34863)) wait() until _G.StopTween == true or not _G.Tushitahop or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
		wait(1)
	elseif game.Workspace.Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]") or game.ReplicatedStorage:FindFirstChild("Longma [Lv. 2000] [Boss]") then
		pcall(function()
			EquipWeapon(_G.SelectWeapon)
			pcall(function()
				local v = enemylongma()
				v.HumanoidRootPart.CanCollide = false
				v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
				totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
				_G.FastBoss = true
			end)
		end)
	elseif game.Workspace.Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]")  or game.ReplicatedStorage:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
		pcall(function()
			EquipWeapon(_G.SelectWeapon)
			pcall(function()
				local v = enemyrip()
				v.HumanoidRootPart.CanCollide = false
				v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
				totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
				_G.FastBoss = true
			end)
		end)
	elseif _G.ServerHop then
		_G.FastBoss = false
		totarget(CFrame.new(-12554.9443, 337.194092, -7501.44727))
		wait(1)
		Hopey()  
	end
end
if world3 then
	main:Toggle("Auto Beautiful Pirate",false,function(vu)
		totarget(CFrame.new(5310.80957, 22.5622349, 129.390533))
		_G.Cave = vu
	end)
	spawn(function()
		while wait() do
			if _G.Cave then
				if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Beautiful Pirate [Lv. 1950] [Boss]" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
							repeat wait()
								pcall(function()
									if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
										local args = {
											[1] = "Buso"
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end
									EquipWeapon(_G.SelectWeapon)
									v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
									v.HumanoidRootPart.CanCollide = false
									totarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1))
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								end)
							until _G.Cave == false or v.Humanoid.Health <= 0
						end
					end
				end
			end
		end
	end)
end
spawn(function()
	while wait() do
		if _G.YamaHop then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") then
				else
					wait(12)
					if not game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") then
						local PlaceID = game.PlaceId
						local AllIDs = {}
						local foundAnything = ""
						local actualHour = os.date("!*t").hour
						local Deleted = false
						function TPReturner()
							local Site;
							if foundAnything == "" then
								Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
							else
								Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
							end
							local ID = ""
							if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
								foundAnything = Site.nextPageCursor
							end
							local num = 0;
							for i,v in pairs(Site.data) do
								local Possible = true
								ID = tostring(v.id)
								if tonumber(v.maxPlayers) > tonumber(v.playing) then
									for _,Existing in pairs(AllIDs) do
										if num ~= 0 then
											if ID == tostring(Existing) then
												Possible = false
											end
										else
											if tonumber(actualHour) ~= tonumber(Existing) then
												local delFile = pcall(function()
													-- delfile("NotSameServers.json")
													AllIDs = {}
													table.insert(AllIDs, actualHour)
												end)
											end
										end
										num = num + 1
									end
									if Possible == true then
										table.insert(AllIDs, ID)
										wait()
										pcall(function()
											-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
											wait()
											game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
										end)
										wait(4)
									end
								end
							end
						end
						function Teleport() 
							while wait() do
								pcall(function()
									TPReturner()
									if foundAnything ~= "" then
										TPReturner()
									end
								end)
							end
						end
						Teleport()
					end
				end
			end) 
		end
	end
end)
 main:Toggle("Auto Farm Candy", false, function(vu)
		_G.AutoBone = vu
		if vu == false then
			wait(1)
			TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
		end
	end)
	spawn(function()
	while wait(.1) do
		pcall(function()
			if _G.AutoBone then
				if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Domenic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]" then
							if v:WaitForChild("Humanoid").Health > 0 then
								repeat game:GetService("RunService").Heartbeat:wait()
									EquipWeapon(_G.SelectWeapon)
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,30,15)
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									game:GetService("VirtualUser"):CaptureController()
									game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670),workspace.CurrentCamera.CFrame)
									MainMonBone = v.HumanoidRootPart.CFrame
									BoneMagnet = true
								until _G.AutoBone == false or not v.Parent or v.Humanoid.Health <= 0
							end
						end
					end
				else
					BoneMagnet = false
					TP(CFrame.new(-9501.64453, 582.052612, 6034.20117))
				end
			end
		end)
	end
end)
main:Toggle("AutoBartilo",false,function(vu)
    AutoBartilo = vu
    if vu == false then
            TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end
end)
spawn(function()
    while wait(.1) do
        if AutoBartilo then
            if game.Players.LocalPlayer.Data.Level.Value >= 850 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
                if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then 
                    if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Swan Pirate [Lv. 775]" then
                                pcall(function()
                                    repeat wait(.1)
                                        EquipWeapon(_G.SelectWeapona)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										TP(v.HumanoidRootPart.CFrame * CFrame.new(0,15,0))
										require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
										PosMonBartilo = v.HumanoidRootPart.CFrame
										MagnetBatilo = true
                                    until not v.Parent or v.Humanoid.Health <= 0 or AutoBartilo == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
									MagnetBatilo = false
                                end)
                            end
                        end
                    else
						MagnetBatilo = false
						TP(CFrame.new(1057.92761, 137.614319, 1242.08069))
                    end
                else
					TP2(CFrame.new(-456.28952, 73.0200958, 299.895966))
					if (Vector3.new(-456.28952, 73.0200958, 299.895966) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
						wait(1.1)
                    	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)
					end
                end
            elseif game.Players.LocalPlayer.Data.Level.Value >= 850 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
                if QuestBartilo == nil then
				    TP2(CFrame.new(-456.28952, 73.0200958, 299.895966))
                end
                if (Vector3.new(-456.28952, 73.0200958, 299.895966) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                    wait(1.1)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo")
                    QuestBartilo = 1
                end
				if game.Workspace.Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
					for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
						if v.Name == "Jeremy [Lv. 850] [Boss]" then
							repeat wait(.1)
								sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
								require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
								EquipWeapon(MiscFarmWeapon)
								TP(v.HumanoidRootPart.CFrame * CFrame.new(0,15,6))
								game:GetService'VirtualUser':CaptureController()
								game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
							until not v.Parent or v.Humanoid.Health <= 0 or AutoBartilo == false
						end
					end
                else
                    if QuestBartilo == 1 then
                        TP(CFrame.new(1931.5931396484, 402.67391967773, 956.52215576172))
                    end
				end
            elseif game.Players.LocalPlayer.Data.Level.Value >= 850 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
                TP2(game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate1.CFrame)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate2.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate3.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate4.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate5.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate6.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate7.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate8.CFrame
                wait(1)
            end
        end 
    end
end)
SelectToolWeapon = ""
  function EquipWeapon(ToolSe)
     if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
     end
  end
Wapon = {}
	for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
		if v:IsA("Tool") then
			table.insert(Wapon ,v.Name)
		end
	end
	for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
		if v:IsA("Tool") then
			table.insert(Wapon, v.Name)
		end
	end
	local SelectWeapona = main:Dropdown("Select Weapon",Wapon,function(Value)
		_G.SelectWeapon = Value
		_G.SelectToolWeaponOld = Value
	end)
	main:Button("Refresh Weapon",function()
		SelectWeapona:Clear()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
			if v:IsA("Tool") then
				SelectWeapona:Add(v.Name)
			end
		end
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
			if v:IsA("Tool") then
				SelectWeapona:Add(v.Name)
			end
		end
	end)
main:Line()
	main:Label("Auto Accessories")
	WaponAccessories = {} 
	for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
		if v:IsA("Tool") then 
			if v.ToolTip == "Wear" then    
				table.insert(WaponAccessories, v.Name)
			end
		end
	end
	SelectTooAccessories = ""
	main:Toggle("Auto Accessories",false,function(Value)
		AutoAccessories = Value 
	end)
	spawn(function()
		while wait() do
			if AutoAccessories then
				CheckAccessories = game.Players.LocalPlayer.Character 
				if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
					if CheckAccessories:FindFirstChild("CoolShades") or CheckAccessories:FindFirstChild("BlackSpikeyCape") or CheckAccessories:FindFirstChild("BlueSpikeyCape") or CheckAccessories:FindFirstChild("RedSpikeyCape") or CheckAccessories:FindFirstChild("Chopper") or CheckAccessories:FindFirstChild("MarineCape") or CheckAccessories:FindFirstChild("GhoulMask") or CheckAccessories:FindFirstChild("MarineCap") or CheckAccessories:FindFirstChild("PinkCape") or CheckAccessories:FindFirstChild("SaboTopHat") or CheckAccessories:FindFirstChild("SwanGlasses") or CheckAccessories:FindFirstChild("UsoapHat") or CheckAccessories:FindFirstChild("Corrida") or CheckAccessories:FindFirstChild("ZebraCap") or CheckAccessories:FindFirstChild("TomoeRing") or CheckAccessories:FindFirstChild("BlackCape") or CheckAccessories:FindFirstChild("SwordsmanHat") or CheckAccessories:FindFirstChild("SantaHat") or CheckAccessories:FindFirstChild("ElfHat") or CheckAccessories:FindFirstChild("DarkCoat") or CheckAccessories:FindFirstChild("Valkyrie Helm") then
					else
						EquipWeapon(SelectTooAccessories)
						wait(0.1)
						game:GetService'VirtualUser':CaptureController()
						game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
						wait(0.1)
						if game.Players.LocalPlayer.Character:FindFirstChild(SelectTooAccessories) then
							game.Players.LocalPlayer.Character:FindFirstChild(SelectTooAccessories).Parent = game.Players.LocalPlayer:FindFirstChild("Backpack")
						end
						wait(1)
					end
				end
			end
		end
	end)

	local SelectAccessories = main:Dropdown("Select Accessories",WaponAccessories,function(Value)
		SelectTooAccessories = Value
	end)
	main:Button("Refresh Accessories",function()
		SelectAccessories:Clear()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") then 
				if v.ToolTip == "Wear" then    
					SelectAccessories:Add(v.Name)
				end
			end
		end
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") then 
				if v.ToolTip == "Wear" then    
					SelectAccessories:Add(v.Name)
				end
			end
		end
	end)
main:Label("Auto Farm Boss")
	function CheckQuestBoss()
		if SelectBoss == "Diamond [Lv. 750] [Boss]" then
			MsBoss = "Diamond [Lv. 750] [Boss]"
			NaemQuestBoss = "Area1Quest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
			CFrameBoss = CFrame.new(-1736.26587, 198.627731, -236.412857, -0.997808516, 0, -0.0661673471, 0, 1, 0, 0.0661673471, 0, -0.997808516)
		elseif SelectBoss == "Jeremy [Lv. 850] [Boss]" then
			MsBoss = "Jeremy [Lv. 850] [Boss]"
			NaemQuestBoss = "Area2Quest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
			CFrameBoss = CFrame.new(2203.76953, 448.966034, 752.731079, -0.0217453763, 0, -0.999763548, 0, 1, 0, 0.999763548, 0, -0.0217453763)
		elseif SelectBoss == "Fajita [Lv. 925] [Boss]" then
			MsBoss = "Fajita [Lv. 925] [Boss]"
			NaemQuestBoss = "MarineQuest3"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
			CFrameBoss = CFrame.new(-2297.40332, 115.449463, -3946.53833, 0.961227536, -1.46645796e-09, -0.275756449, -2.3212845e-09, 1, -1.34094433e-08, 0.275756449, 1.35296352e-08, 0.961227536)
		elseif SelectBoss == "Don Swan [Lv. 1000] [Boss]" then
			MsBoss = "Don Swan [Lv. 1000] [Boss]"
			CFrameBoss = CFrame.new(2288.802, 15.1870775, 863.034607, 0.99974072, -8.41247214e-08, -0.0227668174, 8.4774733e-08, 1, 2.75850098e-08, 0.0227668174, -2.95079072e-08, 0.99974072)
		elseif SelectBoss == "Smoke Admiral [Lv. 1150] [Boss]" then
			MsBoss = "Smoke Admiral [Lv. 1150] [Boss]"
			NaemQuestBoss = "IceSideQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-6059.96191, 15.9868021, -4904.7373, -0.444992423, -3.0874483e-09, 0.895534337, -3.64098796e-08, 1, -1.4644522e-08, -0.895534337, -3.91229982e-08, -0.444992423)
			CFrameBoss = CFrame.new(-5115.72754, 23.7664986, -5338.2207, 0.251453817, 1.48345061e-08, -0.967869282, 4.02796978e-08, 1, 2.57916977e-08, 0.967869282, -4.54708946e-08, 0.251453817)
		elseif SelectBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" then
			MsBoss = "Cursed Captain [Lv. 1325] [Raid Boss]"
			CFrameBoss = CFrame.new(916.928589, 181.092773, 33422, -0.999505103, 9.26310495e-09, 0.0314563364, 8.42916226e-09, 1, -2.6643713e-08, -0.0314563364, -2.63653774e-08, -0.999505103)
		elseif SelectBoss == "Darkbeard [Lv. 1000] [Raid Boss]" then
			MsBoss = "Darkbeard [Lv. 1000] [Raid Boss]"
			CFrameBoss = CFrame.new(3876.00366, 24.6882591, -3820.21777, -0.976951957, 4.97356325e-08, 0.213458836, 4.57335361e-08, 1, -2.36868622e-08, -0.213458836, -1.33787044e-08, -0.976951957)
		elseif SelectBoss == "Order [Lv. 1250] [Raid Boss]" then
			MsBoss = "Order [Lv. 1250] [Raid Boss]"
			CFrameBoss = CFrame.new(-6221.15039, 16.2351036, -5045.23584, -0.380726993, 7.41463495e-08, 0.924687505, 5.85604774e-08, 1, -5.60738549e-08, -0.924687505, 3.28013137e-08, -0.380726993)
		elseif SelectBoss == "Awakened Ice Admiral [Lv. 1400] [Boss]" then
			MsBoss = "Awakened Ice Admiral [Lv. 1400] [Boss]"
			NaemQuestBoss = "FrostQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(5669.33203, 28.2118053, -6481.55908, 0.921275556, -1.25320829e-08, 0.388910472, 4.72230788e-08, 1, -7.96414241e-08, -0.388910472, 9.17372489e-08, 0.921275556)
			CFrameBoss = CFrame.new(6407.33936, 340.223785, -6892.521, 0.49051559, -5.25310213e-08, -0.871432424, -2.76146022e-08, 1, -7.58250565e-08, 0.871432424, 6.12576301e-08, 0.49051559)
		elseif SelectBoss == "Tide Keeper [Lv. 1475] [Boss]" then
			MsBoss = "Tide Keeper [Lv. 1475] [Boss]"
			NaemQuestBoss = "ForgottenQuest"             
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-3053.89648, 236.881363, -10148.2324, -0.985987961, -3.58504737e-09, 0.16681771, -3.07832915e-09, 1, 3.29612559e-09, -0.16681771, 2.73641976e-09, -0.985987961)
			CFrameBoss = CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202)
			-- Old World
		elseif SelectBoss == "Saber Expert [Lv. 200] [Boss]" then
			MsBoss = "Saber Expert [Lv. 200] [Boss]"
			CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564, 0.858821094, 1.13848939e-08, 0.512275636, -4.85649254e-09, 1, -1.40823326e-08, -0.512275636, 9.6063415e-09, 0.858821094)
		elseif SelectBoss == "The Saw [Lv. 100] [Boss]" then
			MsBoss = "The Saw [Lv. 100] [Boss]"
			CFrameBoss = CFrame.new(-683.519897, 13.8534927, 1610.87854, -0.290192783, 6.88365773e-08, 0.956968188, 6.98413629e-08, 1, -5.07531119e-08, -0.956968188, 5.21077759e-08, -0.290192783)
		elseif SelectBoss == "The Gorilla King [Lv. 25] [Boss]" then
			MsBoss = "The Gorilla King [Lv. 25] [Boss]"
			NaemQuestBoss = "JungleQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
			CFrameBoss = CFrame.new(-1223.52808, 6.27936459, -502.292664, 0.310949147, -5.66602516e-08, 0.950426519, -3.37275488e-08, 1, 7.06501808e-08, -0.950426519, -5.40241736e-08, 0.310949147)
		elseif SelectBoss == "Bobby [Lv. 55] [Boss]" then
			MsBoss = "Bobby [Lv. 55] [Boss]"
			NaemQuestBoss = "BuggyQuest1"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
			CFrameBoss = CFrame.new(-1147.65173, 32.5966301, 4156.02588, 0.956680477, -1.77109952e-10, -0.29113996, 5.16530874e-10, 1, 1.08897802e-09, 0.29113996, -1.19218679e-09, 0.956680477)
		elseif SelectBoss == "Yeti [Lv. 110] [Boss]" then
			MsBoss = "Yeti [Lv. 110] [Boss]"
			NaemQuestBoss = "SnowQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(1384.90247, 87.3078308, -1296.6825, 0.280209213, 2.72035177e-08, -0.959938943, -6.75690828e-08, 1, 8.6151708e-09, 0.959938943, 6.24481444e-08, 0.280209213)
			CFrameBoss = CFrame.new(1221.7356, 138.046906, -1488.84082, 0.349343032, -9.49245944e-08, 0.936994851, 6.29478194e-08, 1, 7.7838429e-08, -0.936994851, 3.17894653e-08, 0.349343032)
		elseif SelectBoss == "Mob Leader [Lv. 120] [Boss]" then
			MsBoss = "Mob Leader [Lv. 120] [Boss]"
			CFrameBoss = CFrame.new(-2848.59399, 7.4272871, 5342.44043, -0.928248107, -8.7248246e-08, 0.371961564, -7.61816636e-08, 1, 4.44474857e-08, -0.371961564, 1.29216433e-08, -0.928248107)
			--The Gorilla King [Lv. 25] [Boss]
		elseif SelectBoss == "Vice Admiral [Lv. 130] [Boss]" then
			MsBoss = "Vice Admiral [Lv. 130] [Boss]"
			NaemQuestBoss = "MarineQuest2"
			LevelQuestBoss = 2
			CFrameQuestBoss = CFrame.new(-5035.42285, 28.6520386, 4324.50293, -0.0611100644, -8.08395768e-08, 0.998130739, -1.57416586e-08, 1, 8.00271849e-08, -0.998130739, -1.08217701e-08, -0.0611100644)
			CFrameBoss = CFrame.new(-5078.45898, 99.6520691, 4402.1665, -0.555574954, -9.88630566e-11, 0.831466436, -6.35508286e-08, 1, -4.23449258e-08, -0.831466436, -7.63661632e-08, -0.555574954)
		elseif SelectBoss == "Warden [Lv. 175] [Boss]" then
			MsBoss = "Warden [Lv. 175] [Boss]"
			NaemQuestBoss = "ImpelQuest"
			LevelQuestBoss = 1
			CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
			CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
		elseif SelectBoss == "Chief Warden [Lv. 200] [Boss]" then
			MsBoss = "Chief Warden [Lv. 200] [Boss]"
			NaemQuestBoss = "ImpelQuest"
			LevelQuestBoss = 2
			CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
			CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
		elseif SelectBoss == "Swan [Lv. 225] [Boss]" then
			MsBoss = "Swan [Lv. 225] [Boss]"
			NaemQuestBoss = "ImpelQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
			CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
		elseif SelectBoss == "Magma Admiral [Lv. 350] [Boss]" then
			MsBoss = "Magma Admiral [Lv. 350] [Boss]"
			NaemQuestBoss = "MagmaQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-5317.07666, 12.2721891, 8517.41699, 0.51175487, -2.65508806e-08, -0.859131515, -3.91131572e-08, 1, -5.42026761e-08, 0.859131515, 6.13418294e-08, 0.51175487)
			CFrameBoss = CFrame.new(-5530.12646, 22.8769703, 8859.91309, 0.857838571, 2.23414389e-08, 0.513919294, 1.53689133e-08, 1, -6.91265853e-08, -0.513919294, 6.71978384e-08, 0.857838571)
		elseif SelectBoss == "Fishman Lord [Lv. 425] [Boss]" then
			MsBoss = "Fishman Lord [Lv. 425] [Boss]"
			NaemQuestBoss = "FishmanQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(61123.0859, 18.5066795, 1570.18018, 0.927145958, 1.0624845e-07, 0.374700129, -6.98219367e-08, 1, -1.10790765e-07, -0.374700129, 7.65569368e-08, 0.927145958)
			CFrameBoss = CFrame.new(61351.7773, 31.0306778, 1113.31409, 0.999974668, 0, -0.00714713801, 0, 1.00000012, 0, 0.00714714266, 0, 0.999974549)
		elseif SelectBoss == "Wysper [Lv. 500] [Boss]" then
			MsBoss = "Wysper [Lv. 500] [Boss]"
			NaemQuestBoss = "SkyExp1Quest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-7862.94629, 5545.52832, -379.833954, 0.462944925, 1.45838088e-08, -0.886386991, 1.0534996e-08, 1, 2.19553424e-08, 0.886386991, -1.95022007e-08, 0.462944925)
			CFrameBoss = CFrame.new(-7925.48389, 5550.76074, -636.178345, 0.716468513, -1.22915289e-09, 0.697619379, 3.37381434e-09, 1, -1.70304748e-09, -0.697619379, 3.57381835e-09, 0.716468513)
		elseif SelectBoss == "Thunder God [Lv. 575] [Boss]" then
			MsBoss = "Thunder God [Lv. 575] [Boss]"
			NaemQuestBoss = "SkyExp2Quest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-7902.78613, 5635.99902, -1411.98706, -0.0361216255, -1.16895912e-07, 0.999347389, 1.44533963e-09, 1, 1.17024491e-07, -0.999347389, 5.6715117e-09, -0.0361216255)
			CFrameBoss = CFrame.new(-7917.53613, 5616.61377, -2277.78564, 0.965189934, 4.80563429e-08, -0.261550069, -6.73089886e-08, 1, -6.46515304e-08, 0.261550069, 8.00056768e-08, 0.965189934)
		elseif SelectBoss == "Cyborg [Lv. 675] [Boss]" then
			MsBoss = "Cyborg [Lv. 675] [Boss]"
			NaemQuestBoss = "FountainQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(5253.54834, 38.5361786, 4050.45166, -0.0112687312, -9.93677887e-08, -0.999936521, 2.55291371e-10, 1, -9.93769547e-08, 0.999936521, -1.37512213e-09, -0.0112687312)
			CFrameBoss = CFrame.new(6041.82813, 52.7112198, 3907.45142, -0.563162148, 1.73805248e-09, -0.826346457, -5.94632716e-08, 1, 4.26280238e-08, 0.826346457, 7.31437524e-08, -0.563162148)
			--Three World
		elseif SelectBoss == "Kilo Admiral [Lv. 1750] [Boss]" then
			MsBoss = "Kilo Admiral [Lv. 1750] [Boss]"
			NaemQuestBoss = "MarineTreeIsland"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
			CFrameBoss = CFrame.new(2955.1189, 423.584412, -7240.22217, -0.761679471, 7.01648872e-08, 0.647953987, 8.75833539e-09, 1, -9.79912755e-08, -0.647953987, -6.89629474e-08, -0.761679471)
		elseif SelectBoss == "Captain Elephant [Lv. 1875] [Boss]" then
			MsBoss = "Captain Elephant [Lv. 1875] [Boss]"
			NaemQuestBoss = "DeepForestIsland"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
			CFrameBoss = CFrame.new(-13592.9053, 332.23584, -8134.08643, -0.866908491, -1.7684858e-08, 0.498467356, -3.95491107e-08, 1, -3.33032872e-08, -0.498467356, -4.85848446e-08, -0.866908491)
		elseif SelectBoss == "Beautiful Pirate [Lv. 1950] [Boss]" then
			MsBoss = "Beautiful Pirate [Lv. 1950] [Boss]"
			NaemQuestBoss = "DeepForestIsland2"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
			CFrameBoss = CFrame.new(5310.80957, 22.5622349, 129.390533, 1, -2.47274325e-08, 1.41872977e-13, 2.47274325e-08, 1, -4.55364528e-08, -1.40746979e-13, 4.55364528e-08, 1)
		elseif SelectBoss == "Longma [Lv. 2000] [Boss]" then
			MsBoss = "Longma [Lv. 2000] [Boss]"
			CFrameBoss = CFrame.new(-10293.208, 332.791351, -9450.625, 0.132661447, -0.213521436, -0.96788919, -0.0110089043, 0.976142585, -0.21685116, 0.991100252, 0.0394231752, 0.127145842)
		elseif SelectBoss == "Stone [Lv. 1550] [Boss]" then
			MsBoss = "Stone [Lv. 1550] [Boss]"
			NaemQuestBoss = "PiratePortQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
			CFrameBoss = CFrame.new(-970.778564, 40.0068855, 6795.5249, -0.179641441, -2.87076816e-08, 0.983732164, -4.4126935e-08, 1, 2.11243023e-08, -0.983732164, -3.96142852e-08, -0.179641441)
		elseif SelectBoss == "Island Empress [Lv. 1675] [Boss]" then
			MsBoss = "Island Empress [Lv. 1675] [Boss]"
			NaemQuestBoss = "AmazonQuest2"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameBoss = CFrame.new(5813.94140625, 661.14862060547, 202.04710388184)
		end
	end
	local Boss = {}
	for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
		if string.find(v.Name, "Boss") then
			if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
			else
				table.insert(Boss, v.Name)
			end
		end
	end
	for i, v in pairs(game.workspace.Enemies:GetChildren()) do
		if string.find(v.Name, "Boss") then
			if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
			else
				table.insert(Boss, v.Name)
			end
		end
	end
	local BossName = main:Dropdown("Select Boss",Boss,function(Value)
		SelectBoss = Value
		Don = false
	end)
	local SelectWeaponBoss = "" 
	local SelectWeaponKillBos = main:Dropdown("Select Weapon Kill Boss",Wapon,function(Value)
		_G.SelectWeaponBoss = Value
	end)
	main:Button("Refresh Weapon Boss",function()
		SelectWeaponBoss:Clear()
		for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") then
				SelectWeaponKillBoss:Add(v.Name)
			end
		end
		for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") then
				SelectWeaponBoss:Add(v.Name)
			end
		end
	end)
	main:Button("Refresh Boss",function()
		BossName:Clear()
		for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
			if string.find(v.Name, "Boss") then
				if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
				else
					BossName:Add(v.Name)
				end
			end
		end
		for i, v in pairs(game.workspace.Enemies:GetChildren()) do
			if string.find(v.Name, "Boss") then
				if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
				else
					BossName:Add(v.Name)
				end
			end
		end
	end)
   function AutoFramBoss()
		CheckQuestBoss()
		if SelectBoss == "Don Swan [Lv. 1000] [Boss]" or SelectBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" or SelectBoss == "Saber Expert [Lv. 200] [Boss]" or SelectBoss == "Mob Leader [Lv. 120] [Boss]" or SelectBoss == "Darkbeard [Lv. 1000] [Raid Boss]" or SelectBoss == "Longma [Lv. 2000] [Boss]" then
			if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if _G.FramBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == MsBoss then
						repeat
							pcall(function() wait() 
								if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
									local args = {
										[1] = "Buso"
									}
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								end
								EquipWeapon(_G.SelectWeaponBoss)
								v.HumanoidRootPart.Transparency = 1
								v.HumanoidRootPart.CanCollide = false
								v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
								totarget(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
								game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
								VirtualUser:CaptureController()
								VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
							end)
						until not _G.FramBoss or not v.Parent or v.Humanoid.Health <= 0
					end
				end
			else
				totarget(CFrameBoss)
			end
		elseif SelectBoss == "Order [Lv. 1250] [Raid Boss]" then
			if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if _G.FramBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == MsBoss then
						repeat 
							pcall(function() wait() 
								if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
									local args = {
										[1] = "Buso"
									}
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								end
								EquipWeapon(__G.SelectWeaponBoss)
								v.HumanoidRootPart.Transparency = 1
								v.HumanoidRootPart.CanCollide = false
								v.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
								totarget(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
								game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
								VirtualUser:CaptureController()
								VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
							end)
						until not _G.FramBoss or not v.Parent or v.Humanoid.Health <= 0
					end
				end
			else
				totarget(CFrameBoss)
			end
		else
			if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) or game:GetService("ReplicatedStorage"):FindFirstChild(SelectBoss) then
				if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					print()
					CheckQuestBoss()
					repeat wait()
						totarget(CFrameQuestBoss)
                  until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 4
                  wait(1)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NaemQuestBoss, LevelQuestBoss)
					wait(1)
					totarget(CFrameBoss)
				elseif game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
						if _G.FramBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == MsBoss then
							repeat
								pcall(function() wait() 
									if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
										local args = {
											[1] = "Buso"
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end
									EquipWeapon(_G.SelectWeaponBoss)
									v.HumanoidRootPart.Transparency = 1
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									totarget(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
									game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
									VirtualUser:CaptureController()
									VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
								end)
							until not _G.FramBoss or not v.Parent or v.Humanoid.Health <= 0 or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
						end
					end
					totarget(CFrameBoss)
				end
			end
		end
	end
   main:Toggle("Auto Farm Boss",false,function(Value)
		local args = {
			[1] = "AbandonQuest"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		_G.FramBoss = Value
		while _G.FramBoss do wait()
			AutoFramBoss()
		end
	end)
local Setting = server:Channel("AutoFarm Setting")
Setting:Toggle("Magnet", true, function(vu)
    Magnet = vu
end)
Setting:Toggle("Auto Haki",true,function(value)
    _G.Haki = value
    if _G.Haki then
if game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then

    else
        local args = {
            [1] = "Buso"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)
Setting:Toggle("Mob Invisble",false,function(value)
_G.inv = value
     while wait() do
         if _G.inv then
         pcall(function()
 for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
     if v.ClassName == "MeshPart" then
     v.Transparency = 1
 end
 end
 for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
     if v.Name == "Head" then
     v.Transparency = 1
 end
 end
     for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
         if v.ClassName == "Accessory" then
             v.Handle.Transparency = 1
         end
     end
     for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
         if v.ClassName == "Decal" then
         v.Transparency = 1
          end
        end
      end)
    end
  end
end)
local Stats = server:Channel("Stats")
Stats:Toggle("Melee",false,function(Value)
	_G.Meleebf = Value    
end)
Stats:Toggle("Defense",false,function(value)
	_G.Defensebf = value
end)
Stats:Toggle("Sword",false,function(value)
	_G.Swordbf = value
end)
Stats:Toggle("Gun",false,function(value)
	_G.Gunbf = value
end)
Stats:Toggle("Devil Fruit",false,function(value)
	_G.Fruitbf = value
end)
Stats:Toggle("Kaitan",false,function(value)
	_G.Kaitanstat = value
end)
Stats:Toggle("Max Point",false,function(value)
	_G.MaxPoint = value
end)
PointStats = 1
Stats:Slider("Point", 1, 100,PointStats,function(a)
	PointStats = a
end)

spawn(function()
	while wait(.1) do
		if _G.Kaitanstat then
			pcall(function()
				PointStats = game:GetService("Players").LocalPlayer.Data.Points.Value
				if world1 then
					_G.Meleebf = true
				else
					_G.Defensebf = true
				end
			end)
		end
	end
end)

spawn(function()
	while wait(.1) do
		if _G.MaxPoint then
			pcall(function()
				PointStats = game:GetService("Players").LocalPlayer.Data.Points.Value
			end)
		end
	end
end)

spawn(function()
	while wait(.1) do
		if _G.Meleebf then
			pcall(function()
				local args = {
					[1] = "AddPoint",
					[2] = "Melee",
					[3] = PointStats
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end)
		end
	end
end)
spawn(function()
	while wait(.1) do
		if _G.Defensebf then
			pcall(function()
				local args = {
					[1] = "AddPoint",
					[2] = "Defense",
					[3] = PointStats
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end)
		end
	end
end)
spawn(function()
	while wait(.1) do
		if _G.Gunbf then
			pcall(function()
				local args = {
					[1] = "AddPoint",
					[2] = "Gun",
					[3] = PointStats
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end)
		end
	end
end)
spawn(function()
	while wait(.1) do
		if _G.Swordbf then
			pcall(function()
				local args = {
					[1] = "AddPoint",
					[2] = "Sword",
					[3] = PointStats
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end)
		end
	end
end)
spawn(function()
	while wait(.1) do
		if _G.Fruitbf then
			pcall(function()
				local args = {
					[1] = "AddPoint",
					[2] = "Demon Fruit",
					[3] = PointStats
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end)
		end
	end
end)
spawn(function()
    while wait() do
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
            if v:IsA("Tool") then
                if v:FindFirstChild("RemoteFunctionShoot") then 
                    _G.SelectToolWeaponGun = v.Name
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
            if v:IsA("Tool") then
                if v:FindFirstChild("RemoteFunctionShoot") then 
                    _G.SelectToolWeaponGun = v.Name
                end
            end
        end
    end
end)
local tab2 = server:Channel("Players")
PlayerName = {}
        for i,v in pairs(game.Players:GetChildren()) do  
            table.insert(PlayerName ,v.Name)
        end
        SelectedKillPlayer = ""
        local Player = tab2:Dropdown("Selected Player",PlayerName,function(plys) --true/false, replaces the current title "Dropdown" with the option that t
            SelectedKillPlayer = plys
            SelectedPly:Refresh("Selected Player : "..SelectedKillPlayer)
        end)
        tab2:Button("Refrsh Player",function()
            PlayerName = {}
            Player:Clear()
            for i,v in pairs(game.Players:GetChildren()) do  
                Player:Add(v.Name)
            end
        end)
        game:GetService("RunService").Heartbeat:Connect(
        function()
            if KillPlayer then
                game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
            end
        end
        )
    
        tab2:Toggle("Kill Player ( Gun )",false,function(bool)
            KillPlayer = bool
            KillPlayer = bool
            local args = {
                [1] = "EnablePvp"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                local args = {
                    [1] = "Buso"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            EquipWeapon(_G.SelectWeaponPlayer)				   
            if KillPlayer == false then
                game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
            end
            while KillPlayer do wait()
                totarget(game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
                game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Size = Vector3.new(60,60,60)
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
            end
        end)
    
        ------ Kill no spawn
        for i,v in pairs(game.Workspace:GetDescendants()) do
            if v.Name == "Lava" then   
                v:Destroy()
            end
        end
        for i,v in pairs(game.ReplicatedStorage:GetDescendants()) do
            if v.Name == "Lava" then   
                v:Destroy()
            end
        end
        tab2:Toggle("Auto Bounty + Hop Gun",false,function(value)
            _G.Bounty1 = value
        end)
        spawn(function()
            while wait() do
                if game.Players.LocalPlayer.Team ~= nil then
                    _G.OldBounty = game:GetService("Players")["LocalPlayer"].leaderstats:FindFirstChild("Bounty/Honor").Value
                    break
                end
            end
        end)
		spawn(function()
			while wait() do
				if _G.Bounty1 then
					game.Players.LocalPlayer.Character.Humanoid.Name = 1
					local l = game.Players.LocalPlayer.Character["1"]:Clone()
					l.Parent = game.Players.LocalPlayer.Character
					l.Name = "Humanoid"
					game.Players.LocalPlayer.Character["1"].Parent = game
					game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
					totarget(81.164993286133, 43.755737304688, 5724.7021484375)
					wait(1)
				end
			end
		end)
        spawn(function()
            while wait() do
                if _G.Bounty1 then
                    _G.GodModeOn = true
                    break
                end
            end
        end)
    
        spawn(function()
            while wait() do
                if _G.Bounty1 then
                    pcall(function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CrewBBG:Destroy()
                    end)
                end
            end
        end)
    
    
        spawn(function()
            while wait(10) do
                pcall(function()
                    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.InCombat.Visible == false then
                        wait(2)
                        if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.InCombat.Visible == false then
                            _G.Change1 = true
                        end
                    end
                end)
            end
        end)
    
        spawn(function()
            while wait(10) do
                pcall(function()
                    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.SafeZone.Visible == true then
                        wait(2)
                        if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.SafeZone.Visible == true then
                            _G.Change1 = true
                        end
                    end
                end)
            end
        end)
    
        spawn(function()
            while wait(.1) do
                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
                    if v:IsA("Tool") then
                        if v:FindFirstChild("RemoteFunctionShoot") then 
                            _G.SelectToolWeaponGun = v.Name
                        end
                    end
                end
            end
        end)
    
        spawn(function()
            while wait() do
                pcall(function()
                    if _G.Bounty1 then
                        if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.PvpDisabled.Visible == true then
                            local args = {
                                [1] = "EnablePvp"
                            }
    
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end
                    end
                end)
            end
        end)
    
        
        _G.Chennge1 = false
    
        spawn(function ()
            while wait() do
                pcall(function()
                    if _G.Bounty1 then
                        if game:GetService("Players").localPlayer.PlayerGui.Notifications.NotificationTemplate then
                            if game:GetService("Players").localPlayer.PlayerGui.Notifications.NotificationTemplate.Text:find("Cannot") or game:GetService("Players").localPlayer.PlayerGui.Notifications.NotificationTemplate.Text:find("can't") then
                                _G.Change1 = true
                                for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
                                    v:Destroy()
                                end
                            end
                        end
                    end
                end)	
            end
        end)
    
        spawn(function()
            while wait() do
                pcall(function()
                    if _G.Bounty1 then
                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            local args = {
                                [1] = "Buso"
                            }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end
                    end
                end)
            end
        end)
 
    
        spawn(function()
            while wait() do
                pcall(function()
                    if _G.Bounty1 then
                        for i, v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                            if game:GetService("Players")[v.Name].Data.Level.Value >= 1200 and v.Name ~= game.Players.LocalPlayer.Name and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                                if game.Players.LocalPlayer.Character.Humanoid.Health > game.Players.LocalPlayer.Character.Humanoid.MaxHealth*35/100 then
                                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Kabucha") or game.Players.LocalPlayer.Character:FindFirstChild("Kabucha") then
                                        repeat wait()
                                            EquipWeapon("Kabucha")
                                            NameRandom = v.Name
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(1,40,1)
                                        until _G.Bounty1 == false or v.Humanoid.Health == 0 or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid") or not v.Parent or _G.Change1 == true or game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl)
                                        _G.Change1 = false
    
                                    end
                                else
                                    repeat wait()
                                        totarget(CFrame.new(-390.096313, 331.886475, 673.464966))
                                    until _G.Bounty1 == false or game.Players.LocalPlayer.Character.Humanoid.Health >= game.Players.LocalPlayer.Character.Humanoid.MaxHealth
                                end
                            end
                        end
                    elseif _G.Hop == true then
                        repeat wait()
                            totarget(CFrame.new(-390.096313, 331.886475, 673.464966))
                        until _G.Bounty1 == false or _G.Hop == false
                    end
                end)
            end
        end)
        
        spawn(function()
    if _G.Bounty1 then
        wait(100)
        print("Hoppy")
        local PlaceID = game.PlaceId
	local AllIDs = {}
	local foundAnything = ""
	local actualHour = os.date("!*t").hour
	local Deleted = false
	function TPReturner()
		local Site;
		if foundAnything == "" then
			Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
		else
			Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
		end
		local ID = ""
		if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
			foundAnything = Site.nextPageCursor
		end
		local num = 0;
		for i,v in pairs(Site.data) do
			local Possible = true
			ID = tostring(v.id)
			if tonumber(v.maxPlayers) > tonumber(v.playing) then
				for _,Existing in pairs(AllIDs) do
					if num ~= 0 then
						if ID == tostring(Existing) then
							Possible = false
						end
					else
						if tonumber(actualHour) ~= tonumber(Existing) then
							local delFile = pcall(function()
								-- delfile("NotSameServers.json")
								AllIDs = {}
								table.insert(AllIDs, actualHour)
							end)
						end
					end
					num = num + 1
				end
				if Possible == true then
					table.insert(AllIDs, ID)
					wait()
					pcall(function()
						-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
						wait()
						game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
					end)
					wait(.1)
				end
			end
		end
	end
	function Teleport() 
		while wait() do
			pcall(function()
				TPReturner()
				if foundAnything ~= "" then
					TPReturner()
				end
			end)
		end
	end
	Teleport()
    end
end)
        spawn(function ()
            while wait(30) do
                pcall(function()
                    if _G.Bounty1 then
                        for i, v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                            if v.Name == NameRandom and v.Humanoid.Health == v.Humanoid.MaxHealth then
                                _G.Change1 = true
                            end
                        end
                    end
                end)	
            end
        end)
    
    local lp = game:GetService('Players').LocalPlayer
	local mouse = lp:GetMouse()
	mouse.Button1Down:Connect(function()
		if _G.Bounty1 and game.Players.LocalPlayer.Character:FindFirstChild("Kabucha").RemoteFunctionShoot then
			local args = {
				[1] = game:GetService("Players"):FindFirstChild(NameRandom).Character.HumanoidRootPart.Position,
				[2] = game:GetService("Players"):FindFirstChild(NameRandom).Character.HumanoidRootPart
			}
			game:GetService("Players").LocalPlayer.Character["Kabucha"].RemoteFunctionShoot:InvokeServer(unpack(args))
		end 
	end)
    
        spawn(function()
            game:GetService('RunService').Stepped:connect(function()
                if _G.Bounty1 == true or _G.Hop == true then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                end
            end)
        end)
        spawn(function()
            while wait() do
                if _G.Bounty1 then
                VirtualUser:CaptureController()
                VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Bounty1 then
                    local name = game.Players.LocalPlayer
					_G.name = name
					local namex = tostring(_G.name)
					for i,v in pairs(game:GetService("Workspace").Characters[namex].HumanoidRootPart:GetChildren()) do
						if v.Name == "CrewBBG" then
							v:Destroy()
						end
					end
					for i,v in pairs(game:GetService("Workspace").Characters[namex].HumanoidRootPart:GetChildren()) do
						if v.Name == "MarineBBG" then
							v:Destroy()
						end
					end
        end
    end
end)
        tab2:Toggle("Aimbot Gun",false,function(bool)
            Aimbot = bool
        end)
        local lp = game:GetService('Players').LocalPlayer
        local mouse = lp:GetMouse()
        mouse.Button1Down:Connect(function()
            if Aimbot and game.Players.LocalPlayer.Character:FindFirstChild("Kabucha").RemoteFunctionShoot then
            VirtualUser:CaptureController()
            VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
			local args = {
				[1] = game:GetService("Players"):FindFirstChild(NameRandom).Character.HumanoidRootPart.Position,
				[2] = game:GetService("Players"):FindFirstChild(NameRandom).Character.HumanoidRootPart
			}
			game:GetService("Players").LocalPlayer.Character["Kabucha"].RemoteFunctionShoot:InvokeServer(unpack(args))
            
		end 
	end)
    
        tab2:Toggle("Spectate Player",false,function(bool)
            Sp = bool
            local plr1 = game.Players.LocalPlayer.Character.Humanoid
            local plr2 = game.Players:FindFirstChild(SelectedKillPlayer)
            repeat wait(.1)
                game.Workspace.Camera.CameraSubject = plr2.Character.Humanoid
            until Sp == false 
            game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
        end)
        tab2:Button("Teleport Player",function()
            local plr1 = game.Players.LocalPlayer.Character
            local plr2 = game.Players:FindFirstChild(SelectedKillPlayer)
            plr1.HumanoidRootPart.CFrame = plr2.Character.HumanoidRootPart.CFrame
        end)
    
        tab2:Button("Copy Pant and Shirt", function()
            local plr1 = game.Players.LocalPlayer.Character
            local plr2 = game.Players:FindFirstChild(SelectedKillPlayer)
            plr1.Shirt.ShirtTemplate = plr2.Character.Shirt.ShirtTemplate
            plr1.Pants.PantsTemplate = plr2.Character.Pants.PantsTemplate
        end)
    
        tab2:Label("Use With Kill Player")
        local SelectWeapona = tab2:Dropdown("Select Weapon",Wapon,function(Value)
            _G.SelectWeaponPlayer = Value
        end)
        tab2:Button("Refresh Weapon",function()
            SelectWeapona:Clear()
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
                if v:IsA("Tool") then
                    SelectWeapona:Add(v.Name)
                end
            end
    
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
                if v:IsA("Tool") then
                    SelectWeapona:Add(v.Name)
                end
            end
        end)
		local raid = server:Channel("Raid + Esp") 
		raid:Toggle("Auto Raid",false,function(t)
			_G.autoraid = t
		end)
		spawn(function()
			while wait(.1) do
				if _G.autoraid == true then
					if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
						if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1")  then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.selectchip)
						end
						if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or  game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip")  then
							if world2 then
								fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
							elseif world3 then
								fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
							end
						end
					end
					for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
						if _G.autoraid == true and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
							pcall(function()
								repeat wait(.1)
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
									v.HumanoidRootPart.Transparency = 1
									v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
									v.HumanoidRootPart.CanCollide = false
									if v.Humanoid.Health > 0 then
										v.Humanoid.Health = 0
									elseif v.Humanoid.Health == 0 then
										v.Humanoid.Health = v.Humanoid.MaxHealth
									else
										v.Humanoid.Health = 0
									end
								until not _G.autoraid or not v.Parent or v.Humanoid.Health <= 0
							end)
						end
					end
					pcall(function()
						if game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then
							if game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") then
									
								totarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame*CFrame.new(0,10,10))
							
							elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") then
								
								totarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame*CFrame.new(0,10,10))
							
							elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") then
		
								totarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame*CFrame.new(0,10,10))
															
							elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") then
								
								totarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame*CFrame.new(0,10,10))
							
							elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then
		
								--TP2FF(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
		
							end
						else
							if world2 then
								totarget(CFrame.new(-6438.73535, 250.645355, -4501.50684))
							elseif world3 then
								totarget(CFrame.new(-5017.40869, 314.844055, -2823.0127))
							end
						end
					end)
				end
			end
		end)
		raid:Toggle("Auto Raid + Hop",false,function(t)
			_G.AutoRaidhop = t
		end)
		
		spawn(function()
			while wait(.1) do
				if _G.AutoRaidhop == true then
					if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
						if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1")  then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.selectchip)
						end
						if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or  game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip")  then
							if world2 then
								fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
							elseif world3 then
								fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
							end
						end
					end
					for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
						if _G.AutoRaidhop == true and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
							pcall(function()
								repeat wait(.1)
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
									v.HumanoidRootPart.Transparency = 1
									v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
									v.HumanoidRootPart.CanCollide = false
									if v.Humanoid.Health > 0 then
										v.Humanoid.Health = 0
									elseif v.Humanoid.Health == 0 then
										v.Humanoid.Health = v.Humanoid.MaxHealth
									else
										v.Humanoid.Health = 0
									end
								until not _G.AutoRaidhop or not v.Parent or v.Humanoid.Health <= 0
							end)
						end
					end
					pcall(function()
						if game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then
							if game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") then
									
								totarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame*CFrame.new(0,10,10))
							
							elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") then
								
								totarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame*CFrame.new(0,10,10))
							
							elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") then
		
								totarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame*CFrame.new(0,10,10))
															
							elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") then
								
								totarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame*CFrame.new(0,10,10))
							
							elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then
		
								--TP2FF(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
		
							end
						else
							if world2 then
								totarget(CFrame.new(-6438.73535, 250.645355, -4501.50684))
							elseif world3 then
								totarget(CFrame.new(-5017.40869, 314.844055, -2823.0127))
							end
						end
					end)
					if not game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") and not game.Workspace:FindFirstChild("Fruit") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false then
						bithop()
					end
				end
			end
		end)
		
		spawn(function()
			while wait() do
				if _G.autoraid == true then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
					_G.BringFruit = true 
				end
			end
		end)
		raid:Toggle("Kill Arua",false,function(value)
			_G.KillAura = value
		end)
		
		spawn(function()
			while wait(.1) do
				if _G.KillAura then
					for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
						if _G.KillAura and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
							pcall(function()
								repeat wait(.1)
									if sethiddenproperty then
										sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
									end
									v.HumanoidRootPart.Transparency = 1
									v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
									v.HumanoidRootPart.CanCollide = false
									if v.Humanoid.Health > 0 then
										v.Humanoid.Health = 0
									elseif v.Humanoid.Health == 0 then
										v.Humanoid.Health = v.Humanoid.MaxHealth
									else
										v.Humanoid.Health = 0
									end
								until not _G.KillAura or not v.Parent or v.Humanoid.Health <= 0
							end)
						end
					end
				end
			end
		end)
		
		raid:Toggle("Auto Next Island",false,function(value)
			_G.NextIsland = value
		end)
		
		spawn(function()
			while wait(.1) do
				if _G.NextIsland then
					pcall(function()
						if game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then
							if game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") then
									
								totarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame*CFrame.new(0,10,10))
							
							elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") then
								
								totarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame*CFrame.new(0,10,10))
							
							elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") then
		
								totarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame*CFrame.new(0,10,10))
															
							elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") then
								
								totarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame*CFrame.new(0,10,10))
							
							elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then
		
								--TP2FF(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))
		
							end
						else
							if world2 then
								totarget(CFrame.new(-6438.73535, 250.645355, -4501.50684))
							elseif world3 then
								totarget(CFrame.new(-5017.40869, 314.844055, -2823.0127))
							end
						end
					end)
				end
			end
		end)
		
		raid:Toggle("Auto Awake",false,function(value)
			_G.Awakener = value
		end)
		
		spawn(function()
			while wait(.1) do
				if _G.Awakener then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Check")
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
				end
			end
		end)
		raid:Button("Teleport To Lab",function()
			if world2 then
				totarget(CFrame.new(-6438.73535, 250.645355, -4501.50684))
			end
			if world3 then
				totarget(CFrame.new(-5093.0385742188, 314.97863769531, -2924.8054199219))
			end
		end)
		
		raid:Button("Teleport To Awake Room", function()
			if world2 then
				totarget(CFrame.new(266.227783, 1.39509034, 1857.00732))
			end
			if world3 then
				totarget(CFrame.new(-11559.21, 55.1389618, -7578.56396, 1, 0, 0, 0, 1, 0, 0, 0, 1))
			end
		end)
		raid:Dropdown("Select Microchip",{"Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha"},function(t)
			_G.selectchip = t
		end)
		
		raid:Button("Buy Chip", function()
			game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer( "RaidsNpc", "Select", _G.selectchip)
		end)
		raid:Toggle("ESP Player",false,function(a)
			_G.ESP = a
			UpPlayer()
		end)
		
		function isnil(thing)
			return (thing == nil)
		end
		local function round(n)
			return math.floor(tonumber(n) + 0.5)
		end
		Number = math.random(1, 1000000)
		--Cr:Valentine
function UpPlayer()
	local custom_theme = {} --soon
	
	local function CreateInstance(cls,props)
	local inst = Instance.new(cls)
	for i,v in pairs(props) do
		inst[i] = v
	end
	return inst
	end
		
	local age1 = CreateInstance('ScreenGui',{DisplayOrder=0,Enabled=false,ResetOnSpawn=true,Name='age1', Parent=game.CoreGui})
	local p_visuals = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.121569, 0.12549, 0.172549),BackgroundTransparency=0,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=2,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 50, 0, 60),Rotation=0,Selectable=false,Size=UDim2.new(0, 200, 0, 254),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name = 'p_visuals',Parent = age1})
	local UIListLayout = CreateInstance('UIListLayout', {Padding = UDim.new(0, 1), FillDirection = Enum.FillDirection.Vertical, HorizontalAlignment = Enum.HorizontalAlignment.Left, SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Top, Name = 'UIListLayout', Parent = p_visuals })
	local title1 = CreateInstance('TextLabel',{Font=Enum.Font.GothamBlack,FontSize=Enum.FontSize.Size18,Text='Player visuals',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=18,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=0,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, 0, 0, 24),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='title1',Parent = p_visuals})
	local b_b = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Bounding box',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_b',Parent = p_visuals})
	
	local v = CreateInstance('TextLabel',{Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,Text='On',TextColor3=Color3.new(1, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 18, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='v',Parent = b_b})
	
	local b_f = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Fill alpha',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_f',Parent = p_visuals})
	
	local v = CreateInstance('TextLabel',{Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,Text='On',TextColor3=Color3.new(1, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 18, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='v',Parent = b_f})
	
	local b_rt = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Render team',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_rt',Parent = p_visuals})
	
	local v = CreateInstance('TextLabel',{Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,Text='On',TextColor3=Color3.new(1, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 18, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='v',Parent = b_rt})
	
	local b_tc = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Use TeamColor',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_tc',Parent = p_visuals})
	
	local v = CreateInstance('TextLabel',{Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,Text='On',TextColor3=Color3.new(1, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 18, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='v',Parent = b_tc})
	
	local b_sn = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Show name',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_sn',Parent = p_visuals})
	
	local v = CreateInstance('TextLabel',{Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,Text='On',TextColor3=Color3.new(1, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 18, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='v',Parent = b_sn})
	
	local b_sd = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Show distance',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_sd',Parent = p_visuals})
	
	local v = CreateInstance('TextLabel',{Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,Text='On',TextColor3=Color3.new(1, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 18, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='v',Parent = b_sd})
	
	local b_sh = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Show health',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_sh',Parent = p_visuals})
	
	local v = CreateInstance('TextLabel',{Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,Text='On',TextColor3=Color3.new(1, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 18, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='v',Parent = b_sh})
	
	local b_ht = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Health type',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_ht',Parent = p_visuals})
	
	local v = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Text',TextColor3=Color3.new(0, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 18, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='v',Parent = b_ht})
	
	local b_f_t = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Fill transparency',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_f_t',Parent = p_visuals})
	
	local v = CreateInstance('TextLabel',{Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,Text='1',TextColor3=Color3.new(0, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 18, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='v',Parent = b_f_t})
	
	local title1_2 = CreateInstance('TextLabel',{Font=Enum.Font.SourceSansBold,FontSize=Enum.FontSize.Size18,Text='ESP',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=18,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.121569, 0.12549, 0.172549),BackgroundTransparency=0,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, 0, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='title1_2',Parent = p_visuals})
	
	local b_ct = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Team color',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_ct',Parent = p_visuals})
	
	local ct_b = CreateInstance('TextBox',{ClearTextOnFocus=true,Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(0, 0, 1), PlaceholderText='', PlaceholderColor3=Color3.new(0, 0, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(0.121569, 0.12549, 0.172549),BackgroundTransparency=0,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, -2, 0, 2),Rotation=0,Selectable=true,Size=UDim2.new(0, 27, 0, 14),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='ct_b',Parent = b_ct})
	
	local ct_g = CreateInstance('TextBox',{ClearTextOnFocus=true,Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(0, 1, 0), PlaceholderText='', PlaceholderColor3=Color3.new(0, 1, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(0.121569, 0.12549, 0.172549),BackgroundTransparency=0,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, -29, 0, 2),Rotation=0,Selectable=true,Size=UDim2.new(0, 27, 0, 14),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='ct_g',Parent = b_ct})
	
	local ct_r = CreateInstance('TextBox',{ClearTextOnFocus=true,Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(1, 0, 0), PlaceholderText='', PlaceholderColor3=Color3.new(1, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(0.121569, 0.12549, 0.172549),BackgroundTransparency=0,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, -56, 0, 2),Rotation=0,Selectable=true,Size=UDim2.new(0, 27, 0, 14),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='ct_r',Parent = b_ct})
	
	local b_ce = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Enemy color',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_ce',Parent = p_visuals})
	
	local ce_b = CreateInstance('TextBox',{ClearTextOnFocus=true,Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(0, 0, 1), PlaceholderText='', PlaceholderColor3=Color3.new(0, 0, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(0.121569, 0.12549, 0.172549),BackgroundTransparency=0,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, -2, 0, 2),Rotation=0,Selectable=true,Size=UDim2.new(0, 27, 0, 14),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='ce_b',Parent = b_ce})
	
	local ce_g = CreateInstance('TextBox',{ClearTextOnFocus=true,Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(0, 1, 0), PlaceholderText='', PlaceholderColor3=Color3.new(0, 1, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(0.121569, 0.12549, 0.172549),BackgroundTransparency=0,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, -29, 0, 2),Rotation=0,Selectable=true,Size=UDim2.new(0, 27, 0, 14),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='ce_g',Parent = b_ce})
	
	local ce_r = CreateInstance('TextBox',{ClearTextOnFocus=true,Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(1, 0, 0), PlaceholderText='', PlaceholderColor3=Color3.new(1, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(0.121569, 0.12549, 0.172549),BackgroundTransparency=0,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, -56, 0, 2),Rotation=0,Selectable=true,Size=UDim2.new(0, 27, 0, 14),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='ce_r',Parent = b_ce})
	
	p_visuals.Draggable = true
	
	title1.LayoutOrder = 0 title1_2.LayoutOrder = 1
	b_b.LayoutOrder = 1 b_f.LayoutOrder = 2 b_f_t.LayoutOrder = 3 b_sd.LayoutOrder = 4 b_sn.LayoutOrder = 5 b_sh.LayoutOrder = 6 b_ht.LayoutOrder = 7 b_rt.LayoutOrder = 8 b_tc.LayoutOrder = 9 b_ct.LayoutOrder = 10 b_ce.LayoutOrder = 11
	
	local localplayer = game:GetService"Players".LocalPlayer
	local uis = game:GetService"UserInputService"
	
	local cheats = {
		b_b = true;
		b_f = true;
		b_f_t = 0.5;
		b_sd = true;
		b_sn = true;
		b_sh = true;
		b_ht = "Both";
		b_rt = true;
		b_tc = true;
	}
	
	local cheatsf = Instance.new("Folder", game.CoreGui) cheatsf.Name = "cheats"
	local espf = Instance.new("Folder", cheatsf) espf.Name = "esp"
	
	function addEsp(player)
		local bbg = Instance.new("BillboardGui", espf)
		bbg.Name = player.Name
		bbg.AlwaysOnTop = true
		bbg.Size = UDim2.new(4,0,5.4,0)
		bbg.ClipsDescendants = false
		
		local outlines = Instance.new("Frame", bbg)
		outlines.Size = UDim2.new(1,0,1,0)
		outlines.BorderSizePixel = 0
		outlines.BackgroundTransparency = 1
		local left = Instance.new("Frame", outlines)
		left.BorderSizePixel = 0
		left.Size = UDim2.new(0,1,1,0)
		local right = left:Clone()
		right.Parent = outlines
		right.Size = UDim2.new(0,-1,1,0)
		right.Position = UDim2.new(1,0,0,0)
		local up = left:Clone()
		up.Parent = outlines
		up.Size = UDim2.new(1,0,0,1)
		local down = left:Clone()
		down.Parent = outlines
		down.Size = UDim2.new(1,0,0,-1)
		down.Position = UDim2.new(0,0,1,0)
		
		local info = Instance.new("BillboardGui", bbg)
		info.Name = "info"
		info.Size = UDim2.new(3,0,0,54)
		info.StudsOffset = Vector3.new(3.6,-3,0)
		info.AlwaysOnTop = true
		info.ClipsDescendants = false
		local namelabel = Instance.new("TextLabel", info)
		namelabel.Name = "namelabel"
		namelabel.BackgroundTransparency = 1
		namelabel.TextStrokeTransparency = 0
		namelabel.TextXAlignment = Enum.TextXAlignment.Left
		namelabel.Size = UDim2.new(0,100,0,18)
		namelabel.Position = UDim2.new(0,0,0,0)
		namelabel.Text = player.Name
		local distancel = Instance.new("TextLabel", info)
		distancel.Name = "distancelabel"
		distancel.BackgroundTransparency = 1
		distancel.TextStrokeTransparency = 0
		distancel.TextXAlignment = Enum.TextXAlignment.Left
		distancel.Size = UDim2.new(0,100,0,18)
		distancel.Position = UDim2.new(0,0,0,18)
		local healthl = Instance.new("TextLabel", info)
		healthl.Name = "healthlabel"
		healthl.BackgroundTransparency = 1
		healthl.TextStrokeTransparency = 0
		healthl.TextXAlignment = Enum.TextXAlignment.Left
		healthl.Size = UDim2.new(0,100,0,18)
		healthl.Position = UDim2.new(0,0,0,36)
		
		local uill = Instance.new("UIListLayout", info)
		
		local forhealth = Instance.new("BillboardGui", bbg)
		forhealth.Name = "forhealth"
		forhealth.Size = UDim2.new(5,0,6,0)
		forhealth.AlwaysOnTop = true
		forhealth.ClipsDescendants = false
		
		local healthbar = Instance.new("Frame", forhealth)
		healthbar.Name = "healthbar"
		healthbar.BackgroundColor3 = Color3.fromRGB(40,40,40)
		healthbar.BorderColor3 = Color3.fromRGB(0,0,0)
		healthbar.Size = UDim2.new(0.04,0,0.9,0)
		healthbar.Position = UDim2.new(0,0,0.05,0)
		local bar = Instance.new("Frame", healthbar)
		bar.Name = "bar"
		bar.BorderSizePixel = 0
		bar.BackgroundColor3 = Color3.fromRGB(94,255,69)
		bar.AnchorPoint = Vector2.new(0,1)
		bar.Position = UDim2.new(0,0,1,0)
		bar.Size = UDim2.new(1,0,1,0)
		
		local co = coroutine.create(function()
			while wait(0.1) do
				if (player.Character and player.Character:FindFirstChild"HumanoidRootPart") then
					bbg.Adornee = player.Character.HumanoidRootPart
					info.Adornee = player.Character.HumanoidRootPart
					forhealth.Adornee = player.Character.HumanoidRootPart
					
					if (player.Team ~= localplayer.Team) then
						bbg.Enabled = true
						info.Enabled = true
						forhealth.Enabled = true
					end
					if player.Character:FindFirstChild("ForceField") then
						outlines.BackgroundTransparency = 0.4
						left.BackgroundTransparency = 0.4
						right.BackgroundTransparency = 0.4
						up.BackgroundTransparency = 0.4
						down.BackgroundTransparency = 0.4
						healthl.TextTransparency = 0.4
						healthl.TextStrokeTransparency = 0.8
						distancel.TextTransparency = 0.4
						distancel.TextStrokeTransparency = 0.8
						namelabel.TextTransparency = 0.4
						namelabel.TextStrokeTransparency = 0.8
						bar.BackgroundTransparency = 0.4
						healthbar.BackgroundTransparency = 0.8
					else
						outlines.BackgroundTransparency = 0
						left.BackgroundTransparency = 0
						right.BackgroundTransparency = 0
						up.BackgroundTransparency = 0
						down.BackgroundTransparency = 0
						healthl.TextTransparency = 0
						healthl.TextStrokeTransparency = 0
						distancel.TextTransparency = 0
						distancel.TextStrokeTransparency = 0
						namelabel.TextTransparency = 0
						namelabel.TextStrokeTransparency = 0
						bar.BackgroundTransparency = 0
						healthbar.BackgroundTransparency = 0
					end
					if cheats.b_b == true then
						outlines.Visible = true
					else
						outlines.Visible = false
					end
					if cheats.b_f == true then
						if player.Character:FindFirstChild("ForceField") then
							outlines.BackgroundTransparency = 0.9
						else
							outlines.BackgroundTransparency = cheats.b_f_t
						end
					else
						outlines.BackgroundTransparency = 1
					end
					if cheats.b_sh == true then
						if (player.Character:FindFirstChild"Humanoid") then
							healthl.Text = "Health: "..math.floor(player.Character:FindFirstChild"Humanoid".Health)
							healthbar.bar.Size = UDim2.new(1,0,player.Character:FindFirstChild"Humanoid".Health/player.Character:FindFirstChild"Humanoid".MaxHealth,0)
						end
						if cheats.b_ht == "Text" then
							healthbar.Visible = false
							healthl.Visible = true
						end
						if cheats.b_ht == "Bar" then
							healthl.Visible = false
							healthbar.Visible = true
						end
						if cheats.b_ht == "Both" then
							healthl.Visible = true
							healthbar.Visible = true
						end
					else
						healthl.Visible = false
						healthbar.Visible = false
					end
					if cheats.b_sn then
						namelabel.Visible = true
					else
						namelabel.Visible = false
					end
					if cheats.b_sd == true then
						distancel.Visible = true
						if (localplayer.Character and localplayer.Character:FindFirstChild"HumanoidRootPart") then
							distancel.Text = "Distance: "..math.floor(0.5+(localplayer.Character:FindFirstChild"HumanoidRootPart".Position - player.Character:FindFirstChild"HumanoidRootPart".Position).magnitude)
						end
					else
						distancel.Visible = false
					end
					if cheats.b_rt == true then
						if (player.Team == localplayer.Team) then
							bbg.Enabled = true
							info.Enabled = true
							forhealth.Enabled = true
						end
					else
						if (player.Team == localplayer.Team) then
							bbg.Enabled = false
							info.Enabled = false
							forhealth.Enabled = false
						end
					end
					if cheats.b_tc == true then
						outlines.BackgroundColor3 = player.TeamColor.Color
						left.BackgroundColor3 = player.TeamColor.Color
						right.BackgroundColor3 = player.TeamColor.Color
						up.BackgroundColor3 = player.TeamColor.Color
						down.BackgroundColor3 = player.TeamColor.Color
						healthl.TextColor3 = player.TeamColor.Color
						distancel.TextColor3 = player.TeamColor.Color
						namelabel.TextColor3 = player.TeamColor.Color
					else
						if (player.Team == localplayer.Team) then
							outlines.BackgroundColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
							left.BackgroundColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
							right.BackgroundColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
							up.BackgroundColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
							down.BackgroundColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
							healthl.TextColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
							distancel.TextColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
							namelabel.TextColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
						else
							outlines.BackgroundColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
							left.BackgroundColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
							right.BackgroundColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
							up.BackgroundColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
							down.BackgroundColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
							healthl.TextColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
							distancel.TextColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
							namelabel.TextColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
						end
					end
				end
				if not (game:GetService"Players":FindFirstChild(player.Name)) then
					print(player.Name.." has left. Clearing esp.")
					espf:FindFirstChild(player.Name):Destroy()
					coroutine.yield()
				end
			end
		end)
		coroutine.resume(co)
	end
	
	--main
	do
		wait(2)
		--menu buttons
		for _,button in pairs(age1:GetDescendants()) do
			if button:IsA"TextButton" then
				button.MouseButton1Click:connect(function()
					if button.Name == "b_f_t" then
						if cheats.b_f_t >= 0 then
							cheats.b_f_t = cheats.b_f_t+0.1
							if cheats.b_f_t > 1 then
								cheats.b_f_t = 0
							end
						end
						button.v.Text = cheats.b_f_t
					elseif button.Name == "b_ht" then
						if cheats.b_ht == "Text" then
							cheats.b_ht = "Bar"
						elseif cheats.b_ht == "Bar" then
							cheats.b_ht = "Both"
						else
							cheats.b_ht = "Text"
						end
						button.v.Text = cheats.b_ht
					else
						if cheats[button.Name] == true then
							cheats[button.Name] = false
							button.v.Text = "OFF"
							button.v.TextColor3 = Color3.fromRGB(255,0,0)
						else
							cheats[button.Name] = true
							button.v.Text = "ON"
							button.v.TextColor3 = Color3.fromRGB(0,255,0)
						end
					end	
				end)
			end
		end
		
		--initial player addition
		for _,v in pairs(game:GetService("Players"):GetChildren()) do
			if not (v.Name == localplayer.Name) then
				if not (espf:FindFirstChild(v.Name)) then
					addEsp(v)
				end
			end
		end
		
		--open/close gui
		game:GetService("UserInputService").InputBegan:connect(function(input, gameProcessed)
			if input.KeyCode == Enum.KeyCode.KeypadOne then
				if not gameProcessed then
					age1.Enabled = not age1.Enabled
				end
			end
		end)
		
		--auto-update
		while wait(10) do
			for _,v in pairs(game:GetService("Players"):GetChildren()) do
				if not (v.Name == localplayer.Name) then
					if not (espf:FindFirstChild(v.Name)) then
						addEsp(v)
					end
				end
			end
		end
	end
	end
		raid:Toggle("ESP Chest",false,function(a)
			ChestESP = a
			while ChestESP do wait()
				UpdateChestChams() 
			end
		end)
		
		function UpdateChestChams() 
			for i,v in pairs(game.Workspace:GetChildren()) do
				pcall(function()
					if string.find(v.Name,"Chest") then
						if ChestESP then
							if string.find(v.Name,"Chest") then
								if not v:FindFirstChild('NameEsp'..Number) then
									local bill = Instance.new('BillboardGui',v)
									bill.Name = 'NameEsp'..Number
									bill.ExtentsOffset = Vector3.new(0, 1, 0)
									bill.Size = UDim2.new(1,200,1,30)
									bill.Adornee = v
									bill.AlwaysOnTop = true
									local name = Instance.new('TextLabel',bill)
									name.Font = "GothamBold"
									name.FontSize = "Size14"
									name.TextWrapped = true
									name.Size = UDim2.new(1,0,1,0)
									name.TextYAlignment = 'Top'
									name.BackgroundTransparency = 1
									name.TextStrokeTransparency = 0.5
									if v.Name == "Chest1" then
										name.TextColor3 = Color3.fromRGB(255, 255, 255)
										name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
									end
									if v.Name == "Chest2" then
										name.TextColor3 = Color3.fromRGB(255, 255, 255)
										name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
									end
									if v.Name == "Chest3" then
										name.TextColor3 = Color3.fromRGB(255, 255 ,255)
										name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
									end
								else
									v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
								end
							end
						else
							if v:FindFirstChild('NameEsp'..Number) then
								v:FindFirstChild('NameEsp'..Number):Destroy()
							end
						end
					end
				end)
			end
		end
		
		raid:Toggle("ESP Devil Fruit",false,function(a)
			DevilFruitESP = a
			while DevilFruitESP do wait()
				UpdateDevilChams() 
			end
		end)
		
		function UpdateDevilChams() 
			for i,v in pairs(game.Workspace:GetChildren()) do
				pcall(function()
					if DevilFruitESP then
						if string.find(v.Name, "Fruit") then   
							if not v.Handle:FindFirstChild('NameEsp'..Number) then
								local bill = Instance.new('BillboardGui',v.Handle)
								bill.Name = 'NameEsp'..Number
								bill.ExtentsOffset = Vector3.new(0, 1, 0)
								bill.Size = UDim2.new(1,200,1,30)
								bill.Adornee = v.Handle
								bill.AlwaysOnTop = true
								local name = Instance.new('TextLabel',bill)
								name.Font = "GothamBold"
								name.FontSize = "Size14"
								name.TextWrapped = true
								name.Size = UDim2.new(1,0,1,0)
								name.TextYAlignment = 'Top'
								name.BackgroundTransparency = 1
								name.TextStrokeTransparency = 0.5
								name.TextColor3 = Color3.fromRGB(255, 255 ,255)
								name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
							else
								v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
							end
						end
					else
						if v.Handle:FindFirstChild('NameEsp'..Number) then
							v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
						end
					end
				end)
			end
		end
		
		raid:Toggle("ESP Flower",false,function(a)
			FlowerESP = a
			while FlowerESP do wait()
				UpdateFlowerChams() 
			end
		end)
		
		function UpdateFlowerChams() 
			for i,v in pairs(game.Workspace:GetChildren()) do
				pcall(function()
					if v.Name == "Flower2" or v.Name == "Flower1" then
						if FlowerESP then 
							if not v:FindFirstChild('NameEsp'..Number) then
								local bill = Instance.new('BillboardGui',v)
								bill.Name = 'NameEsp'..Number
								bill.ExtentsOffset = Vector3.new(0, 1, 0)
								bill.Size = UDim2.new(1,200,1,30)
								bill.Adornee = v
								bill.AlwaysOnTop = true
								local name = Instance.new('TextLabel',bill)
								name.Font = "GothamBold"
								name.FontSize = "Size14"
								name.TextWrapped = true
								name.Size = UDim2.new(1,0,1,0)
								name.TextYAlignment = 'Top'
								name.BackgroundTransparency = 1
								name.TextStrokeTransparency = 0.5
								name.TextColor3 = Color3.fromRGB(255, 255 ,255)
								if v.Name == "Flower1" then 
									name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
									name.TextColor3 = Color3.fromRGB(255, 255 ,255)
								end
								if v.Name == "Flower2" then
									name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
									name.TextColor3 = Color3.fromRGB(255, 255 ,255)
								end
							else
								v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
							end
						else
							if v:FindFirstChild('NameEsp'..Number) then
								v:FindFirstChild('NameEsp'..Number):Destroy()
							end
						end
					end   
				end)
			end
		end
		local page1 = server:Channel("Teleport")
		page1:Toggle("Ctrl + Click = TP",false,function(vu)
			CTRL = vu
		end)
		local Plr = game:GetService("Players").LocalPlayer
		local Mouse = Plr:GetMouse()
		Mouse.Button1Down:connect(
			function()
				if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
					return
				end
				if not Mouse.Target then
					return
				end
				if CTRL then
					Plr.Character:MoveTo(Mouse.Hit.p)
				end
			end)
		
		page1:Button("Teleport To Old World", function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
		end)
		page1:Button("Teleport To NewWorld", function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
		end)
		page1:Button("Teleport To Third World", function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
		end)
		if world1 then
			page1:Button("Start Island",function()
				TP2FF(CFrame.new(1071.2832, 16.3085976, 1426.86792))
			end)
			page1:Button("Marine Start",function()
				TP2FF(CFrame.new(-2573.3374, 6.88881969, 2046.99817))
			end)
			page1:Button("Middle Town",function()
				TP2FF(CFrame.new(-655.824158, 7.88708115, 1436.67908))
			end)
			page1:Button("Jungle",function()
				TP2FF(CFrame.new(-1249.77222, 11.8870859, 341.356476))
			end)
			page1:Button("Pirate Village",function()
				TP2FF(CFrame.new(-1122.34998, 4.78708982, 3855.91992))
			end)
			page1:Button("Desert",function()
				TP2FF(CFrame.new(1094.14587, 6.47350502, 4192.88721))
			end)
			page1:Button("Frozen Village",function()
				TP2FF(CFrame.new(1198.00928, 27.0074959, -1211.73376))
			end)
			page1:Button("MarineFord",function()
				TP2FF(CFrame.new(-4505.375, 20.687294, 4260.55908))
			end)
			page1:Button("Colosseum",function()
				TP2FF(CFrame.new(-1428.35474, 7.38933945, -3014.37305))
			end)
			page1:Button("Sky island 1 ",function()
				TP2FF(CFrame.new(-4970.21875, 717.707275, -2622.35449))
			end)
			page1:Button("Sky island 2 ",function()
				TP2FF(CFrame.new(-4813.0249, 903.708557, -1912.69055))
			end)
			page1:Button("Sky island 3 ",function()
				TP2FF(CFrame.new(-7952.31006, 5545.52832, -320.704956))
			end)
			page1:Button("Sky island 4 ",function()
				TP2FF(CFrame.new(-7793.43896, 5607.22168, -2016.58362))
			end)
			page1:Button("Prison",function()
				TP2FF(CFrame.new(4854.16455, 5.68742752, 740.194641))
			end)
			page1:Button("Magma Village",function()
				TP2FF(CFrame.new(-5231.75879, 8.61593437, 8467.87695))
			end)
			page1:Button("UndeyWater City",function()
				TP2FF(CFrame.new(61163.8516, 11.7796879, 1819.78418))
			end)
			page1:Button("Fountain City",function()
				TP2FF(CFrame.new(5132.7124, 4.53632832, 4037.8562))
			end)
			page1:Button("House Cyborg's",function()
				TP2FF(CFrame.new(6262.72559, 71.3003616, 3998.23047))
			end)
			page1:Button("Shank's Room",function()
				TP2FF(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
			end)
			page1:Button("Mob Island",function()
				TP2FF(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
			end)
		end   
		if world2 then
			page1:Button("Dock",function()
				TP2FF(CFrame.new(82.9490662, 18.0710983, 2834.98779))
			end)
			page1:Button("Kingdom of Rose",function()
				TP2FF(CFrame.new(-394.983521, 118.503128, 1245.8446))
			end)
			page1:Button("Mansion",function()
				TP2FF(CFrame.new(-390.096313, 331.886475, 673.464966))
			end)
			page1:Button("Flamingo Room",function()
				TP2FF(CFrame.new(2302.19019, 15.1778421, 663.811035))
			end)
			page1:Button("Green Zone",function()
				TP2FF(CFrame.new(-2372.14697, 72.9919434, -3166.51416))
			end)
			page1:Button("Cafe",function()
				TP2FF(CFrame.new(-385.250916, 73.0458984, 297.388397))
			end)
			page1:Button("Factroy",function()
				TP2FF(CFrame.new(430.42569, 210.019623, -432.504791))
			end)
			page1:Button("Colosseum",function()
				TP2FF(CFrame.new(-1836.58191, 44.5890656, 1360.30652))
			end)
			page1:Button("Grave Island",function()
				TP2FF(CFrame.new(-5411.47607, 48.8234024, -721.272522))
			end)
			page1:Button("Snow Mountain",function()
				TP2FF(CFrame.new(511.825226, 401.765198, -5380.396))
			end)
			page1:Button("Cold Island",function()
				TP2FF(CFrame.new(-6026.96484, 14.7461271, -5071.96338))
			end)
			page1:Button("Hot Island",function()
				TP2FF(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
			end)
			page1:Button("Cursed Ship",function()
				TP2FF(CFrame.new(902.059143, 124.752518, 33071.8125))
			end)
			page1:Button("Ice Castle",function()
				TP2FF(CFrame.new(5400.40381, 28.21698, -6236.99219))
			end)
			page1:Button("Forgotten Island",function()
				TP2FF(CFrame.new(-3043.31543, 238.881271, -10191.5791))
			end)
			page1:Button("Usoapp Island",function()
				TP2FF(CFrame.new(4748.78857, 8.35370827, 2849.57959))
			end)
			page1:Button("Minisky Island",function()
				TP2FF(CFrame.new(-260.358917, 49325.7031, -35259.3008))
			end)
		end
		if world3 then
			page1:Button("Port Towen",function()
				TP2FF(CFrame.new(-610.309692, 57.8323097, 6436.33594))
			end)
			page1:Button("Hydra Island",function()
				TP2FF(CFrame.new(5229.99561, 603.916565, 345.154022))
			end)
			page1:Button("Great Tree",function()
				TP2FF(CFrame.new(2174.94873, 28.7312393, -6728.83154))
			end)
			page1:Button("Castle on the Sea",function()
				TP2FF(CFrame.new(-5477.62842, 313.794739, -2808.4585))
			end)
			page1:Button("Floating Turtle",function()
				TP2FF(CFrame.new(-10919.2998, 331.788452, -8637.57227))
			end)
			page1:Button("Mansion",function()
				TP2FF(CFrame.new(-12553.8125, 332.403961, -7621.91748))
			end)
			page1:Button("Secret Temple",function()
				TP2FF(CFrame.new(5217.35693, 6.56511116, 1100.88159))
			end)
			page1:Button("Friendly Arena",function()
				TP2FF(CFrame.new(5220.28955, 72.8193436, -1450.86304))
			end)
			page1:Button("Beautiful Pirate Domain",function()
				TP2FF(CFrame.new(5310.8095703125, 21.594484329224, 129.39053344727))
			end)
			page1:Button("Teler Park",function()
				TP2FF(CFrame.new(-9512.3623046875, 142.13258361816, 5548.845703125))
			end)
            page1:Button("Ice Cream Island",function()
                TP2FF(CFrame.new(-900.67767333984, 58.971530914307, -10871.236328125))
            end)
            page1:Button("Peanut Island",function()
                TP2FF(CFrame.new(-2045.2473144531, 4.701087474823, -9899.9716796875))
            end)
		end
		local buy = server:Channel("Fruits")
		buy:Label("Events")
		buy:Label("Event")
		buy:Toggle("Random (50 Bones)","",false,function(x)
			_G.Bone = x
		end)
		spawn(function()
		  while wait() do
			if _G.Bone then
			local args = {
			[1] = "Bones",
			[2] = "Buy",
			[3] = 1,
			[4] = 1
			}
	
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end
	end
	end)
		buy:Line()
		buy:Toggle("Auto Random Fruit",false,function(v)
			DevilAutoBuy = v
		end)
		
		spawn(function()
			while wait(1) do
				if DevilAutoBuy then wait()
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
				end
			end
		end)
		
		buy:Toggle("Auto Drop Fruit", false, function(vu)
			Drop = vu
		end)
		
		spawn(function()
			while wait() do
				if Drop then
					pcall(function()
						for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
							if string.find(v.Name, "Fruit") then
								EquipWeapon(v.Name)
								SelectFruit = v.Name
								wait(.1)
								if game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible == true then
									game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible = false
								end
								EquipWeapon(v.Name)
								game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectFruit).EatRemote:InvokeServer("Drop")
							end
						end
						for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
							if string.find(v.Name, "Fruit") then
								EquipWeapon(v.Name)
								SelectFruit = v.Name
								wait(.1)
								if game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible == true then
									game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible = false
								end
								EquipWeapon(v.Name)
								game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectFruit).EatRemote:InvokeServer("Drop")
							end
						end
					end)
				end
			end
		end)
		
		buy:Toggle("Bring Fruit",false,function(t)
			_G.BringFruit = t
		end)
		
		spawn(function()
			while wait() do
				if _G.BringFruit then
					pcall(function()
						if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
							for i,v in pairs(game.Workspace:GetChildren()) do
								if v:IsA("Tool") then
									if (v.Handle.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 20000 then
										v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
									else 
										TP2FF(v.Handle.CFrame)
									end
								end
							end
						end
					end)
				end
			end
		end)
		buy:Toggle("Keep Fruit To Inventory",false,function(value)
			_G.Savefruit = value
		end)
		
		spawn(function()
			while wait() do
				if _G.Savefruit then
					wait(0.5)
					local a =     {
						"Bomb-Bomb",
						"Spike-Spike",
						"Chop-Chop",
						"Spring-Spring",
						"Kilo-Kilo",
						"Smoke-Smoke",
						"Spin-Spin",
						"Flame-Flame",
						"Brid:Falcon",
						"Ice-Ice",
						"Sand-Sand",
						"Dark-Dark",
						"Diamond-Diamond",
						"Light-Light",
						"Love-Love",
						"Rubber-Rubber",
						"Barrier-Barrier",
						"Magma-Magma",
						"Door-Door",
						"Quake-Quake",
						"Human-Human: Buddha",
						"String-String",
						"Bird-Bird: Phoenix",
						"Rumble-Rumble",
						"Paw-Paw",
						"Gravity-Gravity",
						"Dough-Dough",
						"Venom-Venom",
						"Control-Control",
						"Dragon-Dragon"
					}
					pcall(function()  
						for i,v in pairs(a) do
							if _G.Savefruit then
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",v)
							end
						end
					end)
				end
			 end
		end)
		
		buy:Toggle("Buy Devil Fruit Sinper",false,function(value)
			BuyFruitSinper = vu
		end)
		buy:Dropdown("DevilFruit Sniper",
			{
				"Bomb-Bomb",
				"Spike-Spike",
				"Chop-Chop",
				"Spring-Spring",
				"Kilo-Kilo",
				"Spin-Spin",
				"Bird: Falcon",
				"Smoke-Smoke",
				"Flame-Flame",
				"Ice-Ice",
				"Sand-Sand",
				"Dark-Dark",
				"Diamond-Diamond",
				"Light-Light",
				"Love-Love",
				"Rubber-Rubber",
				"Barrier-Barrier",
				"Magma-Magma",
				"Door-Door",
				"Quake-Quake",
				"Human-Human: Buddha",
				"String-String",
				"Bird-Bird: Phoenix",
				"Rumble-Rumble",
				"Paw-Paw",
				"Gravity-Gravity",
				"Dough-Dough",
				"Vemon-Vemon",
				"Control-Control",
				"Dragon-Dragon"
			}
			,function(ply)
				SelectDevil = ply
			end)
		
		spawn(function()
			while wait(.1) do
				if BuyFruitSinper then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit",SelectDevil)
				end 
			end
		end)
		buy:Button("Random Fruit", function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
		end)
		local shop = server:Channel("Shop")
		shop:Label("Reset Stats")

shop:Button("Reset Stats",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
end)

shop:Label("Buy Fighting Style")

shop:Button("Black Leg",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
end)
shop:Button("Electro",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
end)
shop:Button("Fishman Karate",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
end)
shop:Button("Dragon Claw",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
end)
shop:Button("Superhuman",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
end)
shop:Button("Death Step",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
end)
shop:Button("Sharkman Karate",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
end)
shop:Button("Electric Claw",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
end)

shop:Label("Sworld")

shop:Button("Bisento",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Bisento")
end)

shop:Button("Dual-Headed Blade",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")
end)

shop:Button("Soul Cane",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")
end)

shop:Button("Triple Katana",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")
end)
shop:Button("Pipe",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Pipe")
end)
shop:Button("Dual Katana",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Dual Katana")
end)
shop:Button("Iron Mace",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")
end)

shop:Label("Buy Iime")

shop:Button("Geppo",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
end)
shop:Button("Buso Haki",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
end)
shop:Button("Ken Haki",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
end)
shop:Button("Soru",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
end)
shop:Button("Random Race",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
end)
shop:Button("Microchip [ Raw ]",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Microchip","2")
end)

shop:Label("Gun")

shop:Button("Slingshot",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Slingshot")
end)
shop:Button("Musket",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Musket")
end)
shop:Button("Refined Slingshot",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Refined Slingshot")
end)
shop:Button("Cannon",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cannon")
end)
shop:Button("Bizarre Rifle",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm","Buy",1)
end)
local misc = server:Channel("Misc")
misc:Button("Destroy animation", function()
	pcall(function()
		game:GetService("ReplicatedStorage").Assets.GUI:Destroy()
		game:GetService("ReplicatedStorage").Assets.SlashHit:Destroy()
		game:GetService("ReplicatedStorage").Effect.Container:Destroy()
	end)
end)
misc:Button("Open Awakening", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AwakeningChanger","Check")
	game.Players.localPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
end)

misc:Button("Open Inventory", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")
	game.Players.localPlayer.PlayerGui.Main.Inventory.Visible = true
end)

misc:Button("Open Devil Shop", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
	game.Players.localPlayer.PlayerGui.Main.FruitShop.Visible = true
end)

misc:Button("Open Color Haki", function()
	game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
end)

misc:Button("Open Title Name", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getTitles")
	game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
end)
misc:Label('Join Team')
misc:Button("Join Pirates", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates") 
end)

misc:Button("Join Marines Team", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Marines") 
end)
misc:Label('Haki')
misc:Button("Stage 0", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",0)
end)
misc:Button("Stage 1", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",1)
end)
misc:Button("Stage 2", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",2)
end)
misc:Button("Stage 3", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",3)
end)
misc:Button("Stage 4", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",4)
end)
misc:Button("Stage 5", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",5)
end)
misc:Label("Fps Boost")

misc:Button("FPS Boost", function()
	if not game:IsLoaded() then repeat wait() until game:IsLoaded() end
if hookfunction and setreadonly then
    local mt = getrawmetatable(game)
    local old = mt.__newindex
    setreadonly(mt, false)
    local sda
    sda = hookfunction(old, function(t, k, v)
        if k == "Material" then
            if v ~= Enum.Material.Neon and v ~= Enum.Material.Plastic and v ~= Enum.Material.ForceField then v = Enum.Material.Plastic end
        elseif k == "TopSurface" then v = "Smooth"
        elseif k == "Reflectance" or k == "WaterWaveSize" or k == "WaterWaveSpeed" or k == "WaterReflectance" then v = 0
        elseif k == "WaterTransparency" then v = 1
        elseif k == "GlobalShadows" then v = false end
        return sda(t, k, v)
    end)
    setreadonly(mt, true)
end
local g = game
local w = g.Workspace
local l = g:GetService"Lighting"
local t = w:WaitForChild"Terrain"
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 1
l.GlobalShadows = false

function change(v)
    pcall(function()
        if v.Material ~= Enum.Material.Neon and v.Material ~= Enum.Material.Plastic and v.Material ~= Enum.Material.ForceField then
            pcall(function() v.Reflectance = 0 end)
            pcall(function() v.Material = Enum.Material.Plastic end)
            pcall(function() v.TopSurface = "Smooth" end)
        end
    end)
end

game.DescendantAdded:Connect(function(v)
    pcall(function()
        if v:IsA"Part" then change(v)
        elseif v:IsA"MeshPart" then change(v)
        elseif v:IsA"TrussPart" then change(v)
        elseif v:IsA"UnionOperation" then change(v)
        elseif v:IsA"CornerWedgePart" then change(v)
        elseif v:IsA"WedgePart" then change(v) end
    end)
end)
for i, v in pairs(game:GetDescendants()) do
    pcall(function()
        if v:IsA"Part" then change(v)
        elseif v:IsA"MeshPart" then change(v)
        elseif v:IsA"TrussPart" then change(v)
        elseif v:IsA"UnionOperation" then change(v)
        elseif v:IsA"CornerWedgePart" then change(v)
        elseif v:IsA"WedgePart" then change(v) end
    end)
end
end)

misc:Button("Super FPS Boost", function()
	for i,v in pairs(game.Workspace.Map:GetDescendants()) do
		if v.Name == "Tavern" or v.Name == "SmileFactory" or v.Name == "Tree" or v.Name == "Rocks" or v.Name == "PartHouse" or v.Name == "Hotel" or v.Name == "WallPiece" or v.Name == "MiddlePillars" or v.Name == "Cloud" or v.Name == "PluginGrass" or v.Name == "BigHouse" or v.Name == "SmallHouse" or v.Name == "Detail" then
			v:Destroy()
		end
	end 
	for i,v in pairs(game.ReplicatedStorage.Unloaded:GetDescendants()) do
		if v.Name == "Tavern" or v.Name == "SmileFactory" or v.Name == "Tree" or v.Name == "Rocks" or v.Name == "PartHouse" or v.Name == "Hotel" or v.Name == "WallPiece" or v.Name == "MiddlePillars" or v.Name == "Cloud" or v.Name == "PluginGrass" or v.Name == "BigHouse" or v.Name == "SmallHouse" or v.Name == "Detail" then
			v:Destroy()
		end
	end
	for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if v:IsA("Accessory") or v.Name == "Pants" or v.Name == "Shirt" then
			v:Destroy()
		end
	end
	local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
	local g = game
	local w = g.Workspace
	local l = g.Lighting
	local t = w.Terrain
	t.WaterWaveSize = 0
	t.WaterWaveSpeed = 0
	t.WaterReflectance = 0
	t.WaterTransparency = 0
	l.GlobalShadows = false
	l.FogEnd = 9e9
	l.Brightness = 0
	settings().Rendering.QualityLevel = "Level01"
	for i, v in pairs(g:GetDescendants()) do
		if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
			v.Material = "Plastic"
			v.Reflectance = 0
		elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
			v.Transparency = 1
		elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
			v.Lifetime = NumberRange.new(0)
		elseif v:IsA("Explosion") then
			v.BlastPressure = 1
			v.BlastRadius = 1
		elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
			v.Enabled = false
		elseif v:IsA("MeshPart") then
			v.Material = "Plastic"
			v.Reflectance = 0
			v.TextureID = 10385902758728957
		end
	end
	for i, e in pairs(l:GetChildren()) do
		if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
			e.Enabled = false
		end
	end
end)
local kpage = server:Channel("Setting")
kpage:Button("Rejoin", function()
	game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)

kpage:Button("Server Hop", function()
	local PlaceID = game.PlaceId
	local AllIDs = {}
	local foundAnything = ""
	local actualHour = os.date("!*t").hour
	local Deleted = false
	function TPReturner()
		local Site;
		if foundAnything == "" then
			Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
		else
			Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
		end
		local ID = ""
		if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
			foundAnything = Site.nextPageCursor
		end
		local num = 0;
		for i,v in pairs(Site.data) do
			local Possible = true
			ID = tostring(v.id)
			if tonumber(v.maxPlayers) > tonumber(v.playing) then
				for _,Existing in pairs(AllIDs) do
					if num ~= 0 then
						if ID == tostring(Existing) then
							Possible = false
						end
					else
						if tonumber(actualHour) ~= tonumber(Existing) then
							local delFile = pcall(function()
								-- delfile("NotSameServers.json")
								AllIDs = {}
								table.insert(AllIDs, actualHour)
							end)
						end
					end
					num = num + 1
				end
				if Possible == true then
					table.insert(AllIDs, ID)
					wait()
					pcall(function()
						-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
						wait()
						game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
					end)
					wait(.1)
				end
			end
		end
	end
	function Teleport() 
		while wait() do
			pcall(function()
				TPReturner()
				if foundAnything ~= "" then
					TPReturner()
				end
			end)
		end
	end
	Teleport()
end)
kpage:Button("Destroy GUI",function()
	if game.CoreGui:FindFirstChild(_G.Key .."," .. _G.Discord) then
		game.CoreGui:FindFirstChild(_G.Key .."," .. _G.Discord):Destroy()
	 end
end)

spawn(function()
    while wait() do
    pcall(function()
        if not game:IsLoaded() then
            game.Loaded:Wait()
        end
        game.CoreGui.RobloxPromptGui.promptOverlay.DescendantAdded:Connect(function()
            local GUI = game.CoreGui.RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt")
            if GUI then
                if GUI.TitleFrame.ErrorTitle.Text == "Disconnected" then
                    if #game.Players:GetPlayers() <= 1 then
                        game.Players.LocalPlayer:Kick("\nRejoining...")
                        wait()
                        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
                    else
                        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
                    end
                end
            end
        end)
    end)
    end
end)

spawn(function()
    while wait(.1) do
		pcall(function()
			if _G.hopme then
				for i,v in pairs(game.Players:GetChildren()) do
				if v.Name ~= game.Players.LocalPlayer.Name then
					if v.Name:find(_G.nameme) then
						print("Hop")
						local PlaceID = game.PlaceId
							local AllIDs = {}
							local foundAnything = ""
							local actualHour = os.date("!*t").hour
							local Deleted = false
							function TPReturner()
								local Site;
								if foundAnything == "" then
									Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
								else
									Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
								end
								local ID = ""
								if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
									foundAnything = Site.nextPageCursor
								end
								local num = 0;
								for i,v in pairs(Site.data) do
									local Possible = true
									ID = tostring(v.id)
									if tonumber(v.maxPlayers) > tonumber(v.playing) then
										for _,Existing in pairs(AllIDs) do
											if num ~= 0 then
												if ID == tostring(Existing) then
													Possible = false
												end
											else
												if tonumber(actualHour) ~= tonumber(Existing) then
													local delFile = pcall(function()
														-- delfile("NotSameServers.json")
														AllIDs = {}
														table.insert(AllIDs, actualHour)
													end)
												end
											end
											num = num + 1
										end
										if Possible == true then
											table.insert(AllIDs, ID)
											wait()
											pcall(function()
												-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
												wait()
												game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
											end)
											wait(2)
										end
									end
								end
							end
							function Teleport()
								while wait() do
									pcall(function()
										TPReturner()
										if foundAnything ~= "" then
											TPReturner()
										end
									end)
								end
							end
							Teleport()
					end
					end
				end
			end	
		end)
    end
end)

spawn(function()
	while wait() do
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if _G.FarmLevel and MagnetActive and Magnet then
					if v.Name == Ms and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
						if v.Name == "Factory Staff [Lv. 800]" then
							if (v.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 250 then
								v.Head.CanCollide = false
								v.HumanoidRootPart.CanCollide = false
								v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
								v.HumanoidRootPart.CFrame = PosMon
								sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
							end
						elseif v.Name == Ms then
							if (v.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 400 then
								v.Head.CanCollide = false
								v.HumanoidRootPart.CanCollide = false
								v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
								v.HumanoidRootPart.CFrame = PosMon
								sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
							end
						end
					end
                    elseif _G.AutoBone and BoneMagnet and Magnet then
					if (v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]") and (v.HumanoidRootPart.Position - MainMonBone.Position).Magnitude <= 300 then
						v.Head.CanCollide = false
						v.HumanoidRootPart.CanCollide = false
						v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
						v.HumanoidRootPart.CFrame = MainMonBone
                        			v.Humanoid:ChangeState(14)
                        			v.Humanoid.WalkSpeed = 0
                        			v.Humanoid:SetStateEnabled(14)
						sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 99999999999999999999999999999999999999999999999999999999999999999999999)
					end
end
end
end)
end
end)
