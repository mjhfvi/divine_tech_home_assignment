import os
import logging
from fastapi import FastAPI
from azure.identity import DefaultAzureCredential
from azure.servicebus import ServiceBusClient, ServiceBusMessage
from azure.keyvault.secrets import SecretClient

# Environment variables
SERVICE_BUS_NAMESPACE = os.environ.get("SERVICE_BUS_NAMESPACE", "no-value-found")
KEY_VAULT_URL = os.environ.get("KEY_VAULT_URL", "no-value-found")
QUEUE_NAME = os.environ.get("QUEUE_NAME", "no-value-found")

## API code
app = FastAPI()

credential = DefaultAzureCredential()

# Service Bus
servicebus = ServiceBusClient(
    fully_qualified_namespace=SERVICE_BUS_NAMESPACE,
    credential=credential,
)

# Running API Health Check
@app.get("/health")
def health():
    return {"status": "ok"}

# Running API Webhook Endpoints
@app.post("/webhook/message")
def webhook(message: dict):
    sender = servicebus.get_queue_sender(QUEUE_NAME)
    sender.send_messages(
        ServiceBusMessage(str(message))
    )
    sender.close()
    return {"status": "queued"}

## Worker code
# Logs
logging.basicConfig(level=logging.INFO)

# Azure Credentials
credential = DefaultAzureCredential()

# Key Vault
kv = SecretClient(
    vault_url=KEY_VAULT_URL,
    credential=credential,
)

# ai_api_key = kv.get_secret("AI_API_KEY").value

# Service Bus
servicebus = ServiceBusClient(
    fully_qualified_namespace=SERVICE_BUS_NAMESPACE,
    credential=credential,
)

receiver = servicebus.get_queue_receiver(
    queue_name=QUEUE_NAME,
    max_wait_time=30,
)

# Worker Start Logs
logging.info("Worker started")

# Running Worker
while True:
    messages = receiver.receive_messages(
        max_message_count=10,
        max_wait_time=30,
    )
    for message in messages:
        logging.info("Received message: %s", str(message))
        logging.info("AI_API_KEY loaded from Key Vault")
        receiver.complete_message(message)
