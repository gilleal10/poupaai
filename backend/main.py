from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from services.ai_mentor import generate_diagnostic, chat_with_mentor
from services.debt_analysis import calculate_cet_newton_raphson, compare_with_market_rates
import uvicorn

app = FastAPI(title="POUPAAI API", description="Backend for POUPAAI Personal Finance App", version="1.0.0")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class ChatMessage(BaseModel):
    message: str

@app.get("/")
def read_root():
    return {"mensagem": "Bem-vindo à API do POUPAAI"}

@app.get("/api/diagnostic")
def get_diagnostic():
    # Mock data for now
    return generate_diagnostic(None)

@app.get("/api/debts")
def get_debts():
    # Mock debt calculation
    cet = calculate_cet_newton_raphson(5000, 500, 12)
    market = compare_with_market_rates(cet)
    return {
        "debt_name": "Cartão de Crédito",
        "balance": 5000.0,
        "cet_monthly": round((cet or 0) * 100, 2),
        "market_comparison": market
    }

@app.post("/api/chat")
def post_chat(chat: ChatMessage):
    response = chat_with_mentor(chat.message, [])
    return {"reply": response}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
