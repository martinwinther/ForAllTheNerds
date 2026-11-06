local addonName, ns = ...

-- ===========================================================================
-- UI/Options.lua -- a canvas settings page, registered with the modern
-- Settings API where it exists and with the legacy interface options
-- otherwise. Falls back to a standalone window if neither is available.
-- ===========================================================================

local U, T = ns.U, ns.Theme

local O = {}
ns.Options = O

local panel, category, standalone
local widgets = {}

-- Try several template names, since the checkbox and slider templates have
-- been renamed across clients. Returns the frame, or a bare frame if no
-- template matched.
local function tryTemplates(frameType, parent, templates)
	for i = 1, #templates do
		local ok, f = pcall(CreateFrame, frameType, nil, parent, templates[i])
		if ok and f then return f, templates[i] end
	end
	return CreateFrame(frameType, nil, parent), nil
end

-- ---------------------------------------------------------------------------
-- Widgets
-- ---------------------------------------------------------------------------

local function makeCheck(parent, label, tooltip, key, onChange)
	local cb = tryTemplates("CheckButton", parent, {
		"InterfaceOptionsCheckButtonTemplate",
		"UICheckButtonTemplate",
		"ChatConfigCheckButtonTemplate",
	})
	cb:SetSize(26, 26)

	local text = cb.Text or cb.text
	if not text then
		text = T.Text(cb, "OVERLAY", 0, T.color.parchment)
		text:SetPoint("LEFT", cb, "RIGHT", 4, 0)
		cb.ftnText = text
	end
	text:SetText(label)
	if text.SetTextColor then
		local r, g, b = U.RGB(T.color.parchment)
		text:SetTextColor(r, g, b)
	end

	cb.ftnKey = key
	cb:SetScript("OnClick", function(self)
		local on = self:GetChecked() and true or false
		ns.db[key] = on
		if onChange then onChange(on) end
	end)

	if tooltip then
		cb:SetScript("OnEnter", function(self)
			if not GameTooltip then return end
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine(label, 1, 0.82, 0)
			GameTooltip:AddLine(tooltip, 0.85, 0.82, 0.75, true)
			GameTooltip:Show()
		end)
		cb:SetScript("OnLeave", function() if GameTooltip then GameTooltip:Hide() end end)
	end

	widgets[#widgets + 1] = cb
	return cb
end

local function makeSlider(parent, label, key, minV, maxV, step, fmt, onChange)
	local s = tryTemplates("Slider", parent, { "OptionsSliderTemplate", "UISliderTemplate" })
	s:SetSize(220, 16)
	s:SetOrientation("HORIZONTAL")
	s:SetMinMaxValues(minV, maxV)
	s:SetValueStep(step)
	if s.SetObeyStepOnDrag then s:SetObeyStepOnDrag(true) end

	local title = T.Text(s, "OVERLAY", -1, T.color.parchment)
	title:SetPoint("BOTTOMLEFT", s, "TOPLEFT", 0, 4)
	s.ftnTitle = title
	s.ftnKey = key
	s.ftnFmt = fmt or "%s"

	-- The template's own labels are inconsistent across clients, so hide them
	-- and use our own.
	local name = s:GetName()
	if name then
		for _, suffix in ipairs({ "Low", "High", "Text" }) do
			local fs = _G[name .. suffix]
			if fs and fs.SetText then fs:SetText("") end
		end
	end
	if s.Low then s.Low:SetText("") end
	if s.High then s.High:SetText("") end
	if s.Text then s.Text:SetText("") end

	s:SetScript("OnValueChanged", function(self, value)
		value = math.floor(value / step + 0.5) * step
		ns.db[key] = value
		self.ftnTitle:SetText(string.format("%s: %s", label, string.format(self.ftnFmt, value)))
		if onChange then onChange(value) end
	end)

	s.ftnLabel = label
	widgets[#widgets + 1] = s
	return s
end

-- ---------------------------------------------------------------------------
-- Layout
-- ---------------------------------------------------------------------------

local function buildPanel(parent)
	local header = T.Text(parent, "OVERLAY", 8, T.color.gold)
	header:SetPoint("TOPLEFT", 16, -16)
	header:SetText("ForAllTheNerds")

	local sub = T.Text(parent, "OVERLAY", -1, T.color.dim)
	sub:SetPoint("TOPLEFT", header, "BOTTOMLEFT", 0, -4)
	sub:SetWidth(540)
	sub:SetWordWrap(true)
	sub:SetText("Lore and history for wherever you are standing. Vanilla-era only: nothing after patch 1.12, "
		.. "and no spoilers for new content.")

	local y = -70
	local function place(w, indent, gap)
		w:SetPoint("TOPLEFT", parent, "TOPLEFT", 16 + (indent or 0), y)
		y = y - (gap or 28)
	end

	local function sectionLabel(text)
		local fs = T.Text(parent, "OVERLAY", 2, T.color.gold)
		fs:SetPoint("TOPLEFT", parent, "TOPLEFT", 16, y)
		fs:SetText(text)
		y = y - 24
		return fs
	end

	sectionLabel("When to speak up")
	place(makeCheck(parent, "Enable ForAllTheNerds", "Master switch. Nothing is shown when this is off.", "enabled"))
	place(makeCheck(parent, "Show a card when I arrive somewhere", "Pops the small fading card. Turn this off to use /ftn only.", "autoToast"), 16)
	place(makeCheck(parent, "...for full zones", "Elwynn Forest, The Barrens, and so on.", "toastZones"), 32)
	place(makeCheck(parent, "...for towns and landmarks", "Goldshire, Northshire Abbey, the Master's Glaive.", "toastSubzones"), 32)
	place(makeCheck(parent, "...for dungeons and raids", "Shown when you step inside an instance.", "toastDungeons"), 32)
	place(makeCheck(parent, "Only the first time I ever visit", "Instead of once per session. Remembered per character.", "onlyFirstVisit"), 16)
	place(makeCheck(parent, "Stay quiet while I am in combat", "Holds the card back until the fight ends.", "suppressInCombat"), 16)
	place(makeCheck(parent, "Stay quiet on flight paths",
		"A taxi route crosses dozens of places in a couple of minutes. With this on, none of "
		.. "them are announced and none are recorded as visited, so flying over somewhere does "
		.. "not use up its first visit.", "suppressOnTaxi"), 16)

	y = y - 8
	sectionLabel("How to show it")
	place(makeCheck(parent, "Also print the one-liner to chat", "Useful if you want to scroll back through where you have been.", "chatEcho"))
	place(makeCheck(parent, "Open the full panel instead of the card", "Skips the card entirely. Can be intrusive while levelling.", "autoOpenPanel"))
	place(makeCheck(parent, "Show the minimap button", nil, "minimapButton", function()
		if ns.Minimap then ns.Minimap:Refresh() end
	end))

	y = y - 16
	place(makeSlider(parent, "Minimap button position", "minimapAngle", 0, 355, 5, "%d degrees",
		function() if ns.Minimap then ns.Minimap:Reposition() end end), 0, 44)
	place(makeSlider(parent, "Minimap button distance", "minimapOffset", -10, 48, 1, "%d px past the edge",
		function() if ns.Minimap then ns.Minimap:Reposition() end end), 0, 44)

	y = y - 16
	place(makeSlider(parent, "Card stays up for", "toastSeconds", 3, 30, 1, "%d seconds"), 0, 44)
	place(makeSlider(parent, "Do not repeat a place for", "repeatCooldown", 60, 3600, 60, "%d seconds"), 0, 44)
	place(makeSlider(parent, "Panel scale", "panelScale", 0.7, 1.5, 0.05, "%.2f"), 0, 44)
	place(makeSlider(parent, "Text size", "fontSize", 10, 20, 1, "%d"), 0, 44)

	y = y - 8
	sectionLabel("Content")
	place(makeCheck(parent, "Note places that have no entry yet",
		"Records the names the game gives for places this addon has nothing written for, so the "
		.. "gaps can be filled in later. Nothing is sent anywhere; /ftn gaps shows the list.",
		"logUnknown"))
	place(makeCheck(parent, "Show the 'Worth knowing' curiosity", nil, "showDidYouKnow"))
	place(makeCheck(parent, "Show source links", "The 'if you want to go deeper' list at the bottom of a write-up. Click one for a copyable web address.", "showReadMore"))
	place(makeCheck(parent, "Link to Wowpedia instead of Warcraft Wiki",
		"Off by default. The lore here was checked against warcraft.wiki.gg, which is where the "
		.. "editors moved. Turn this on to get wowpedia.fandom.com addresses instead.", "useFandomWiki"), 16)
	place(makeCheck(parent, "Include Forever's new zones",
		"Off by default. These entries cover Mount Hyjal, Riverglades, Shen'dralas and Zephras Isle, "
		.. "and they are written as background only - no questline spoilers. Turn on if you want the "
		.. "history behind the new zones as you walk into them.", "showForeverContent"))

	y = y - 16
	local footer = T.Text(parent, "OVERLAY", -1, T.color.dim)
	footer:SetPoint("TOPLEFT", parent, "TOPLEFT", 16, y)
	footer:SetWidth(540)
	footer:SetWordWrap(true)
	footer:SetText("Type /ftn for help. /ftn <place name> looks anything up by name.")

	parent.ftnHeight = math.abs(y) + 40
end

function O:Refresh()
	if not ns.db then return end
	for i = 1, #widgets do
		local w = widgets[i]
		if w.ftnKey then
			if w:GetObjectType() == "CheckButton" then
				w:SetChecked(ns.db[w.ftnKey] and true or false)
			elseif w:GetObjectType() == "Slider" then
				w:SetValue(ns.db[w.ftnKey] or 0)
				if w.ftnTitle then
					w.ftnTitle:SetText(string.format("%s: %s", w.ftnLabel,
						string.format(w.ftnFmt, ns.db[w.ftnKey] or 0)))
				end
			end
		end
	end
end

local function ensurePanel()
	if panel then return end

	panel = T.Frame("ForAllTheNerdsOptionsPanel", UIParent)
	panel.name = "ForAllTheNerds"
	panel:Hide()
	buildPanel(panel)

	-- 1. Modern Settings API (shared Mainline code, present on Forever).
	if Settings and type(Settings.RegisterCanvasLayoutCategory) == "function"
		and type(Settings.RegisterAddOnCategory) == "function" then
		local ok, cat = pcall(Settings.RegisterCanvasLayoutCategory, panel, "ForAllTheNerds")
		if ok and cat then
			category = cat
			-- Some builds require an explicit ID before registration sticks.
			if cat.ID == nil then cat.ID = "ForAllTheNerds" end
			pcall(Settings.RegisterAddOnCategory, cat)
			panel:SetScript("OnShow", function() O:Refresh() end)
			return
		end
	end

	-- 2. Legacy interface options.
	if type(InterfaceOptions_AddCategory) == "function" then
		panel:SetScript("OnShow", function() O:Refresh() end)
		local ok = pcall(InterfaceOptions_AddCategory, panel)
		if ok then return end
	end

	-- 3. Neither: host the panel in our own window.
	standalone = T.Frame("ForAllTheNerdsOptionsWindow", UIParent, "BackdropTemplate")
	standalone:SetSize(600, math.min(panel.ftnHeight or 600, 700))
	standalone:SetPoint("CENTER")
	standalone:SetFrameStrata("DIALOG")
	T.ApplyBackdrop(standalone, 0.95)
	T.MakeMovable(standalone, nil)
	standalone:Hide()

	panel:SetParent(standalone)
	panel:ClearAllPoints()
	panel:SetAllPoints(standalone)
	panel:Show()

	local close = CreateFrame("Button", nil, standalone)
	close:SetSize(24, 24)
	close:SetPoint("TOPRIGHT", -8, -8)
	local x = T.Text(close, "OVERLAY", 4, T.color.gold)
	x:SetPoint("CENTER")
	x:SetText("X")
	close:SetScript("OnClick", function() standalone:Hide() end)
end

function O:Open()
	ensurePanel()
	self:Refresh()

	if category and Settings and type(Settings.OpenToCategory) == "function" then
		local ok = pcall(Settings.OpenToCategory, category.ID or category)
		if ok then return end
	end

	if type(InterfaceOptionsFrame_OpenToCategory) == "function" then
		-- The old API needed calling twice to actually land on the page.
		pcall(InterfaceOptionsFrame_OpenToCategory, panel)
		pcall(InterfaceOptionsFrame_OpenToCategory, panel)
		if InterfaceOptionsFrame and InterfaceOptionsFrame:IsShown() then return end
	end

	if standalone then
		standalone:Show()
		return
	end

	U.Print("could not open the settings window on this client. Use the /ftn commands instead.")
end

ns.OnReady(function()
	-- Build at login so the category appears in the game's own settings list
	-- without the user having to run a command first.
	ensurePanel()
	O:Refresh()
end)
