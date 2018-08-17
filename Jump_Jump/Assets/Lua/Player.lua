--人物逻辑
Play = {}
require('Continue')
require('Music')
local this = Play
local player
local head
local body
local rigidbody
local name
local cameraRelativePosition
local particle
local ui
local manager
function this.Awake(obj)
	Time.timeScale = 1
	manager = GameObject.Find('Manager')
	player = obj
	ui = player.transform : Find('UI').gameObject
	head = player.transform : Find('Head').gameObject
	body = player.transform : Find('Body').gameObject
	rigidbody = player : GetComponent('Rigidbody')
	particle = GameObject.Find('Particle')
	particle : GetComponent('ParticleSystem') : Stop()
	--相机相对角色位置
	cameraRelativePosition = Camera.main.transform.position - player.transform.position
end

function this.Update()
	if Input.GetKeyDown(KeyCode.Space) then
		particle : GetComponent('ParticleSystem') : Play()
		startTime = Time.time--获取按下空格时的时间
	end

	if Input.GetKeyUp(KeyCode.Space) then
		--DoTween恢复人物
		Util.DoScale(body, 0.1, 0.5)
		Util.DoLocalMoveY(head, 0.8, 0.5)
		particle : GetComponent('ParticleSystem') : Stop()
		endTime = Time.time - startTime--计算按下空格至松开的时间
		this.StartJump(endTime)
	end

	if Input.GetKey(KeyCode.Space) then
		--人物压缩效果
		if body.transform.localScale.y < 0.11 and body.transform.localScale.y > 0.05 then
			body.transform.localScale = body.transform.localScale + Vector3(1, -1, 1) * 0.05 * Time.deltaTime
			head.transform.localPosition = head.transform.localPosition + Vector3(0, -1, 0) * 0.05 * Time.deltaTime
		end
	end

end

function this.StartJump(time)
	--跳跃逻辑
	rigidbody : AddForce(Vector3(1, 1, 0) * time * 7, UnityEngine.ForceMode.Impulse)

end

--如果跳到此盒子，便给该盒子添加脚本，并移动摄像机
function this.OnCollisionStay(object)
	if object.transform.tag == 'Cube' then
		if(object : GetComponent('BoxControl') == nil) then
			this.CameraMove()
			object : AddComponent(typeof(BoxControl))
		end
	elseif object.transform.tag == 'Plane' then
		--重新开始游戏
		Time.timeScale = 0
		ui : SetActive(true)
		Continue.ReStart(ui)
	end

end

function this.CameraMove()
	--DoTween控制摄像机移动效果
	Util.DoMove(Camera.main, (player.transform.position + cameraRelativePosition), 1)
end


