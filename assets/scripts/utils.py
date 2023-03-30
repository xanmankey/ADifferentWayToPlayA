from discord import channel, Client
import asyncio
from dotenv import load_dotenv

client = Client()
channelFuture = asyncio.Future()

@client.event
async def on_ready(id):
    channel = client.get_channel(id)
    if channel is None:
        return channelFuture.set_result(False)
    else: 
        return channelFuture.set_result(True)

async def checkToken():
    await client.start(load_dotenv('assets/scripts/.env')['TOKEN'])
    isTC = await channelFuture
    return isTC
