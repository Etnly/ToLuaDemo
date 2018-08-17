Continue = {}
local this = Continue
function this.ReStart(obj)
    local reStartBtn = obj.transform : Find("ReStart").gameObject
    UIEvent.AddButtonOnClick(reStartBtn, ReStartOnClick)
end

function ReStartOnClick ()
    SceneManagement.SceneManager.LoadScene("Jump")
end
