from fastapi import FastAPI
import socket
import os

app = FastAPI()

@app.get("/")
def read_root():
    return {
        "message": "AWS Kubernetes Platform 🚀",
        "hostname": socket.gethostname(),
        "version": os.getenv("APP_VERSION", "v1")
    }