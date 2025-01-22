async def app(scope, receive, send):

    await send({
        'type': 'http.response.start',
        'status': 200
    })

    await send({
        'type': 'http.response.body',
        'body': b'Hello, ASGI\n'
    })
