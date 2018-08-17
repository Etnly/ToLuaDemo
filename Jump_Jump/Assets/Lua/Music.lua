--协程下载
--这里使用Tolua中提供的coroutine.www
Music = {}
local this = Music
function this.PlaySound()
    local audio = GameObject.Find('Manager') : GetComponent('AudioSource')
    local url = www('https://etnly.oss-cn-shanghai.aliyuncs.com/%E5%B2%A1%E9%83%A8%E5%95%93%E4%B8%80%20-%20%E9%81%BA%E3%82%B5%E3%83%AC%E3%82%BF%E5%A0%B4%E6%89%80%EF%BC%8F%E6%96%9C%E5%85%89.ogg')
    coroutine.www(url)
    audio.clip = url : GetAudioClip()
    audio : Play()
end