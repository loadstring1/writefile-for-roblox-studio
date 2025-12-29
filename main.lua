local http=game:GetService("HttpService")

local function request(body,param)
	return pcall(function()
		return http:RequestAsync({
			Url=`http://localhost:6969/{param}`,
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
	},"writefile")
end

local function readfile(name)
	return request({
		fileName=name,
	},"readfile")
end

writefile("hello.txt","hello from roblox studio!")

local success,file=readfile("hello.txt")

if success==false or file.Success==false then
	return error(`failed to read file! {file.Body}`)
end

print(file.Body) --hello from roblox studio!