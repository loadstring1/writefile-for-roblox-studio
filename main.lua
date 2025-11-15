local http=game:GetService("HttpService")

local function request(body)
	return pcall(function()
		return http:RequestAsync({
			Url="http://localhost:6969/",
			Method="POST",
			Body=http:JSONEncode(body),
			Headers={["content-type"]="application/json"}
		})
	end)
end

local function writefile(name,data)
	return request({
		fileName=name,
		data=data
	})
end

writefile("hello.txt","hello from roblox studio!")