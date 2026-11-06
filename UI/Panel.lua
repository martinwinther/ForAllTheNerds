local addonName, ns = ...

-- ===========================================================================
-- UI/Panel.lua -- the full write-up: hook, lore paragraphs, a curiosity,
-- source hints, and clickable links to the places inside this one.
-- ===========================================================================

local U, T = ns.U, ns.Theme

local Panel = {}
ns.Panel = Panel

local frame, titleFS, metaFS, scroll, content, bodyFS, closeBtn, backBtn, hereBtn
local childButtons = {}
local linkButtons = {}
local history = {}

local WIDTH, HEIGHT = 470, 540

-- ---------------------------------------------------------------------------
-- Content assembly
-- ---------------------------------------------------------------------------

local function sectionHeader(text)
	return U.Hex(T.color.gold, text)
end

local function buildBody(entry)
	local out = {}

	-- The hook, italicised by convention via colour rather than font, since not
	-- every client ships an italic variant of the game font.
	out[#out + 1] = U.Hex(T.color.parchment, entry.hook)
	out[#out + 1] = ""

	for i = 1, #entry.lore do
		out[#out + 1] = U.Hex(T.color.body, entry.lore[i])
		if i < #entry.lore then out[#out + 1] = "" end
	end

	if entry.didYouKnow and ns.db.showDidYouKnow then
		out[#out + 1] = ""
		out[#out + 1] = sectionHeader("Worth knowing")
		out[#out + 1] = U.Hex(T.color.body, entry.didYouKnow)
	end

	if entry.era == "forever" then
		out[#out + 1] = ""
		out[#out + 1] = U.Hex(T.color.spoiler,
			"This is one of Forever's new zones. The above is background only: "
			.. "where the place sits and what it is built on. Nothing here gives away "
			.. "what happens when you play through it.")
	end

	-- readMore is NOT rendered here. It is laid out as clickable rows further
	-- down, so each reference can hand over a copyable web address.

	return table.concat(out, "\n")
end

-- ---------------------------------------------------------------------------
-- Frame construction
-- ---------------------------------------------------------------------------

local function makeScroll(parent)
	local ok, sf = pcall(CreateFrame, "ScrollFrame", "ForAllTheNerdsPanelScroll", parent, "UIPanelScrollFrameTemplate")
	if ok and sf then return sf, true end

	-- Fallback: a bare ScrollFrame with our own wheel handling.
	sf = CreateFrame("ScrollFrame", "ForAllTheNerdsPanelScroll", parent)
	sf:EnableMouseWheel(true)
	sf:SetScript("OnMouseWheel", function(self, dir)
		local cur = self:GetVerticalScroll()
		local max = self:GetVerticalScrollRange()
		local new = cur - dir * 40
		if new < 0 then new = 0 end
		if new > max then new = max end
		self:SetVerticalScroll(new)
	end)
	return sf, false
end

local function clearChildButtons()
	for i = 1, #childButtons do
		childButtons[i]:Hide()
	end
end

local function getChildButton(i, parent)
	if childButtons[i] then return childButtons[i] end
	local b = CreateFrame("Button", nil, parent)
	b:SetHeight(16)
	b.text = T.Text(b, "OVERLAY", -1, T.color.accent)
	b.text:SetPoint("LEFT", 0, 0)
	b:SetScript("OnEnter", function(self)
		self.text:SetTextColor(1, 0.85, 0.3)
	end)
	b:SetScript("OnLeave", function(self)
		local r, g, bl = U.RGB(T.color.accent)
		self.text:SetTextColor(r, g, bl)
	end)
	b:SetScript("OnClick", function(self)
		if self.entry then Panel:Show(self.entry, true) end
	end)
	childButtons[i] = b
	return b
end

-- ---------------------------------------------------------------------------
-- Source links
--
-- The client cannot open a browser, and there is no API that will. The usual
-- addon answer, and the only one that actually helps, is to show the address in
-- a focused edit box with the text already selected, so Ctrl+C works straight
-- away.
-- ---------------------------------------------------------------------------

local function linkOnEnter(self)
	self.text:SetTextColor(1, 0.85, 0.3)
	if GameTooltip and self.ftnURL then
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:AddLine(self.ftnLabel or "Reference", 1, 0.82, 0)
		GameTooltip:AddLine(self.ftnURL, 0.6, 0.8, 1, true)
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine("Click for a copyable address", 0.6, 0.6, 0.6)
		GameTooltip:Show()
	end
end

local function linkOnLeave(self)
	local r, g, b = U.RGB(T.color.accent)
	self.text:SetTextColor(r, g, b)
	if GameTooltip then GameTooltip:Hide() end
end

local function linkOnClick(self)
	if self.ftnURL then Panel:ShowURL(self.ftnURL, self.ftnLabel) end
end

local function clearLinkButtons()
	for i = 1, #linkButtons do linkButtons[i]:Hide() end
end

local function getLinkButton(i, parent)
	if linkButtons[i] then return linkButtons[i] end
	local b = CreateFrame("Button", nil, parent)
	b:SetHeight(16)
	b.text = T.Text(b, "OVERLAY", -1, T.color.accent)
	b.text:SetPoint("LEFT", 0, 0)
	linkButtons[i] = b
	return b
end

-- The copy-this-address window.
local urlFrame, urlBox, urlTitle

local function buildURLFrame()
	if urlFrame then return end

	urlFrame = T.Frame("ForAllTheNerdsURLFrame", UIParent, "BackdropTemplate")
	urlFrame:SetSize(470, 132)
	urlFrame:SetFrameStrata("FULLSCREEN_DIALOG")
	urlFrame:SetClampedToScreen(true)
	urlFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 140)
	T.ApplyBackdrop(urlFrame, 0.97)
	T.MakeMovable(urlFrame, nil)
	urlFrame:Hide()

	urlTitle = T.Text(urlFrame, "OVERLAY", 2, T.color.gold)
	urlTitle:SetPoint("TOPLEFT", 16, -14)
	urlTitle:SetPoint("RIGHT", urlFrame, "RIGHT", -16, 0)
	urlTitle:SetHeight(18)

	local hint = T.Text(urlFrame, "OVERLAY", -2, T.color.dim)
	hint:SetPoint("TOPLEFT", urlTitle, "BOTTOMLEFT", 0, -6)
	hint:SetWidth(430)
	hint:SetWordWrap(true)
	hint:SetText("The game cannot open a browser. The address is selected already, "
		.. "so press Ctrl+C and paste it into one.")

	local ok, box = pcall(CreateFrame, "EditBox", nil, urlFrame, "InputBoxTemplate")
	if not (ok and box) then
		box = CreateFrame("EditBox", nil, urlFrame)
		local bg = box:CreateTexture(nil, "BACKGROUND")
		bg:SetAllPoints(box)
		bg:SetColorTexture(0, 0, 0, 0.6)
	end
	urlBox = box
	urlBox:SetSize(418, 22)
	urlBox:SetPoint("BOTTOMLEFT", 22, 46)
	urlBox:SetAutoFocus(false)
	if not pcall(function() urlBox:SetFontObject("ChatFontNormal") end) then
		local path = GameFontHighlight and GameFontHighlight:GetFont()
		if path then urlBox:SetFont(path, 12, "") end
	end

	-- Treat the box as read-only without making it unselectable: if anything
	-- changes the text, put it back and re-select it.
	urlBox:SetScript("OnTextChanged", function(self)
		if self.ftnURL and self:GetText() ~= self.ftnURL then
			self:SetText(self.ftnURL)
			self:HighlightText()
		end
	end)
	urlBox:SetScript("OnEscapePressed", function() urlFrame:Hide() end)
	urlBox:SetScript("OnEnterPressed", function(self) self:HighlightText() end)

	local closeOK, closeBtn = pcall(CreateFrame, "Button", nil, urlFrame, "UIPanelCloseButton")
	if closeOK and closeBtn then
		closeBtn:SetPoint("TOPRIGHT", -4, -4)
	else
		closeBtn = CreateFrame("Button", nil, urlFrame)
		closeBtn:SetSize(24, 24)
		closeBtn:SetPoint("TOPRIGHT", -8, -8)
		local x = T.Text(closeBtn, "OVERLAY", 4, T.color.gold)
		x:SetPoint("CENTER")
		x:SetText("X")
	end
	closeBtn:SetScript("OnClick", function() urlFrame:Hide() end)
end

function Panel:ShowURL(url, label)
	if not url then return end
	buildURLFrame()
	urlTitle:SetText(label or "Copy this address")
	urlBox.ftnURL = url
	urlBox:SetText(url)
	urlFrame:Show()
	urlBox:SetFocus()
	urlBox:HighlightText()
end

function Panel:HideURL()
	if urlFrame then urlFrame:Hide() end
end

local function build()
	if frame then return end

	frame = T.Frame("ForAllTheNerdsPanel", UIParent, "BackdropTemplate")
	frame:SetSize(WIDTH, HEIGHT)
	frame:SetFrameStrata("DIALOG")
	frame:SetClampedToScreen(true)
	frame:SetScale((ns.db and ns.db.panelScale) or 1)
	T.ApplyBackdrop(frame, 0.95)
	T.RestorePosition(frame, "panelPoint", "CENTER", 0, 0)
	T.MakeMovable(frame, "panelPoint")
	frame:Hide()

	-- Escape should close it, like any other addon window.
	frame:SetScript("OnKeyDown", function(self, key)
		if key == "ESCAPE" then
			self:SetPropagateKeyboardInput(false)
			Panel:Hide()
		else
			self:SetPropagateKeyboardInput(true)
		end
	end)

	titleFS = T.Text(frame, "OVERLAY", 6, T.color.gold)
	titleFS:SetPoint("TOPLEFT", 16, -14)
	titleFS:SetPoint("RIGHT", frame, "RIGHT", -40, 0)
	titleFS:SetHeight(22)

	metaFS = T.Text(frame, "OVERLAY", -2, T.color.dim)
	metaFS:SetPoint("TOPLEFT", titleFS, "BOTTOMLEFT", 0, -3)
	metaFS:SetPoint("RIGHT", frame, "RIGHT", -16, 0)
	metaFS:SetHeight(14)

	local ok, btn = pcall(CreateFrame, "Button", nil, frame, "UIPanelCloseButton")
	if ok and btn then
		closeBtn = btn
		closeBtn:SetPoint("TOPRIGHT", -4, -4)
	else
		closeBtn = CreateFrame("Button", nil, frame)
		closeBtn:SetSize(24, 24)
		closeBtn:SetPoint("TOPRIGHT", -8, -8)
		local x = T.Text(closeBtn, "OVERLAY", 4, T.color.gold)
		x:SetPoint("CENTER")
		x:SetText("X")
	end
	closeBtn:SetScript("OnClick", function() Panel:Hide() end)

	-- Footer buttons
	backBtn = CreateFrame("Button", nil, frame)
	backBtn:SetSize(70, 20)
	backBtn:SetPoint("BOTTOMLEFT", 16, 12)
	backBtn.text = T.Text(backBtn, "OVERLAY", -1, T.color.accent)
	backBtn.text:SetPoint("LEFT")
	backBtn.text:SetText("< Back")
	backBtn:SetScript("OnClick", function() Panel:Back() end)
	backBtn:Hide()

	hereBtn = CreateFrame("Button", nil, frame)
	hereBtn:SetSize(110, 20)
	hereBtn:SetPoint("BOTTOMRIGHT", -16, 12)
	hereBtn.text = T.Text(hereBtn, "OVERLAY", -1, T.color.accent)
	hereBtn.text:SetPoint("RIGHT")
	hereBtn.text:SetJustifyH("RIGHT")
	hereBtn.text:SetText("Where I am >")
	hereBtn:SetScript("OnClick", function()
		if ns.Detect and ns.Detect.entry then Panel:Show(ns.Detect.entry, true) end
	end)

	scroll = makeScroll(frame)
	scroll:SetPoint("TOPLEFT", 16, -56)
	scroll:SetPoint("BOTTOMRIGHT", -32, 40)

	content = CreateFrame("Frame", nil, scroll)
	content:SetSize(WIDTH - 56, 10)
	scroll:SetScrollChild(content)

	bodyFS = T.Text(content, "OVERLAY", 0, T.color.body)
	bodyFS:SetPoint("TOPLEFT", 0, 0)
	bodyFS:SetWidth(WIDTH - 60)
	bodyFS:SetSpacing(3)
	bodyFS:SetWordWrap(true)
end

-- ---------------------------------------------------------------------------
-- Public
-- ---------------------------------------------------------------------------

function Panel:Show(entry, pushHistory)
	if not entry then return end
	build()

	if pushHistory and self.current and self.current ~= entry then
		history[#history + 1] = self.current
	end
	self.current = entry

	frame:SetScale((ns.db and ns.db.panelScale) or 1)

	titleFS:SetText(entry.name)

	local bits = {}
	local kind = T.kindLabel[entry.kind]
	if kind then bits[#bits + 1] = U.Hex(T.color.dim, kind) end
	if entry.parent then bits[#bits + 1] = U.Hex(T.color.dim, "in " .. entry.parent) end
	if entry.continent then bits[#bits + 1] = U.Hex(T.color.dim, entry.continent) end
	local faction = T.FactionTag(entry)
	if faction ~= "" then bits[#bits + 1] = faction end
	if entry.levels then bits[#bits + 1] = U.Hex(T.color.dim, entry.levels) end
	metaFS:SetText(table.concat(bits, U.Hex("555555", "  -  ")))

	bodyFS:SetText(buildBody(entry))

	-- Clickable list of the places inside this one.
	clearChildButtons()
	local kids = ns.Index and ns.Index.children and ns.Index.children[entry.key]
	local lastAnchor, usedButtons = bodyFS, 0

	if kids and #kids > 0 then
		local header = getChildButton(1, content)
		-- Reuse slot 1 as the header by disabling its click.
		header.entry = nil
		header:SetScript("OnClick", nil)
		header.text:SetText(sectionHeader("Places inside " .. entry.name))
		header:SetPoint("TOPLEFT", bodyFS, "BOTTOMLEFT", 0, -14)
		header:SetWidth(WIDTH - 60)
		header:Show()
		lastAnchor, usedButtons = header, 1

		local shown = 0
		for i = 1, #kids do
			local kid = kids[i]
			if ns.IsVisible(kid) and kid ~= entry then
				shown = shown + 1
				local b = getChildButton(usedButtons + shown, content)
				b.entry = kid
				b:SetScript("OnClick", function(self)
					if self.entry then Panel:Show(self.entry, true) end
				end)
				b.text:SetText("  " .. kid.name)
				b:SetWidth(WIDTH - 60)
				b:SetPoint("TOPLEFT", lastAnchor, "BOTTOMLEFT", 0, -2)
				b:Show()
				lastAnchor = b
			end
		end
		usedButtons = usedButtons + shown
	end

	-- Source references, one clickable row each.
	clearLinkButtons()
	local usedLinks = 0
	if entry.readMore and #entry.readMore > 0 and ns.db.showReadMore then
		local header = getLinkButton(1, content)
		header.ftnURL, header.ftnLabel = nil, nil
		header:SetScript("OnEnter", nil)
		header:SetScript("OnLeave", nil)
		header:SetScript("OnClick", nil)
		header.text:SetText(sectionHeader("If you want to go deeper"))
		header:SetWidth(WIDTH - 60)
		header:SetPoint("TOPLEFT", lastAnchor, "BOTTOMLEFT", 0, -14)
		header:Show()
		lastAnchor, usedLinks = header, 1

		for i = 1, #entry.readMore do
			local ref = entry.readMore[i]
			local url = U.WikiURL(ref)
			local title = U.WikiTitle(ref) or ref
			usedLinks = usedLinks + 1
			local b = getLinkButton(usedLinks, content)
			b.ftnURL, b.ftnLabel = url, title
			b:SetWidth(WIDTH - 60)
			b:SetPoint("TOPLEFT", lastAnchor, "BOTTOMLEFT", 0, -2)
			if url then
				b.text:SetText("  " .. title)
				local r, g, bl = U.RGB(T.color.accent)
				b.text:SetTextColor(r, g, bl)
				b:SetScript("OnEnter", linkOnEnter)
				b:SetScript("OnLeave", linkOnLeave)
				b:SetScript("OnClick", linkOnClick)
			else
				b.text:SetText("  " .. U.Hex(T.color.dim, title))
				b:SetScript("OnEnter", nil)
				b:SetScript("OnLeave", nil)
				b:SetScript("OnClick", nil)
			end
			b:Show()
			lastAnchor = b
		end
	end

	-- Size the scroll child to its contents.
	local height = bodyFS:GetStringHeight() + 14 + (usedButtons * 18) + 14 + (usedLinks * 18) + 20
	content:SetHeight(math.max(height, 10))
	scroll:SetVerticalScroll(0)

	if #history > 0 then backBtn:Show() else backBtn:Hide() end

	frame:Show()
	frame:EnableKeyboard(true)

	if ns.db and ns.db.stats then
		ns.db.stats.read = (ns.db.stats.read or 0) + 1
	end
end

function Panel:Back()
	local prev = table.remove(history)
	if prev then
		self.current = nil
		self:Show(prev, false)
	end
end

function Panel:Hide()
	if not frame then return end
	frame:EnableKeyboard(false)
	frame:Hide()
	self:HideURL()
	history = {}
	self.current = nil
end

function Panel:Toggle(entry)
	build()
	if frame:IsShown() and (not entry or entry == self.current) then
		self:Hide()
	else
		self:Show(entry or (ns.Detect and ns.Detect.entry), false)
	end
end

function Panel:IsShown()
	return frame and frame:IsShown()
end

-- Keep the "Where I am" button honest when the player walks off.
function Panel:OnLocationChanged(entry)
	if not (frame and frame:IsShown() and hereBtn) then return end
	if entry and entry ~= self.current then
		hereBtn.text:SetText("Where I am >")
	end
end
