#!/usr/bin/env -S uv run

import uvicorn
import uvloop
import asyncio
import sys
from typing import Any, Dict

async def app(scope: Dict[str, Any], receive: Any, send: Any) -> None:
    assert scope["type"] == "http"

    await send(
        {
            "type": "http.response.start",
            "status": 200,
            "headers": [
                [b"content-type", b"text/plain"],
            ],
        }
    )

    await send(
        {
            "type": "http.response.body",
            "body": b"Hello, World!\n",
        }
    )


if __name__ == "__main__":
    uvicorn.run(
        "main_uvicorn:app",
        host="0.0.0.0",
        port=8000,
        reload=False,
        log_level="error",
    )
