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

def chat_with_mentor(message, history):
    """
    Mocks the AI Chatbot interaction.
    """
    return "Como seu Mentor de IA, sugiro que você foque primeiro na dívida com maior CET. Vamos analisar o painel de dívidas?"
