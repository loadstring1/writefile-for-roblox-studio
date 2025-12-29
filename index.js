const express=require("express")
const fs=require("node:fs")
const server=express()

server.use(express.json({limit:"1gb"}))

const currentDir=process.cwd()

server.post("/readfile",(req,res)=>{
    const fileName=req.body.fileName
    res.status(200).sendFile(`${currentDir}/data/${fileName}`)
})

server.post("/writefile",(req,res)=>{
    const fileName=req.body.fileName
    const data=req.body.data
    
    fs.writeFileSync(`./data/${fileName}`,data)
    res.status(200).end("ok")
})

server.listen(6969,()=>{
    console.log("listening to http://localhost:6969/")
})