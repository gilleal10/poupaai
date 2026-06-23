import google.generativeai as genai
import fitz  # PyMuPDF
import os
import json

# Setup Gemini (Needs API key in env vars)
genai.configure(api_key=os.environ.get("GEMINI_API_KEY", "dummy"))

def process_receipt_image(image_bytes):
    """
    Usa a API do Gemini Vision para analisar a foto do recibo/cupom fiscal.
    """
    try:
        model = genai.GenerativeModel('gemini-1.5-flash')
        prompt = "Analise este comprovante fiscal. Extraia e retorne APENAS um JSON válido com as seguintes chaves: 'valor' (float), 'estabelecimento' (string), 'data' (formato YYYY-MM-DD)."
        
        response = model.generate_content([
            {'mime_type': 'image/jpeg', 'data': image_bytes},
            prompt
        ])
        
        # Strip markdown if any
        json_str = response.text.replace("```json", "").replace("```", "").strip()
        return json.loads(json_str)
    except Exception as e:
        print(f"Error processing image: {e}")
        return {"valor": 0.0, "estabelecimento": "Erro de Leitura", "data": ""}

def process_credit_card_pdf(pdf_bytes):
    """
    Lê o PDF da fatura e extrai o histórico.
    """
    try:
        doc = fitz.open(stream=pdf_bytes, filetype="pdf")
        text = ""
        for page in doc:
            text += page.get_text()
        
        model = genai.GenerativeModel('gemini-1.5-flash')
        prompt = f"Leia este texto extraído de uma fatura de cartão. Retorne APENAS um JSON contendo 'total_fatura' (float) e uma lista 'transacoes' com objetos contendo 'descricao', 'valor' e 'data'. Texto: {text[:3000]}"
        
        response = model.generate_content(prompt)
        json_str = response.text.replace("```json", "").replace("```", "").strip()
        return json.loads(json_str)
    except Exception as e:
        print(f"Error processing PDF: {e}")
        return {"total_fatura": 0.0, "transacoes": []}
