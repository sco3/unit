#!/usr/bin/env -S uv run

#import uvicorn
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello, Fastapi!"}

