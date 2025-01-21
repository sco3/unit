#!/usr/bin/env -S uv run

import uvicorn
from fastapi import FastAPI


app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello, Fastapi!"}

if __name__ == "__main__":
    uvicorn.run(
        "unit_asgi_ms:app",
        host="0.0.0.0",
        port=8000,
        reload=False,
        log_level="error",
    )




