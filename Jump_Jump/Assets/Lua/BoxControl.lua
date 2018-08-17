Box = {}
local this = Box
local maxDistance = 3
local currentBox
local boxPrefab
local randomScale
local player
local plane
local oldScale
--生成新的盒子
function this. Awake(obj)
    currentBox = obj
    oldScale = currentBox.transform.localScale
    player = GameObject.Find('Player')
    plane = GameObject.Find('Plane')
    this.GenerateBox()
end

function this.Update(obj)

    if Input.GetKey(KeyCode.Space) then
        --盒子压缩效果
        if currentBox.transform.localScale.y < 0.51 and currentBox.transform.localScale.y > 0.3 then
            currentBox.transform.localScale = currentBox.transform.localScale + Vector3(0, -1, 0) * 0.15 * Time.deltaTime
            currentBox.transform.localPosition = currentBox.transform.localPosition + Vector3(0, -1, 0) * 0.15 * Time.deltaTime
        end
    end
    if Input.GetKeyUp(KeyCode.Space) then
        --DoTween恢复盒子
        Util.DoLocalMoveY(currentBox, 0.25, 0.2)
        Util.DoScale(currentBox, Vector3(oldScale.x, oldScale.y, oldScale.z), 0.2)

    end
    if this.IsInView(obj.transform.position) then
        GameObject.Destroy(obj, 1)
    end
end
--判断盒子是否在摄像机范围内，如果不在便将其删除
function this.IsInView(worldPos)
    local cameraTrans = Camera.main.transform
    local viewPos = Camera.main : WorldToViewportPoint(worldPos)
    local dir = (worldPos - cameraTrans.position).normalized
    local dot = Vector3.Dot(cameraTrans.forward, dir)

    if dot > 0 and viewPos.x > 0 and viewPos.x < 1 and viewPos.y > 0 and viewPos.y < 1 then
        return false
    end
    return true
end

--生成盒子
function this.GenerateBox()
    boxPrefab = Resources.Load('Prefabs/Cube')
    local newBox = GameObject.Instantiate(boxPrefab)
    --盒子随机位置、大小、颜色
    randomScale = Util.Random(0.5, 1)
    newBox.transform.position = currentBox.transform.position + Vector3(Util.Random(1.5, maxDistance), 0, 0)
    plane.transform.localPosition = plane.transform.localPosition + Vector3(Util.Random(1.5, maxDistance), 0, 0)

    newBox.transform.localScale = Vector3(randomScale, 0.5, randomScale)
    newBox : GetComponent('Renderer').material.color = Color(Util.Random(0.0, 1.0), Util.Random(0.0, 1.0), Util.Random(0.0, 1.0))
end




