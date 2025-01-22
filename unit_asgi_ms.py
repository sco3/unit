#!/usr/bin/env -S uv run

import granian
from fastapi import FastAPI


app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello, Fastapi!"}


if __name__ == "__main__old":
    uvicorn.run(
        "unit_asgi_ms:app",
        host="0.0.0.0",
        port=8000,
        reload=False,
        log_level="error",
    )


if __name__ == "__main__":
    server = granian.server.Granian(
        target="unit_asgi_ms:app",
        interface=granian.constants.Interfaces.ASGI,
        address="0.0.0.0",
        port=8000,
        workers=4,
    )
    server.serve()
