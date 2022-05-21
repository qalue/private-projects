local uilib=loadstring(game:HttpGet'https://raw.githubusercontent.com/qalue/projects/main/uilibrary.lua')();
getgenv().API=loadstring(game:HttpGet'https://raw.githubusercontent.com/qalue/private-projects/main/apishits')("Eclipse.cfg");

local RepStore,RunService,UIS,Players,Lighting,ScriptContext,PerformanceStats,TeleportService,HttpService,MarketplaceService,VirtualUser,VirtualInputManager,CoreGui=game:GetService'ReplicatedStorage',game:GetService'RunService',game:GetService'UserInputService',game:GetService'Players',game:GetService'Lighting',game:GetService'ScriptContext',game:GetService'Stats'.PerformanceStats,game:GetService'TeleportService',game:GetService'HttpService',game:GetService'MarketplaceService',game:GetService'VirtualUser',game:GetService'VirtualInputManager',game.CoreGui;
local LP,StarterGui=Players.LocalPlayer,game.StarterGui;
local PlayerUI,Config=LP.PlayerGui
local C_R,C_C,R_Module,hook_func,fwait,tdelay,lstring,Mouse,Stepped,cframe,vector3,wrkspc,gs,tstring,xp_call,p_call,instance,Heartbeat,Character,MFloor,gc,setthreadidentity=coroutine.resume,coroutine.create,require,hookfunction,task.wait,task.delay,loadstring,LP:GetMouse(),RunService.Stepped,CFrame,Vector3,workspace,getsenv,tostring,xpcall,pcall,Instance,RunService.Heartbeat,LP.Character,math.floor,getconnections,set_thread_identity or setidentity or setthreadcontext or syn.set_thread_identity;
GUISettings.Weapons.SilentAim.AimPart = "Head"
GUISettings.Weapons.SilentAim.AimType = "Distance"

uilib:CreateWindow()

uilib:Section("Player",true)

uilib:Button("Deploy", function()
    API.Character:Deploy();
end)
uilib:Button("Reset Character",function()
    API.Character:ResetCharacter();
end)
uilib:Input("Set Walkspeed","Walkspeed",false,true,function(inputtedText)
    if inputtedText then
        GUISettings.Character.CurrentWalkSpeed = tonumber(inputtedText) or 24
    end
end,GUISettings.Character.CurrentWalkSpeed)
uilib:Input("Set Jump Power","Jump Power",false,true,function(inputtedText)
    if inputtedText then
        GUISettings.Character.JumpPower = tonumber(inputtedText) or 36
    end
end,GUISettings.Character.JumpPower)
uilib:Toggle("ESP",function(state)
    if state then
        GUISettings.Enemies.ESP = state;
        API:Loop('ESP',API.ESP.Apply);
    else
        API.ESP:Remove();
        API:Disconnect'ESP';
    end
end,GUISettings.Enemies.ESP)
uilib:Toggle("Infinite Jump",function(state)
    GUISettings.Character.InfiniteJump = state
end,GUISettings.Character.InfiniteJump)

uilib:Section("Misc")

uilib:Bind("Toggle UI",function(key)
    if key then
        GUISettings.Settings.ToggleUIKey=key;
    end;
    game.CoreGui.Eclipse.Enabled = not game.CoreGui.Eclipse.Enabled
end,GUISettings.Settings.ToggleUIKey)
uilib:Button("Save Configuration",function()
    API.Settings:SaveConfiguration()
end)
uilib:Button("Redeem Codes",function()
    API.Codes.RedeemAllCodes()
end)

uilib:Section("Weapon")

uilib:Button("No Recoil",function()
    API.Weapons:ApplyWeaponModification'Recoil'
end)
uilib:Button("All Weapons Auto",function()
    API.Weapons:ApplyWeaponModification'self'
end)
uilib:Toggle("Silent Aim",function(state)
    GUISettings.Weapons.SilentAim.Enabled = state
end,GUISettings.Weapons.SilentAim.Enabled)
uilib:Toggle("Infinite Ammo",function(state)
    GUISettings.Weapons.InfiniteAmmo = state
    if state == true then
        API:Loop('Infinite Ammo',API.Weapons.InfiniteAmmo);
    else
        API:Disconnect'Infinite Ammo';
    end
end,GUISettings.Weapons.InfiniteAmmo)
uilib:Toggle("Rapid Fire",function(state)
    GUISettings.Weapons.RapidFire = state
end,GUISettings.Weapons.RapidFire)
