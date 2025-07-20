vanilla_model.ARMOR:setVisible(false)
vanilla_model.CAPE:setVisible(false)
vanilla_model.ELYTRA:setVisible(false)
vanilla_model.PLAYER:setVisible(false)

local CamPivot = require("GSCameraPivot")
local my_pivot = CamPivot.newCamera(
  models.model.root.Head,
  vec(0, 0, 0),
  false, -- Set to `true` to forbid rolling the camera.
  true  -- Set to `true` to hide the part you entered above while in first person. (Used for FPM mods.)
       -- Set to a different model part to hide that model part instead.
)
CamPivot.setActiveCamera(my_pivot)

--hide legs when crouching
local leftLeg = models.model.root.LeftLeg
local rightLeg = models.model.root.RightLeg

events.render:register(function()
    local pose = player:getPose()

    if pose == "CROUCHING" then
        leftLeg:setVisible(false)
        rightLeg:setVisible(false)
    else
        leftLeg:setVisible(true)
        rightLeg:setVisible(true)
    end
end)

--action wheel for animations
local mainPage = action_wheel:newPage()
action_wheel:setPage(mainPage)

function pings.actionClicked()
    animations.model.wave:play()
end

local action = mainPage:newAction()
    :title("Wave")
    :item("minecraft:stick")
    :hoverColor(1, 0, 1)
    :onLeftClick(pings.actionClicked)

--fix nameplate
nameplate.ENTITY:setPos(vec(0, -0.5, 0))