from fastapi import FastAPI, UploadFile, File, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from services.ai_mentor import generate_diagnostic, chat_with_mentor
from services.debt_analysis import calculate_cet_newton_raphson, compare_with_market_rates
from services.vision_parser import process_receipt_image, process_credit_card_pdf
from services.auth import get_password_hash, verify_password, create_access_token
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

@app.post("/api/upload-receipt")
async def upload_receipt(file: UploadFile = File(...)):
    contents = await file.read()
    data = process_receipt_image(contents)
    return {"status": "sucesso", "dados_extraidos": data}

@app.post("/api/upload-invoice")
async def upload_invoice(file: UploadFile = File(...)):
    contents = await file.read()
    data = process_credit_card_pdf(contents)
    return {"status": "sucesso", "dados_extraidos": data}

fake_users_db = {}
class UserCreate(BaseModel):
    email: str
    password: str

@app.post("/api/register")
def register(user: UserCreate):
    if user.email in fake_users_db:
        raise HTTPException(status_code=400, detail="Email já cadastrado")
    fake_users_db[user.email] = {"email": user.email, "hashed_password": get_password_hash(user.password)}
    return {"message": "Usuário criado com sucesso"}

@app.post("/api/login")
def login(form_data: OAuth2PasswordRequestForm = Depends()):
    user_dict = fake_users_db.get(form_data.username)
    if not user_dict or not verify_password(form_data.password, user_dict["hashed_password"]):
        raise HTTPException(status_code=400, detail="Email ou senha incorretos")
    access_token = create_access_token(data={"sub": user_dict["email"]})
    return {"access_token": access_token, "token_type": "bearer"}

@app.get("/api/dashboard/summary")
def get_dashboard_summary():
    return {
        "current_month_expenses": 2500.00,
        "current_month_income": 5000.00,
        "next_month_projection": 3200.00,
        "fixed_expenses_next_month": 1500.00,
        "credit_card_installments_next_month": 1700.00
    }

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
