def generate_diagnostic(financial_data):
    """
    Mocks the AI module that generates an automatic diagnosis and a 90-day plan.
    """
    return {
        "status": "Atenção",
        "diagnosis": "Suas dívidas estão consumindo 40% da sua renda. O ideal é reduzir para menos de 30%.",
        "plan_90_days": [
            {"month": 1, "action": "Renegociar dívida do cartão de crédito", "target_saving_brl": 500.0},
            {"month": 2, "action": "Cortar assinaturas não utilizadas", "target_saving_brl": 150.0},
            {"month": 3, "action": "Iniciar reserva de emergência", "target_saving_brl": 300.0}
        ]
    }

def chat_with_mentor(message, history, personality="amigavel"):
    """
    Mocks the AI Chatbot interaction.
    """
    if personality == "cfo":
        return f"[CFO Implacável] Francamente... '{message}'? Seu dinheiro está indo pelo ralo. Precisamos estancar a sangria dessa sua dívida com 12% de CET imediatamente."
    else:
        return f"[Mentor Amigável] Olá! Sobre '{message}', entendo perfeitamente. Vamos juntos analisar seu orçamento com calma para ver como encaixar isso nos seus sonhos, combinado?"
