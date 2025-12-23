local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "C1D Hub | Library",
   LoadingTitle = "C1D Hub",
   LoadingSubtitle = "by cid",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "C1DHub",
      FileName = "C1DLibrary"
   },
   Discord = {
      Enabled = false,
      Invite = "",
      RememberJoins = true
   },
   KeySystem = false
})

local buttonData = {
    ["Adopt Me (Autofarm Gingerbread)"] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/konai67/XENO99/refs/heads/main/main.lua'))()",
    ["Adopt Me (Pet Spawner V1)"] = "loadstring(game:HttpGet('https://pastefy.app/nTv8VJUz/raw'))()",
    ["Murder Mystery 2 (Autofarm snowflakes)"] = "loadstring(game:HttpGet('https://pastefy.app/m6FABx1Q/raw'))()",
    ["Ronix Hub"] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/StonK-StonK/RonixHub/main/Main'))()",
    ["Thunder Z Hub"] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/ThunderZ-05/HUB/main/Script'))()",
    ["Limit Hub"] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/Limit-Hub/Limit-Hub/main/Main'))()",
    ["Speed Hub"] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua'))()",
    ["Quantum Hub"] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/QuantumHub/Main/main/Loader'))()"
}

local lastUsedScript = "None"

local function ExecuteScript(name, scriptCode)
    if scriptCode == "" then
        Rayfield:Notify({
           Title = "Empty Script",
           Content = "No script provided for " .. name,
           Duration = 3,
           Image = 4483362458,
        })
        return
    end

    lastUsedScript = name
    Rayfield:Notify({
       Title = "Executing",
       Content = name,
       Duration = 3,
       Image = 4483362458,
    })
    
    local success, err = pcall(function()
        local func = loadstring(scriptCode)
        if func then
            func()
        else
            error("Failed to parse script")
        end
    end)
    
    if not success then
         Rayfield:Notify({
           Title = "Error",
           Content = "Check Console (F9).",
           Duration = 5,
           Image = 4483362458,
        })
        warn("Execution Error:", err)
    else
        Rayfield:Notify({
           Title = "Success",
           Content = name .. " is running!",
           Duration = 3,
           Image = 4483362458,
        })
    end
end

--- TABS ---

local AllTab = Window:CreateTab("ALL", 4483362458)
for name, scriptCode in pairs(buttonData) do
    AllTab:CreateButton({
       Name = name,
       Callback = function()
           ExecuteScript(name, scriptCode)
       end,
    })
end

local AdoptMeTab = Window:CreateTab("ADM", 4483362458)
for name, scriptCode in pairs(buttonData) do
    if name:find("Adopt Me") then
        AdoptMeTab:CreateButton({
           Name = name:gsub("Adopt Me %(%s*(.-)%s*%)", "%1"),
           Callback = function()
               ExecuteScript(name, scriptCode)
           end,
        })
    end
end

local MM2Tab = Window:CreateTab("MM2", 4483362458)
for name, scriptCode in pairs(buttonData) do
    if name:find("Murder Mystery 2") then
        MM2Tab:CreateButton({
           Name = name:gsub("Murder Mystery 2 %(%s*(.-)%s*%)", "%1"),
           Callback = function()
               ExecuteScript(name, scriptCode)
           end,
        })
    end
end

local OthersTab = Window:CreateTab("OTHERS", 4483362458)
local hubs = {"Ronix Hub", "Thunder Z Hub", "Limit Hub", "Speed Hub", "Quantum Hub"}
for _, name in ipairs(hubs) do
    if buttonData[name] then
        OthersTab:CreateButton({
           Name = name,
           Callback = function()
               ExecuteScript(name, buttonData[name])
           end,
        })
    end
end

-- INFO TAB
local InfoTab = Window:CreateTab("Info", 4483362458)
InfoTab:CreateSection("Community")
InfoTab:CreateButton({
   Name = "Copy Discord Server",
   Callback = function()
       setclipboard("https://discord.gg/Uwwbd2T3cf")
       Rayfield:Notify({
          Title = "Copied!",
          Content = "Discord link copied to clipboard.",
          Duration = 3,
          Image = 4483362458,
       })
   end,
})

InfoTab:CreateParagraph({
    Title = "Join here for more updates:",
    Content = "https://discord.gg/Uwwbd2T3cf"
})

InfoTab:CreateSection("History")
InfoTab:CreateButton({
   Name = "Show Last Used",
   Callback = function()
       Rayfield:Notify({
          Title = "Last Script",
          Content = lastUsedScript,
          Duration = 4,
          Image = 4483362458,
       })
   end,
})

Rayfield:LoadConfiguration()
